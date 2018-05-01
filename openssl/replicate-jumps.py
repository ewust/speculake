#!/usr/bin/python

import sys
import re



jumps = []  # (from, to)

instrs = {} # addr => instr

ret_stack = []  # list of indirect jump targets

# Lines look like:
# 1 (I.) 0x7ffff77eb240->0x7ffff77e3d82:    retq   
#22 (Dt) 0x7ffff77e3dc7->0x7ffff77e7cc0:    callq  0x7ffff77e7cc0 <BN_CTX_end>


jumps = {} # addr => [(bool indirect, bool taken, int next_addr)]
instrs = {} # addr => instr
entries = {} # addr => [list of source addresses that jump here]
#line_nums = {} # addr => [line_numbers]

hit_instructions = set() # list of addresses that are actually run

p = re.compile('(\d+) \(([ID])([tn\.])\) (0x[0-9a-f]+)->(0x[0-9a-f]+):\s+(.*)')

prev_addr = None

for line in sys.stdin:
    m = p.match(line)
    if m is None:
        continue

    line_num = int(m.group(1))
    indirect = m.group(2) == 'I'
    taken = m.group(3) == 't'
    addr = int(m.group(4),16)
    next_addr = int(m.group(5),16)
    instr = m.group(6)

    hit_instructions.add(addr)
    if prev_addr is not None:
        for a in xrange(prev_addr, addr):
            hit_instructions.add(a)

    prev_addr = next_addr

    instrs[addr] = instr
    if addr not in jumps:
        jumps[addr] = []
    jumps[addr].append((indirect, taken, next_addr))

    if indirect:
        ret_stack.append(next_addr)

    if next_addr not in entries:
        entries[next_addr] = []
    entries[next_addr].append(addr)


addrs = sorted(instrs.keys())
print '# 0x%08x -> 0x%08x spans %d bytes' % (addrs[0], addrs[-1], addrs[-1]-addrs[0])

for addr in addrs:
    sources = 0
    if addr in entries:
        sources = len(entries[addr])
    print '# 0x%08x  %d sources, dests: %s %s' % \
            (addr, sources, ','.join(['0x%08x' % a[2] for a in jumps[addr]]), instrs[addr])


class Instructions(object):
    def __init__(self, start_addr=0x0, hit_instrs=None):
        self.instrs = []    # (int addr, string instr)
        self.addr = start_addr
        self.last_nops = 0  # number of contiguous nops
        self.hit_instrs = hit_instrs

    def add_instr(self, instr, instr_len=1, is_nop=False, comment=''):
        self.instrs.append((self.addr, ' ' + instr + '   # 0x%08x %s' % (self.addr, comment)))
        self.addr += instr_len
        if is_nop:
            self.last_nops += 1
        else:
            self.last_nops = 0

    def add_nop(self):
        self.add_instr('nop', is_nop=True)

    def get_offset(self, dest, conditional=True):
        offset = dest - self.addr
        off = offset
        sign = '+'
        l = 2
        if off < 0:
            sign = ''
            l = 6 if conditional else 5
        elif off > 127:
            l = 6 if conditional else 5  # TODO: check?
        return ('.%s%d' % (sign, off), l)

    def add_jmpq(self, dest, comment=''):
        # Get offset for relative jump
        offset, l = self.get_offset(dest, False)
        self.add_instr('jmp  %s' % (offset), instr_len=l)

    def add_not_taken(self, dest, instr_len=2, comment=''):
        # We use the overflow flag, which we always assume to be zero.
        # to get a not-taken branch, we check for OF=1 (jo).
        # Taken branches are with OF=0 (jno).
        offset, instr_len = self.get_offset(dest)
        self.add_instr('jo  %s' % offset, instr_len=instr_len, comment=comment)

    def add_taken(self, dest, comment=''):
        offset, l = self.get_offset(dest)
        # TODO: some of these lengths aren't right...sometimes it's 6 bytes?
        self.add_instr('jno  %s' % (offset), instr_len=l, comment=comment)

    def add_ret(self, dest, comment=''):
        self.add_instr('ret', comment=comment)

    # calls trim for you...
    def bitmask_jump(self, dest, idx, comment=''):
        offset, jmp_len = self.get_offset(dest)
        self.trim(9)
        self.add_instr('mov %d(%%rsi),%%eax' % (idx*4), instr_len=3, comment=comment)
        self.add_instr('sarl %d(%%rsi)' % (idx*4),      instr_len=3)
        self.add_instr('and  $0x1,%eax',                instr_len=3)
        # and already sets ZF the way we want
        #self.add_instr('test %eax,%eax',                instr_len=2)
        self.add_instr('jne %s' % (offset),             instr_len=jmp_len)


    # removes the last n instructions, throws an exception if
    # they are not all nops
    def trim(self, n):
        if n > self.last_nops:
            #raise Exception('Error: not enough nops (only %d)' % (self.last_nops))
            self.instrs.append((None, ' #  Error: not enough nops can be deleted...'))
            return

        self.last_nops -= n
        self.addr -= n
        self.instrs = self.instrs[:-n]

    def __str__(self):
        if self.hit_instrs is None:
            return '\n'.join([a[1] for a in self.instrs])

        last_in = False
        out = ''
        for addr, instr in self.instrs:
            if addr not in self.hit_instrs:
                last_in = False
                continue


            if not(last_in):
                # Print a label, pick up where we left off
                name = 'addr_0x%08x' % addr
                out += '''\n
.section .%s, "ax"
.global %s
.type %s, @function
%s:\n''' % (name, name, name, name)
            last_in = True
            out += instr + '\n'
        return out


    # Returns a list of series of load_page/memcpy calls
    # that would load the code (returned in __str__())
    # to the proper addresses
    def get_fns(self):
        last_in = False
        out = ''
        this_addr = None
        this_len = 0
        loaded_pages = set()
        prototypes = ''
        for addr, instr in self.instrs:
            if addr not in self.hit_instrs:
                if this_addr is not None:
                    page = this_addr & ~(4096-1)
                    if page not in loaded_pages:
                        out += 'load_page(0x%08x);\n' % (this_addr & ~(4096-1))
                        loaded_pages.add(page)
                    out += 'memcpy((void*)0x%08x, addr_0x%08x, %d);\n' % \
                            (this_addr, this_addr, addr - this_addr)
                    prototypes += 'void addr_0x%08x();\n' % this_addr

                last_in = False
                this_addr = None
                continue


            if not(last_in):
                # Print a label, pick up where we left off
                this_addr = addr
                this_len = 0

            last_in = True
            this_len += 1
        return prototypes + '\n\n' + out

    # Returns a list of series of linker script directives
    # that would load the code (returned in __str__())
    # to the proper addresses
    def get_linkers(self):
        last_in = False
        out = ''
        this_addr = None
        this_len = 0
        loaded_pages = set()
        #.addr_0x7ffff77e339c  0x5e339c: { *addr_0x7ffff77e339c.* }
        for addr, instr in self.instrs:
            if addr not in self.hit_instrs:
                if this_addr is not None:

                    out += '.addr_0x%08x   0x%06x: { *addr_0x%08x.* }\n' % \
                            (this_addr, 0x500000 | (this_addr & 0xfffff), this_addr)

                last_in = False
                this_addr = None
                continue


            if not(last_in):
                # Print a label, pick up where we left off
                this_addr = addr
                this_len = 0

            last_in = True
            this_len += 1
        return out





code = Instructions(addrs[0], hit_instructions)

bitmask_jumps = {}  # addr => (bitmask, index)


#for addr in range(addrs[0], addrs[-1]+1):
while code.addr <= addrs[-1]:
    addr = code.addr
    info = ''
    if addr in instrs:
        info = '0x%08x  %d sources, dests: %s %s' % \
            (addr, sources, ','.join(['0x%08x' % a[2] for a in jumps[addr]]), instrs[addr])


    if addr not in instrs:
        code.add_nop()
    elif 'jmp' in instrs[addr]: # and not indirect...
        # Delete last 4 nops...(make sure they're nops?)
        #code.trim(4)
        code.add_jmpq(jumps[addr][0][2], info)
    elif all([not(indirect) and taken for (indirect, taken, dest) in jumps[addr]]):
        # If all direct taken branches
        # All callq's end here, as well.
        # we'll special-case those to a direct jmp:
        if 'call' in instrs[addr]:
            code.add_jmpq(jumps[addr][0][2], info)
        else:
            code.add_taken(jumps[addr][0][2], info)
    elif all([not(indirect) and not(taken) for (indirect, taken, dest) in jumps[addr]]):
        # If all direct and NOT taken branches
        # get what the target WOULD have been from the instruction
        target = int(instrs[addr].split()[1][2:],16)
        code.add_not_taken(target, comment=info)
    elif all([indirect for (indirect, taken, dest) in jumps[addr]]):
        # All indirect
        code.add_ret(jumps[addr][0][2], info)
    else:
        # Where would this jump if it's taken?
        dest_addr = None
        for indirect, taken, dest in jumps[addr]:
            if not(indirect) and taken:
                dest_addr = dest

        # This bitmask defines the pattern this (direct) branch should be taken/not taken
        # e.g. 0x05 would be taken, not taken, taken, not taken, not taken, not taken, ...
        # (from LSB to MSB)
        bitmask = [1 if taken else 0 for (indirect, taken, dest) in jumps[addr]]
        bitmask = sum([a*2**i for (i, a) in enumerate(bitmask)])

        # We store this bitmask (which gets updated) at 4*idx+%rsi.
        # for unique per-branch idx.
        # HACK: start idx from non-zero, otherwise mov (%rsi) is 2-bytes
        # instead of 3.
        idx = len(bitmask_jumps) + 1
        bitmask_jumps[addr] = (bitmask, idx)

        code.bitmask_jump(dest_addr, idx, comment='Bitmask jump[%d]: %s' % (idx, info))





print '''

.section .text
.global do_pattern
do_pattern:
    add   $0x50, %rsp
    mov   %rsp,  %rsi
    callq pattern_setup
    sub   $0x50, %rsp
/*
# We're going to assume that pattern_setup gets called with rsi set to
# an array of bitfields for the direct jumps that aren't statically taken
# the same each iteration.
#
# At 4*N(%rsi) will be a 32-bit mask that from LSBit to MSBit specifies
# if the (Nth) branch should be taken (1) or not (0). E.g. 0x07 will be
# taken 3 times, then not taken.
# This logic takes ~11 bytes, plus the 2+ bytes for the direct branch.
# Hope you left room!! With more clever coding, maybe this could be cut down
# or even moved to elsewhere.
#
# Note: We use the test instruction, which messes with ZF,CF,SF but always
# sets OF=0. This means that for our direct unidirectional branches, we can
# use jno for always taken, and jo for always not taken.
*/
'''

print 'pattern_setup:'
print '# Push indirect jumps to the stack'
# Setup pushes for retq instructions
for addr in ret_stack[::-1]:
    print 'movabs $0x%08x, %%rax' % (addr)
    print 'pushq %rax'

# Setup bitmask jumps
print ''
for addr in bitmask_jumps.keys():
    bitmask, idx = bitmask_jumps[addr]
    print 'movl $0x%08x,%d(%%rsi)' % (bitmask, 4*idx)

# clear OF
print 'test %eax,%eax'


# begin!
print 'jmp begin_pattern'


# Print the code
print ''
print 'begin_pattern:  # please link @0x%08x' % (addrs[0])
print str(code)


# In case you wanted to link stuff or load it dynamically
print ''
print '/*'
print code.get_fns()
#print code.get_linkers()
print '*/'









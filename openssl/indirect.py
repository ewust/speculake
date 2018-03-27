#!/usr/bin/python

import sys
import re



jumps = []  # (from, to)

instrs = {} # addr => instr

# Lines look like:
#=> 0x7ffff7bb4eb0 <SSL_new>:    push   %r12
#=> 0x7ffff7bb5d83:      test   %rax,%rax
# We'll break into 3 parts: address, (optional function name/offset), and instruction (after the ":\s+")
p = re.compile('=> (0x[0-9a-f]+)( <([_A-Za-z0-9+@]+)>)?:\s+(.*)')
instr = ''
addr = '0x00'
fn_name = None
line_count = -1 # because we print 1 instruction delayed to catch taken/not taken
for line in sys.stdin:
    line_count += 1
    m = p.match(line)
    if m is None:
        continue

    next_addr = m.group(1)

    instrs[addr] = instr
    if (instr.startswith('callq') and '*' in instr) or \
       (instr.startswith('jmpq') and '*' in instr) or \
       instr.startswith('retq'):
        print '%d (I.) %s->%s:    %s' % (line_count, addr, next_addr, instr)
        jumps.append((addr, next_addr))

    elif instr.startswith('callq') or instr.startswith('j'):
        jmp_addr = instr.split()[1]
        taken = (jmp_addr == next_addr)
        print '%d (D%s) %s->%s:    %s' % (line_count, 't' if taken else 'n', addr, next_addr, instr)

    addr = next_addr
    fn_name = m.group(3)
    instr = m.group(4)



#print len(instrs), " unique jump instructions"
#print len(jumps), " indirect jump occurances"

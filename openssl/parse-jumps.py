#!/usr/bin/python

import sys
import re

jumps = []  # list of (from, to) pairs
instrs = {} # addr => instr
line_nums = {} # addr => [line_numbers]

p = re.compile('(\d+) \(([ID])([tn\.])\) (0x[0-9a-f]+)->(0x[0-9a-f]+):\s+(.*)')
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


    instrs[addr] = instr
    if indirect:
        jumps.append((addr, next_addr, line_num))


    #print instr

# given two jumps[] arrays (addr, next_addr, line_num) tuples
# returns true if they have the same (addr, next_addr) pairs
def equiv(a, b):
    return [(x, y) for x, y, z in a] == [(x, y) for x, y, z in b]

def count_repeats(needle, haystack):
    repeats = 0
    offset = 0
    hs = [(x, y) for x, y, z in haystack]
    nd = [(x, y) for x, y, z in needle]
    repeat_starts = []
    try:
        while True:
            start = hs.index(nd[0], offset)
            if hs[start:start+len(nd)] == nd:
                repeat_starts.append(haystack[start][2])
                #repeats += 1
            offset = start + 1
    except ValueError:
        return repeat_starts


max_rep = 0
tot_repeats = []
for win in xrange(30, 100):
    print 'Window: %d jumps' % win
    for i in xrange(len(jumps)-win):
        #print i
        cur_window = jumps[i:i+win]

        repeats = count_repeats(cur_window, jumps[i+win:])
        #print rep
        if len(repeats) > max_rep and repeats[0] not in tot_repeats:
            print '==========='
            print '%d repeats:' % len(repeats)
            all_same = True
            first_addr, first_to_addr, x = cur_window[0]
            for addr, to_addr, line_num in cur_window:
                print '%d  0x%08x -> 0x%08x:   %s' % (line_num, addr, to_addr, instrs[addr])
                if not(first_addr == addr and first_to_addr == to_addr):
                    all_same = False
            print '----------'
            print repeats
            tot_repeats += repeats

            if not(all_same):
                max_rep = len(repeats)



print len(instrs)
print len(jumps)

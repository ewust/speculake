#!/usr/bin/python


NUM_ROUNDS = 10
BYTES_PER_ROUND = 1
NUM_LANDINGS = 2**(BYTES_PER_ROUND*8)

#payload_f = open('payload_target.S', 'w')
#trigger_f = open('trigger_jumps.S', 'w')

PAYLOAD = True

import sys
import random

if len(sys.argv) > 1 and sys.argv[1] == 'trigger':
    PAYLOAD = False

print '.section .targets, "ax"'
print '  .global targets'
print 'targets:'

targets_offset = 0x510000
addrs = []

for i in xrange(NUM_LANDINGS):
    # These are the addresses we want to jump to
    # Takes 14 instrs per
    addr = 0x16*i + targets_offset
    addrs.append((addr, i))

    # Can't just keep this in 64-bit register...
    #print '  movl $0x%04x, %%ebx' % (i)
    #print '  shl $0x%02x, %%rcx' % (BITS_PER_ROUND)
    #print '  xor %rbx, %rcx'

    print '  movl $0x%04x, %%ebx    # 0x%08x' % (i, addr)
    print '  movq %rbx, %xmm11'
    print '  pslldq $%d, %%xmm0' % (BYTES_PER_ROUND)
    print '  pxor %xmm11, %xmm0'


    if PAYLOAD:
        print '  jmpq *%rax'
    else:
        print '  retq'
        print '  nop'



print '''

# This function encrypts a counter (provided in %rdi)
# Using a pseudo-key derived from the value in %xmm0
# Returns a __uint128_t in %rax:%rdx
#
# This function assumes that you've jumped through some number
# of targets, and %rcx is set accordingly.
# We'll then derive %xmm0..10 round keys from %rcx (now in %rdi).
# Ideally, we could use some kind of hash function.
# But the speculative world doens't live that long,
# So we'll just use aesenc.

.section .encrypt, "ax"
  .global encrypt
encrypt:
    # Derive %xmm0...10 from %xmm0
    # Ideally, we'd treat xmm0 as an AES key
    # and do the normal AES key schedule.
    # Unfortunately, we don't have enough
    # speculative time to do full AES key schedule,
    # so we do this hack instead.
    # This is almost surely broken as crypto...
    # We might want to use aesimc here?
    movdqa %xmm0, %xmm15
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm1
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm2
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm3
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm4
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm5
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm6
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm7
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm8
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm9
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm10
    aesenc %xmm0, %xmm0

    # Load counter into xmm15
    movq %rdi, %rax
    bswap %rax
    movq %rax, %xmm15

    # encrypt counter
    pxor %xmm0, %xmm15
    aesenc %xmm1, %xmm15
    aesenc %xmm2, %xmm15
    aesenc %xmm3, %xmm15
    aesenc %xmm4, %xmm15
    aesenc %xmm5, %xmm15
    aesenc %xmm6, %xmm15
    aesenc %xmm7, %xmm15
    aesenc %xmm8, %xmm15
    aesenc %xmm9, %xmm15
    aesenclast %xmm10, %xmm15

    # Xor keystream with ciphertext
    mov $ctext, %rcx
    imul $0x10, %rdi
    addq %rcx, %rdi
    movaps 0x00(%rdi), %xmm14
    pxor %xmm14, %xmm15

    # return __uint128_t in rax:rdx
    movq %xmm15, %rdx
    psrldq $0x8, %xmm15
    movq %xmm15, %rax
    ret


# We need a wrapper to encrypt() that in
# payload takes the output and sends the result of the byte
# all of the functions on the way here have kept a uint64_t ctr
# argument in %rdi.
.global encrypt_wrap
encrypt_wrap:

    mov %rdi, %rbx
    shr $0x4,%rdi   # divide ctr by 16
    callq encrypt


    and $0xf,%ebx       # ctr % 16
    shl $3, %ebx        # *8

    mov %ebx,%ecx       # put into %cl
    shrd %cl,%rax,%rdx
    shr  %cl,%rax
    test $0x40,%cl
    je lower_bits
    mov %rax, %rdx
lower_bits:
    mov %rdx, %rax
    and $0xff, %eax     # just one byte, plz

    # for trigger, we'll return this byte.

    # for payload, we'll signal it via our cache side channel
    # ...
'''

# end of encrypt_wrap:
if not(PAYLOAD):
    print '  # This is trigger:'
    print '  ret'
    # we could return xmm15 as a __uint128_t in rax:rdx
    # (if we remove the previous psrldq)
    #movq %xmm15, %rdx
    #psrldq $0x8, %xmm15
    #movq %xmm15, %rax
else:
    # Payload cache side channel
    print '  # This is payload:'
    print '  mov $0x480000, %rdx    # probe_buf'
    print '  mov $0x480010, %rbx    # cur_probe_space'
    print '  imul %rax, %rbx        # cur_probe_space*pt_byte'
    print '  add %rbx, %rdx         # +probe_buf'
    print '  mov (%rdx),%rax        # load something in cache'
    print '  nop                    # celebratory nop'
    print '  retq                   # in case you actually called this'


if PAYLOAD:
    ##########
    # Payload
    ##########
    print '  .global setup_indirect'
    print 'setup_indirect:'

    # Calle save rbx
    print '  push   %rbp'
    print '  mov	%rsp,%rbp'
    print '  push	%rbx'
    print '  sub	$0x18,%rsp'

    for i in xrange(11):
        print '  pxor %%xmm%d, %%xmm%d' % (i, i)

    # Call and then restore
    print '  callq indirect'
    print '  add $0x18, %rsp'
    print '  pop %rbx'
    print '  pop %rbp'
    print '  retq'


else:
    ##########
    # Trigger
    ##########
    # Print out a selection of locations we'll jump to
    print '  .global setup_jumps'
    print 'setup_jumps:'

    # Set %rdi to the counter
    # Actually, don't. let it be passed in as an argument from do_jumps()
    #print '  xor %rdi, %rdi'

    # Clear xmm0..10
    for i in xrange(11):
        print '  pxor %%xmm%d, %%xmm%d' % (i, i)

    # First push is the call to decrypt
    print '  movabs $encrypt_wrap, %rax'
    print '  push %rax'

    for i in xrange(NUM_ROUNDS):
        addr, n = random.choice(addrs)
        print '  movabs $0x%08x, %%rax   # 0x%04x' % (addr, n)
        print '  push %rax'

    print '  jmp indirect'


    print '  .global do_jumps'
    print 'do_jumps:'

    # Setup stack/callee saved things here
    print '  push   %rbp'
    print '  mov	%rsp,%rbp'
    print '  push	%rbx'
    print '  sub	$0x18,%rsp'

    print '  callq setup_jumps'
    print '  add $0x18, %rsp'
    print '  pop %rbx'
    print '  pop %rbp'
    print '  retq'



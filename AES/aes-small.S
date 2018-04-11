.data
key_schedule:
    .zero 160

plaintext:
    #.quad 0x9397585326594131, 0xefbeadde0df0ad8b # correct ordering, so no swapping necessary in code
	.byte 0x31, 0x41, 0x59, 0x26, 0x53, 0x58, 0x97, 0x93
	.byte 0x8b, 0xad, 0xf0, 0x0d, 0xde, 0xad, 0xbe, 0xef

key:
    #.quad 0x0706050403020100, 0x0f0e0d0c0b0a0908
	.byte 0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
	.byte 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f

format:
	.asciz "0x%016lx%016lx\n"
    #.asciz "0x%08x%08x%08x%08x\n"

.align 16
ctext:
    .quad 0x6de522593acb0c4d, 0xea4f90f244d80e5e

     .quad 0x4f39d1036e23d168, 0x110bb8331857beab
     .quad 0x4222767b16132770, 0xb5e48c71a11477a6
     .quad 0x1016b25119691507, 0x61a1f146cd8973a0
     .quad 0x2854bf4d097d217b, 0x321d4f2b76f9ce5e
     .quad 0xf370ff15613730f3, 0x9d612266ed57f80c
     .quad 0x11b9bc985c189360, 0xf0728d2994ce33f3
     .quad 0x23c04d34eb33f981, 0x7fa742caebe210c5
     .quad 0x7bfb1d172636a24c, 0x47d8bd77a4f00e84
     .quad 0x4fe648e4c83637f6, 0x13358ae725767fa2
     .quad 0xee40eff90bc3b486, 0x923742fbc75fbfbd
     .quad 0x16afce9d30534c3d, 0x8261ffa897eac18e
     .quad 0xcf7514290e98d261, 0x9d7344bc2205317e
     .quad 0x4f3d798ab9f2349d, 0x4d5075ac25ba5ee6
     .quad 0x3bf076ca857f1caf, 0x9870f0533a0e97d8
     .quad 0x10b8f7fb0b5646c0, 0x400e9918c2dcc376
     .quad 0x08844c7d248c32a2, 0xf3e2a43186920fc7



.text
.global aes_ctr
aes_ctr:
	/* %rdi : counter value to encrypt
	   %xmm0: AES-128 key

	*/

	// Initialize counter
    movq %rdi, %xmm15

	##########
	# Round 0
	##########
    pxor %xmm0, %xmm15

	##########
	# Round 1
	##########
	aeskeygenassist $0x1, %xmm0, %xmm13
	#call key_expansion_128
	    pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

    aesenc %xmm0, %xmm15

	##########
	# Round 2
	##########
    aeskeygenassist $0x2,  %xmm0, %xmm13
    #call key_expansion_128
	    pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

    aesenc %xmm0, %xmm15

	##########
	# Round 3
	##########
    aeskeygenassist $0x4,  %xmm0, %xmm13
	#call key_expansion_128
    	pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

    aesenc %xmm0, %xmm15

	##########
	# Round 4
	##########
    aeskeygenassist $0x8,  %xmm0, %xmm13
    #call key_expansion_128
     	pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

   aesenc %xmm0, %xmm15

	##########
	# Round 5
	##########
    aeskeygenassist $0x10, %xmm0, %xmm13
    #call key_expansion_128
        pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

	aesenc %xmm0, %xmm15

	##########
	# Round 6
	##########
    aeskeygenassist $0x20, %xmm0, %xmm13
    #call key_expansion_128
     	pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

   aesenc %xmm0, %xmm15

	##########
	# Round 7
	##########
    aeskeygenassist $0x40, %xmm0, %xmm13
    #call key_expansion_128
     	pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

   aesenc %xmm0, %xmm15

	##########
	# Round 8
	##########
    aeskeygenassist $0x80, %xmm0, %xmm13
    #call key_expansion_128
     	pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

   aesenc %xmm0, %xmm15

	##########
	# Round 9
	##########
    aeskeygenassist $0x1b, %xmm0, %xmm13
    #call key_expansion_128
     	pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

   aesenc %xmm0, %xmm15

	##########
	# Round 10
	##########
    aeskeygenassist $0x36, %xmm0, %xmm13
    #call key_expansion_128
	    pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
	    movdqa %xmm0, %xmm14
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pslldq $4,     %xmm14
	    pxor   %xmm14, %xmm0
	    pxor   %xmm13, %xmm0

	aesenclast %xmm0, %xmm15

	/* save regs and call print */
	/*
	push %rbp
	push %rdi
	movaps %xmm15, %xmm12
	call print
	pop %rdi
	pop %rbp
	*/

    // Xor with ctext
    imul $0x10, %rdi
    movaps ctext(%rdi), %xmm14
    pxor %xmm14, %xmm15

	//movaps %xmm15, %xmm12
	//call print

    // return __uint128_t in rax,rdx
    movq %xmm15, %rdx
    psrldq $0x8, %xmm15
    movq %xmm15, %rax

    ret





.text
.global main
main:
    # normal function set-up
    pushq   %rbp
	movq	%rsp, %rbp

	pushq $0x00	 # segfaults if we don't do this, and call printf...i don't know. stacks are weird.

	# aes_ctr(0xe, key)
	movq $0xe, %rdi
    movdqu (key), %xmm0

	call aes_ctr

	# print result
	movq %rax, %xmm12
	pslldq $0x08, %xmm12
	movq %rdx, %xmm13
	addps %xmm13, %xmm12
	call print

	leave
	ret


# inputs %xmm12, %xmm13, outputs to %xmm12
key_expansion_128:
    pshufd $255,   %xmm13, %xmm13	 # copy the upper32 bits to all 32-bit words in xmm13
    movdqa %xmm12, %xmm14
    pslldq $4,     %xmm14
    pxor   %xmm14, %xmm12
    pslldq $4,     %xmm14
    pxor   %xmm14, %xmm12
    pslldq $4,     %xmm14
    pxor   %xmm14, %xmm12
    pxor   %xmm13, %xmm12

    ret


# swaps 64-bit chunks in %xmm12
# If		xmm12 = 0x0f0e0d0c0b0a09080706050403020100
# returns	xmm12 = 0x07060504030201000f0e0d0c0b0a0908
swap_chunks:
    movq %xmm12, %r8
    psrldq $8, %xmm12
    movq %xmm12, %r9
    push %r8
    push %r9
    movdqu (%rsp), %xmm12
    add $0x10, %rsp
    ret

# prints %xmm12 in big-endian form
print:
    movq $format, %rdi

	movq %xmm12, %rsi
	bswap %rsi

	psrldq $8, %xmm12
	movq %xmm12, %rdx
	bswap %rdx

    call printf
    movq $0, %rax
    ret

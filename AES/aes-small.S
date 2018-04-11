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

ctext:
	.byte 0x00

#round_key:
#    .quad 0x4869285368617929, 0x5b477565726f6e5d 
#state:
#    .quad 0x7b5b546573745665, 0x63746f725d53475d



.text
.global aes_ctr
aes_ctr:
	/* %rdi : counter value to encrypt
	   %xmm0: AES-128 key
	*/

	// Initialize counter
    movq %rdi, %rax
    bswap %rax
    movq %rax, %xmm15

	// Keep copy in xmm0
	movdqa %xmm0, %xmm12
    pxor %xmm0, %xmm15

	aeskeygenassist $0x1, %xmm12, %xmm13
	call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x2,  %xmm12, %xmm13
    call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x4,  %xmm12, %xmm13
    call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x8,  %xmm12, %xmm13
    call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x10, %xmm12, %xmm13
    call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x20, %xmm12, %xmm13
    call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x40, %xmm12, %xmm13
    call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x80, %xmm12, %xmm13
    call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x1b, %xmm12, %xmm13
    call key_expansion_128
    aesenc %xmm12, %xmm15

    aeskeygenassist $0x36, %xmm12, %xmm13
    call key_expansion_128
	aesenclast %xmm12, %xmm15


	movaps %xmm15, %xmm12
	call print

	/*
    // Xor with ctext
    mov $ctext, %rcx
    imul $0x10, %rdi
    addq %rcx, %rdi
    movaps 0x00(%rdi), %xmm14
    pxor %xmm14, %xmm15

    // return __uint128_t in rax,rdx
    movq %xmm15, %rdx
    psrldq $0x8, %xmm15
    movq %xmm15, %rax
	*/
    ret




.text
.global main
main:
    # normal function set-up
    pushq   %rbp



    movdqu (key), %xmm1

    # store the original key for key-whitening, chunks are in wrong order though
    movdqa %xmm1, %xmm12 
    movdqa %xmm12, %xmm0

	movq $0x0, %rdi
	call aes_ctr

	popq %rbp
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

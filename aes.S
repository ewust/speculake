.data
key_schedule:
    .zero 160

plaintext:
    .quad 0x8badf00ddeadbeef, 0x3141592653589793

key:
    # .quad 0xfedcba9876543210, 0x123456789abcdef0
    # .quad 0x0001020304050607, 0x08090a0b0c0d0e0f
    .quad 0x0706050403020100, 0x0f0e0d0c0b0a0908
    # .quad 0x0f0e0d0c0b0a0908, 0x0706050403020100
    # .quad 0x0302010007060504, 0x0b0a09080f0e0d0c
    # .quad 0xffffffffffffffff, 0xffffffffffffffff

format:
    .asciz "0x%08x%08x%08x%08x\n"

.text
.global main
main:
    # normal function set-up
    pushq   %rbp
    movq    %rsp, %rbp

    movq $key, %rbx
    movdqu (%rbx), %xmm1

    movdqa %xmm1, %xmm0 # store the original key for key-whitening
    movq $key_schedule, %rcx

    # now do key-gen
    aeskeygenassist $0x1,  %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x2,  %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x4,  %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x8,  %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x10, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x20, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x40, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x80, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x1b, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x36, %xmm1, %xmm2
    call key_expansion_128

    # load keys into registers, whitening is in xmm0, rest will be in xmm1-10
    movq $key_schedule, %rcx

	# TODO: move this to a function, do it for each subkey
	movq (%rcx), %rax
	bswap %rax
	push %rax
	movq 0x08(%rcx), %rax
	bswap %rax
	push %rax
	movdqu (%rsp), %xmm1
	add $0x10, %rsp




    movdqu (%rcx),     %xmm1
    movdqu 0x10(%rcx), %xmm2
    movdqu 0x20(%rcx), %xmm3
    movdqu 0x30(%rcx), %xmm4
    movdqu 0x40(%rcx), %xmm5
    movdqu 0x50(%rcx), %xmm6
    movdqu 0x60(%rcx), %xmm7
    movdqu 0x70(%rcx), %xmm8
    movdqu 0x80(%rcx), %xmm8
    movdqu 0x90(%rcx), %xmm10

    # key is now expanded, do encryption
    movq $plaintext, %rdi
    movdqu (%rdi), %xmm15
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

    movq $format, %rdi
    movq %xmm15, %r8
    psrldq $4, %xmm15
    movd %xmm15, %ecx
    psrldq $4, %xmm15
    movd %xmm15, %edx
    psrldq $4, %xmm15
    movd %xmm15, %esi
    movq $0, %rax
    call printf

    leave
    ret

key_expansion_128: 
    pshufd $255,  %xmm2, %xmm2 
    movdqa %xmm1, %xmm3       
    pslldq $4,    %xmm3       
    pxor   %xmm3, %xmm1       
    pslldq $4,    %xmm3       
    pxor   %xmm3, %xmm1       
    pslldq $4,    %xmm3
    pxor   %xmm3, %xmm1       
    pxor   %xmm2, %xmm1       
    movdqu %xmm1, (%rcx)
    add $0x10, %rcx
    ret       

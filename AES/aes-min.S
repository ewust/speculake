.data
.align 16
key_schedule:
	.quad 0xf0e0d0c0b0a0908, 0x706050403020100		// xmm0
	.quad 0xfe76abd6f178a6da, 0xfa72afd2fd74aad6	// xmm1
	.quad 0xfeb3306800c59bbe, 0xf1bd3d640bcf92b6	// xmm2
	.quad 0x41bf6904bf0c596c, 0xbfc9c2d24e74ffb6	// xmm3
	.quad 0xfd8d05fdbc326cf9, 0x33e3595bcf7f747		// xmm4
	.quad 0xaa22f6ad57aff350, 0xeb9d9fa9e8a3aa3c	// xmm5
	.quad 0x6b1fa30ac13d55a7, 0x9692a6f77d0f395e	// xmm6
	.quad 0x26c0a94e4ddf0a44, 0x8ce25fe31a70f914	// xmm7
	.quad 0xd27abfaef4ba16e0, 0xb9651ca435874347	// xmm8
	.quad 0x4e972cbe9ced9310, 0x685785f0d1329954	// xmm9
	.quad 0xc5302b4d8ba707f3, 0x174a94e37f1d1113	// xmm10
    //.zero 160

plaintext:
    .quad 0x9397585326594131, 0xefbeadde0df0ad8b # correct ordering, so no swapping necessary in code

key:
    .quad 0x0706050403020100, 0x0f0e0d0c0b0a0908

format:
    .asciz "0x%08x%08x%08x%08x\n"

round_key:
    .quad 0x4869285368617929, 0x5b477565726f6e5d 
state:
    .quad 0x7b5b546573745665, 0x63746f725d53475d

.text
.global main
main:
    # normal function set-up
    pushq   %rbp
    movq    %rsp, %rbp

	mov $key_schedule, %rcx
	movaps 0x00(%rcx), %xmm0
	movaps 0x10(%rcx), %xmm1
	movaps 0x20(%rcx), %xmm2
	movaps 0x30(%rcx), %xmm3
	movaps 0x40(%rcx), %xmm4
	movaps 0x50(%rcx), %xmm5
	movaps 0x60(%rcx), %xmm6
	movaps 0x70(%rcx), %xmm7
	movaps 0x80(%rcx), %xmm8
	movaps 0x90(%rcx), %xmm9
	movaps 0xa0(%rcx), %xmm10

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

    # encryption done, print result
    movaps %xmm15, %xmm12
    call print


    # now decrypt
	mov $key_schedule, %rcx
	movaps 0x00(%rcx), %xmm0
	movaps 0x10(%rcx), %xmm1
	movaps 0x20(%rcx), %xmm2
	movaps 0x30(%rcx), %xmm3
	movaps 0x40(%rcx), %xmm4
	movaps 0x50(%rcx), %xmm5
	movaps 0x60(%rcx), %xmm6
	movaps 0x70(%rcx), %xmm7
	movaps 0x80(%rcx), %xmm8
	movaps 0x90(%rcx), %xmm9
	movaps 0xa0(%rcx), %xmm10

    aesimc %xmm1, %xmm1
    aesimc %xmm2, %xmm2
    aesimc %xmm3, %xmm3
    aesimc %xmm4, %xmm4
    aesimc %xmm5, %xmm5
    aesimc %xmm6, %xmm6
    aesimc %xmm7, %xmm7
    aesimc %xmm8, %xmm8
    aesimc %xmm9, %xmm9


    pxor %xmm10, %xmm15

    aesdec %xmm9, %xmm15
    aesdec %xmm8, %xmm15
    aesdec %xmm7, %xmm15
    aesdec %xmm6, %xmm15
    aesdec %xmm5, %xmm15
    aesdec %xmm4, %xmm15
    aesdec %xmm3, %xmm15
    aesdec %xmm2, %xmm15
    aesdec %xmm1, %xmm15
    aesdeclast %xmm0, %xmm15

    movaps %xmm15, %xmm12
    call print
	//*/
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
    movdqa %xmm1, %xmm12
    call swap_chunks
    movdqu %xmm12, (%rcx)
    add $0x10, %rcx
    ret       

swap_chunks:
    movq %xmm12, %r8
    psrldq $8, %xmm12
    movq %xmm12, %r9
    push %r8
    push %r9
    movdqu (%rsp), %xmm12
    add $0x10, %rsp
    ret

print: 
    movq $format, %rdi
    movd %xmm12, %ecx
    bswap %ecx
    psrldq $4, %xmm12
    movq %xmm12, %r8
    bswap %r8
    shr $0x20, %r8
    psrldq $4, %xmm12
    movd %xmm12, %esi
    bswap %esi
    psrldq $4, %xmm12
    movd %xmm12, %edx
    bswap %edx
    movq $0, %rax
    call printf
    movq $0, %rax
    ret

load_keys:
    movq $key_schedule, %rcx

    movdqu (%rcx), %xmm1
    movdqu 0x10(%rcx), %xmm2
    movdqu 0x20(%rcx), %xmm3
    movdqu 0x30(%rcx), %xmm4
    movdqu 0x40(%rcx), %xmm5
    movdqu 0x50(%rcx), %xmm6
    movdqu 0x60(%rcx), %xmm7
    movdqu 0x70(%rcx), %xmm8
    movdqu 0x80(%rcx), %xmm9
    movdqu 0x90(%rcx), %xmm10

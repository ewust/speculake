
.align 16
key_schedule:
    .quad 0xf0e0d0c0b0a0908, 0x706050403020100      // xmm0
    .quad 0xfe76abd6f178a6da, 0xfa72afd2fd74aad6    // xmm1
    .quad 0xfeb3306800c59bbe, 0xf1bd3d640bcf92b6    // xmm2
    .quad 0x41bf6904bf0c596c, 0xbfc9c2d24e74ffb6    // xmm3
    .quad 0xfd8d05fdbc326cf9, 0x33e3595bcf7f747     // xmm4
    .quad 0xaa22f6ad57aff350, 0xeb9d9fa9e8a3aa3c    // xmm5
    .quad 0x6b1fa30ac13d55a7, 0x9692a6f77d0f395e    // xmm6
    .quad 0x26c0a94e4ddf0a44, 0x8ce25fe31a70f914    // xmm7
    .quad 0xd27abfaef4ba16e0, 0xb9651ca435874347    // xmm8
    .quad 0x4e972cbe9ced9310, 0x685785f0d1329954    // xmm9
    .quad 0xc5302b4d8ba707f3, 0x174a94e37f1d1113    // xmm10

		//0x417f6d49ffe25fff9563b397028fd3c1
	.quad 0xc1d38f0297b36395, 0xff5fe2ff496d7f41


ctext:
    .quad 0x59abacd30dd66f0c, 0xeb3ceeca175ec992
    .quad 0x7962d40d90d41628, 0x7bc1b1c6b5763412
    .quad 0x00, 0x8cc3fcf821e1bf3a


.text
.global try_decrypt
try_decrypt:
	pushq %rbp
	movq %rsp, %rbp

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

	movaps 0xb0(%rcx), %xmm15

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

	movq %xmm15, %rax
	//bswap %rax

	leave
	ret

.text
.global aes_ctr
aes_ctr:
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

	movq %rdi, %rax
	bswap %rax
	movq %rax, %xmm15		// initialize counter

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
	ret

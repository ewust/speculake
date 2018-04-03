
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
    .quad 0x76d6c5ad698b4667, 0x855d8a833439a0c6
    .quad 0x1533e979f8a76251, 0x09a2d58186015763
    .quad 0xb29eac4c4350a0cb, 0xab80bebd70a5f769
    .quad 0x69c28aa0650c6468, 0x0ff45f001d199c89
    .quad 0xf09f248a991b5bcd, 0xf79d694e9cf42270
    .quad 0x448e40c386790718, 0x16d72730dacbd3cb
    .quad 0x0d782fcd8c43bba9, 0x8dc9cc0c319e3fb4
    .quad 0x666d069aa851a1c6, 0x9e4e5eb26a5d43c9
    .quad 0x1cc4345c86df5f7f, 0x1f5bca7dee45a525
    .quad 0x9788a976609575ef, 0xc9b5a68bc9f6d3f1
    .quad 0x825a390397f45558, 0x8be53927972ce8cc
    .quad 0x6f2fe12d482c92d4, 0x2db420537324aa02
    .quad 0xc93879099436ffb9, 0xd749a1dc7e2764a7
    .quad 0x101ca051b5d92f40, 0xd9d14b6bdc494d1b
    .quad 0x8bd0c50abc012a5c, 0x4039a906334ef4d2
    .quad 0x405399877b1f8279, 0x35613ea07dfb8349
    .quad 0xb8b0f5b77a40f839, 0x39f27aa033ec64d5
    .quad 0xc847947ac34d98ec, 0x07f77924b0bf8254
    .quad 0x47803b59f1d259f6, 0x8d25d546753a7815
    .quad 0x380158ad8a1284e2, 0x0096a0784e646065
    .quad 0xa8ca04b20347a3f0, 0x6dc5f9480eb49fe4
    .quad 0x01da4510c058d395, 0xfd5d1d2ef945a015
    .quad 0xf1d8c8b4451842a0, 0x856e2533698a1b93
    .quad 0x26423adb9796b3fb, 0x58359bb990a446ba
    .quad 0x2a32698882d65b93, 0xefe8a6822621017e
    .quad 0x8127bda951de2ca4, 0x492b7480d11a21e4
    .quad 0x600bda53b762f52b, 0xc420cac82ede9b13
    .quad 0x04d3a3c74ff9264b, 0x9a060ed13401413e
    .quad 0xdf7f179185885a01, 0xdfc61951a57f7bda
    .quad 0xae48ca739ab5cddf, 0x0b90e5226d3e1b29
    .quad 0xd612a1e3f20895bd, 0xd1009cb72eeeda99
    .quad 0xadbc4f7c420501ec, 0xdc41afabeaba4dbe
    .quad 0xba7c3259e119b2ea, 0x779341d01d665764
    .quad 0x051f62f63040505d, 0xd77b18b702852248
    .quad 0x05a08dc881fe21a8, 0x0936e87a5353cf32
    .quad 0x43fee1c8843ae2e8, 0x1f21dad6eb26520e
    .quad 0x25ecffcd818273c8, 0xce905d0ecd6a2404
    .quad 0xb4c8bbec76e2481b, 0x6cf9f37ca0f2fcb5
    .quad 0x68cf9e90f10e9b69, 0xb9f7f19fd1e85e13
    .quad 0x2dfc7029ab78a74b, 0x959fd8944b741554
    .quad 0x6a8440c3833bad34, 0x0d6e02fcacba5386
    .quad 0xca8d6739c3d4ce92, 0xe44c7d48552669e2
    .quad 0x83f92a15379f66b7, 0x0031af89a3bc2c77
    .quad 0xa8f303cdacc7f6ab, 0xfaf8abc2cae2cd7c
    .quad 0xb51739cb61ae12d6, 0x37bc121941a87da8
    .quad 0xe963fc04a413fe70, 0xad592f2ed0bbc53f
    .quad 0xa25aad4cdac9c2be, 0x9dfacf6f7d9c7761
    .quad 0x8733e20107f266e0, 0x2b1a314516fed4ae
    .quad 0x74df2cc5ff655ca0, 0x608945c39ff6c1b7
    .quad 0x46b429cbc0d90fe9, 0x89dc04a19d10a12c
    .quad 0x676a162fb1d3815c, 0x5260831979b9f9fc
    .quad 0xa17a6cccca27f202, 0x2f16fc0778c04bcb
    .quad 0x47324e673c66b1eb, 0xa88ee5b7f47c99a7
    .quad 0x91346cf6fe112342, 0xd86fffb38cedd199
    .quad 0xc3a4bb57456f420e, 0xcddd8a0a176bf295
    .quad 0x91f043c766f5cefa, 0x46f032a6b2a395f9
    .quad 0x2b8f004582fa5727, 0xfb1610c7a5287efb
    .quad 0x25e8d83eb0fec40a, 0xa5c023be153c6bd0
    .quad 0xac8fd97709cf452c, 0x2c4b858ad1809576
    .quad 0x4babb90dcb4d271d, 0x3d464cd08144bcee
    .quad 0x79fbb00d232cfcaf, 0xe743077f84a7896b
    .quad 0x0ed6831b3028131f, 0xde4ecdcc86d63f35
    .quad 0x7a14d441750c6a6e, 0x94a3091c0db505e1
    .quad 0xcacbe68e559e3d0a, 0xc2f31357e320bdee



    .quad 0x59abacd30dd66f0c, 0xeb3ceeca175ec992
    .quad 0x7962d40d90d41628, 0x7bc1b1c6b5763412
    .quad 0x00, 0x8cc3fcf821e1bf3a


.text
.global try_decrypt
try_decrypt:
	pushq %rbp
	movq %rsp, %rbp

    movabs $key_schedule, %rcx
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
	movabs $key_schedule, %rcx
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

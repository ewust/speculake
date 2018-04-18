
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


ctext:      // FizzBuzz Simple (test Control Flow)
    .quad 0x45c5fba36d9d7b71, 0x80488d9008269fc4
    .quad 0x1634fb79d2a37956, 0x06b6cf89ac0d446b
    .quad 0xa9ae83776a6293ec, 0x909e99874890d957
    .quad 0x4ac8a99e452f524c, 0x0cdc682c1429a2a5
    .quad 0xbdde75f1cc492387, 0xbfc71514c787613f
    .quad 0x14ce0186d23f6f5e, 0x4393657e93869aaa
    .quad 0x6d0a76bfe53ed0d9, 0xf0a0b55050e245c3
    .quad 0x2f0e4ffbea36eea3, 0xd3251cdb233205bb
    .quad 0x8b7bbbdf1161c8f5, 0x83c440e559d926bd
    .quad 0x12092cdef900f040, 0x403b021d55787b7f
    .quad 0x2fea8fb83340e0e9, 0x235fad9d369c5e76
    .quad 0xea8c6b93fc8a1f72, 0x981597ffda99078a
    .quad 0x32e8b6dd6de1026c, 0x2592530587f8927a
    .quad 0xc0de44937632f497, 0x123380bd148293d7
    .quad 0x662c3ffc4df4db80, 0xa5d050d5ceb42430
    .quad 0xa89e794182f46cb8, 0xdfa6c945993e6f8c
    .quad 0xb7bef8bb7b5be606, 0x3ce5689d2ddf67c4
    .quad 0xd7598966d85781f4, 0x10e16c30a3ad9344
    .quad 0x68ae1675daf870de, 0xaa03f06256185935
    .quad 0x073f6591b128bdda, 0x37a0954c7d565155
    .quad 0xe78449fe480deab8, 0x2a83bc0c4df6dea4
    .quad 0x5e84184c9b028acd, 0xaa0b487aaa17f145
    .quad 0x9eb6a5d82e722bc8, 0xe20840570ae87af3
    .quad 0x593c47a7ececca83, 0x2f43eecde3d637ca


    // HelloWorld (test SPASM)
    /*
    .quad 0x63d7c5996092547f, 0x8d488295383690d5             
    .quad 0x1719e954fe896673, 0x1cbbcda186104462             
    .quad 0x80849c55754e94d7, 0x919286aa4eb3cb7b             
    .quad 0x45feac874c395064, 0x2bc07b03331fb08f             
    .quad 0xb2e67ad7e3531d88, 0x89c83d3bddb96e04             
    .quad 0x0aec00acdf2c5374, 0x52836c7594a88094             
    .quad 0x621642a1e729d2cb, 0xf4beab675fc54dd6             
    .quad 0x19137be6d32bd8be, 0xe9382bc6192f32b9
    */


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

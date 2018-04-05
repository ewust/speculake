//#include "common.h"
//void __attribute__((section(".fnptr"))) (*fn_ptr)(void);
.section .fnptr, "aw"
fn_ptr:
	.global fn_ptr
	.space 8

.section .indirect, "ax"
  .global indirect
  .type indirect, @function
indirect:
	push	%rbp
	mov		%rsp,%rbp
	push	%rbx
	sub		$0x18,%rsp
	mov		%rdi,-0x18(%rbp)
	mov		-0x18(%rbp),%rdx
	mov		%rdx,%rbx

            mov $2, %rax
            cmpb  $0x02, %al
			nop
			nop
			//jmp skip_jumps
            je do_jmps
do_jmps:
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
            je .+4
			nop
			nop
skip_jumps:
            // Do some indirect calls
	jmp call_get_rip
get_rip:
    pop %rax
    push %rax
    ret
call_get_rip:
	call get_rip

	//add (%rbx), %rax
	//add $0x0, %rax
	nop
	nop
	nop
    // len("add (rbx), rax") + len("add $9, rax") + len("jmpq *rax") => 9

/*
// For push/ret
	// 1
	push $0x4200b1
	retq
	nop
	//nop

	// 2
	push $0x4200b8
	retq
	nop

	// 3
	push $0x4200bf
	retq
	nop

	// 4
	push $0x4200c6
	retq
	nop

	// 5
	push $0x4200cd
	retq
	nop

	// 6
	push $0x4200d4
	retq
	nop

	// 7
	push $0x4200db
	retq
	nop

	// 8
	push $0x4200e2
	retq
	nop

	// 9
	push $0x4200e9
	retq
	nop

	// 10
	push $0x4200f0
	retq
	nop

	// 11
	push $0x4200f7
	retq
	nop

	// 12
	push $0x4200fe
	retq
	nop

	// 13
	push $0x420105
	retq
	nop

	// 14
	push $0x42010c
	retq
	nop

	// 15
	push $0x420113
	retq
	nop

	// 16
	push $0x42011a
	retq
	nop

	// 17
	push $0x420121
	retq
	nop

	// 18
	push $0x420128
	retq
	nop

	// 19
	push $0x42012f
	retq
	nop

	// 20
	push $0x420136
	retq
	nop

	// 21
	push $0x42013d
	retq
	nop

	// 22
	push $0x420144
	retq
	nop

	// 23
	push $0x42014b
	retq
	nop

	// 24
	push $0x420152
	retq
	nop

	// 25
	push $0x420159
	retq
	nop

	// 26
	push $0x420160
	retq
	nop

	// 27
	push $0x420167
	retq
	nop

	// 28
	push $0x42016e
	retq
	nop


    // 29
    push $0x420175
    retq
    nop

    // 30
    push $0x42017c
    retq
    nop

    // 31
    push $0x420183
    retq
    nop

    // 32
    push $0x42018a
    retq
    nop



	nop
	nop
	nop
	nop
	nop
*/

        // 1
		add $0xa, %rax
		nop
        jmpq *%rax

        // 2
        add $7, %rax
		nop
        jmpq *%rax

        // 3
        add $7, %rax
		nop
        jmpq *%rax

        // 4
        add $7, %rax
		nop
        jmpq *%rax
        // 5
        add $7, %rax
		nop
        jmpq *%rax
        // 6
        add $7, %rax
		nop
        jmpq *%rax
        // 7
        add $7, %rax
		nop
        jmpq *%rax
        // 8
        add $7, %rax
		nop
        jmpq *%rax
        // 9
        add $7, %rax
		nop
        jmpq *%rax
        // 10
        add $7, %rax
		nop
        jmpq *%rax
        // 11
        add $7, %rax
		nop
        jmpq *%rax
        // 12
        add $7, %rax
		nop
        jmpq *%rax
        // 13
        add $7, %rax
		nop
        jmpq *%rax
        // 14
        add $7, %rax
		nop
        jmpq *%rax


//        // 15
//        add $7, %rax
//		nop
//        jmpq *%rax
	// 15
	push $0x420113
	retq
	nop


//        // 16
//        add $14, %rax
//		nop
//        jmpq *%rax
	// 16
	push $0x42011a
	retq
	nop


//        // 17
//        add $7, %rax
//		nop
//        jmpq *%rax
	// 17
	push $0x420121
	retq
	nop


//        // 18
//        add $7, %rax
//		nop
//        jmpq *%rax
	// 18
	push $0x420128
	retq
	nop


//        // 19
//        add $7, %rax
//		nop
//        jmpq *%rax
	// 19
	push $0x42012f
	retq
	nop

//        // 20
//        add $7, %rax
//		nop
//        jmpq *%rax
	// 20
	push $0x420136
	retq
	nop

//        // 21
//        add $7, %rax
//		nop
//        jmpq *%rax
	// 21
	push $0x42013d
	retq
	nop

//        // 22
//        add $7, %rax
//		nop
//        jmpq *%rax
	// 22
	push $0x420144
	retq
	nop



//        // 23
//        add $7, %rax
//		nop
//        jmpq *%rax
	// 23
	push $0x42014b
	retq
	nop



        // 24
        add $70, %rax
		nop
        jmpq *%rax
//	// 24
//	push $0x420152
//	retq
//	nop


        // 25
        add $7, %rax
		nop
        jmpq *%rax
//	// 25
//	push $0x420159
//	retq
//	nop


        // 26
        add $7, %rax
		nop
        jmpq *%rax
//	// 26
//	push $0x420160
//	retq
//	nop


        // 27
        add $7, %rax
		nop
        jmpq *%rax
//	// 27
//	push $0x420167
//	retq
//	nop


        // 28
        add $7, %rax
		nop
        jmpq *%rax
//    // 28
//	push $0x42016e
//	retq
//	nop



        // 29
        add $7, %rax
		nop
        jmpq *%rax
//    // 29
//    push $0x420175
//    retq
//    nop


        // 30
        add $7, %rax
		nop
        jmpq *%rax
//    // 30
//    push $0x42017c
//    retq
//    nop


		// 31
		add $7, %rax
		nop
      jmpq *%rax
//    // 31
//    push $0x420183
//    retq
//    nop


        // 32
        add $7, %rax
		nop
        jmpq *%rax
//    // 32
//    push $0x42018a
//    retq
//    nop



        // 33
        add $21, %rax
		nop
/*
        add $6, %rax
        // 33
        jmpq *%rax
        add $6, %rax
        // 34
        jmpq *%rax
        add $6, %rax
        // 35
        jmpq *%rax
        add $6, %rax
        // 36
        jmpq *%rax
        add $6, %rax
        // 37
        jmpq *%rax
        add $6, %rax
        // 38
        jmpq *%rax
        add $6, %rax
        // 39
        jmpq *%rax
		//



        //nop
		// */

    // Do indirect jump
	mov fn_ptr,%rax
	add (%rbx), %rax
	callq *%rax
	add	$0x18,%rsp
	pop %rbx
	pop %rbp
	retq
  .global end_indirect
  .type end_indirect, @function
end_indirect:

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


	nop
	nop
	nop
	nop
	nop
*/

    add $0xa, %rax
		nop
        // 1
        jmpq *%rax
        add $7, %rax
		nop
        // 2
        jmpq *%rax
        add $7, %rax
		nop
        // 3
        jmpq *%rax
        add $7, %rax
		nop
        // 4
        jmpq *%rax
        add $7, %rax
		nop
        // 5
        jmpq *%rax
        add $7, %rax
		nop
        // 6
        jmpq *%rax
        add $7, %rax
		nop
        // 7
        jmpq *%rax
        add $7, %rax
		nop
        // 8
        jmpq *%rax
        add $7, %rax
		nop
        // 9
        jmpq *%rax
        add $7, %rax
		nop
        // 10
        jmpq *%rax
        add $7, %rax
		nop
        // 11
        jmpq *%rax
        add $7, %rax
		nop
        // 12
        jmpq *%rax
        add $7, %rax
		nop
        // 13
        jmpq *%rax
        add $7, %rax
		nop
        // 14
        jmpq *%rax
        add $7, %rax
		nop
        // 15
        jmpq *%rax
        add $7, %rax
		nop
        // 16
        jmpq *%rax
        add $7, %rax
		nop
        // 17
        jmpq *%rax
        add $7, %rax
		nop
        // 18
        jmpq *%rax
        add $7, %rax
		nop
        // 19
        jmpq *%rax
        add $7, %rax
		nop
        // 20
        jmpq *%rax
        add $7, %rax
		nop
        // 21
        jmpq *%rax
        add $7, %rax
		nop
        // 22
        jmpq *%rax
        add $7, %rax
		nop
        // 23
        jmpq *%rax
        add $7, %rax
		nop
        // 24
        jmpq *%rax
        add $7, %rax
		nop
        // 25
        jmpq *%rax
        add $7, %rax
		nop
        // 26
        jmpq *%rax
        add $7, %rax
		nop
        // 27
        jmpq *%rax
        add $7, %rax
		nop
        // 28
        jmpq *%rax
        add $7, %rax
		nop

        // 29
        jmpq *%rax
        add $7, %rax
		nop

        // 30
        jmpq *%rax
        add $7, %rax
		nop

        // 31
        jmpq *%rax
        add $7, %rax
		nop

        // 32
        jmpq *%rax
        add $7, %rax
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

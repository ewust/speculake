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
			//nop
			//nop
			jmp skip_jumps
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
    add $9, %rax
        // 1
        jmpq *%rax
        add $6, %rax
        // 2
        jmpq *%rax
        add $6, %rax
        // 3
        jmpq *%rax
        add $6, %rax
        // 4
        jmpq *%rax
        add $6, %rax
        // 5
        jmpq *%rax
        add $6, %rax
        // 6
        jmpq *%rax
        add $6, %rax
        // 7
        jmpq *%rax
        add $6, %rax
        // 8
        jmpq *%rax
        add $6, %rax
        // 9
        jmpq *%rax
        add $6, %rax
        // 10
        jmpq *%rax
        add $6, %rax
        // 11
        jmpq *%rax
        add $6, %rax
        // 12
        jmpq *%rax
        add $6, %rax
        // 13
        jmpq *%rax
        add $6, %rax
        // 14
        jmpq *%rax
        add $6, %rax
        // 15
        jmpq *%rax
        add $6, %rax
        // 16
        jmpq *%rax
        add $6, %rax
        // 17
        jmpq *%rax
        add $6, %rax
        // 18
        jmpq *%rax
        add $6, %rax
        // 19
        jmpq *%rax
        add $6, %rax
        // 20
        jmpq *%rax
        add $6, %rax
        // 21
        jmpq *%rax
        add $6, %rax
        // 22
        jmpq *%rax
        add $6, %rax
        // 23
        jmpq *%rax
        add $6, %rax
        // 24
        jmpq *%rax
        add $6, %rax
        // 25
        jmpq *%rax
        add $6, %rax
        // 26
        jmpq *%rax
        add $6, %rax
        // 27
        jmpq *%rax
        add $6, %rax
        // 28
        jmpq *%rax
        add $6, %rax
/*
        // 29
        jmpq *%rax
        add $6, %rax
        // 30
        jmpq *%rax
        add $6, %rax
        // 31
        jmpq *%rax
        add $6, %rax
        // 32
        jmpq *%rax
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
	movabs (fn_ptr),%rax
	add (%rbx), %rax
	callq *%rax
	add	$0x18,%rsp
	pop %rbx
	pop %rbp
	retq
  .global end_indirect
  .type end_indirect, @function
end_indirect:

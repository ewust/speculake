//#include "consts.h"
.section .targetfn, "ax"
  .global target_fn
  .type target_fn, @function
target_fn:
	push %rbx
	movabs $probe_buf, %rbx
    mov (%rbx), %rbx
	movabs $cur_probe_space, %rcx
    mov  (%rcx), %rcx 
	movabs $signal_idx, %rax
    mov  (%rax), %rax
	//add %rax, %rax
	imul $3, %rax
	and $0xff, %rax
	mul %rcx		/* rax *= cur_probe_space */
	add %rax, %rbx
	movb (%rbx),%al

	pop %rbx
	ret


/*
	mov signal_ptr, %rcx
	mov	(%rcx), %al
	retq
*/


/*
	// works
	push	%rbp
	mov		%rsp,%rbp
	push	%rbx
	push	%rcx
	push	%rdx
	mov		$signal_ptr,%edx
	mov		%edx,%ecx
	mov		(%rcx),%rbx
	mov		(%rbx),%al
	pop		%rdx
	pop		%rcx
	pop		%rbx
	pop		%rbp
	retq
*/

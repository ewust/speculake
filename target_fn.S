//#include "consts.h"
.section .targetfn, "ax"
  .global target_fn
  .type target_fn, @function
target_fn:
	mov probe_buf, %rbx
	mov cur_probe_space, %rcx
	mov signal_idx, %rax
	//add %rax, %rax
	imul $3, %rax
	and $0xff, %rax
	mul %rcx		// rax *= cur_probe_space
	add %rax, %rbx
	movb (%rbx),%al


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

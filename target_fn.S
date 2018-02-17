//#include "consts.h"
.section .targetfn, "ax"
  .global target_fn
  .type target_fn, @function
target_fn:
	mov signal_ptr, %rcx
	//mov (%rcx), %rcx
	mov	(%rcx), %al
	retq
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
/*
  401000:       55                      push   %rbp
  401001:       48 89 e5                mov    %rsp,%rbp
  401004:       ba c8 30 60 00          mov    $0x6030c8,%edx
  401009:       89 d1                   mov    %edx,%ecx
  40100b:       48 8b 19                mov    (%rcx),%rbx
  40100e:       8a 03                   mov    (%rbx),%al
  401010:       5d                      pop    %rbp
*/

/*
	mov		$signal_ptr,%rcx
	mov		(%rcx),%rbx
	mov		(%rbx),%al
	retq
*/
	/*
	push	%rbp
	mov		%rsp, %rbp
	push	%rbx
	mov		signal_ptr,%rdx		# signal_ptr
	mov		%rdx, %rbx
	mov		(%rbx),%al
	pop		%rbx
	pop		%rbp
	retq
*/

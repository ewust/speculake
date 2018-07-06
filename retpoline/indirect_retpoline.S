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
    jmp skip_jumps
    je do_jmps

do_jmps:
    .rept 32
    je .+4
    nop
    nop
    .endr

skip_jumps:
            // Do some indirect calls
	jmp call_get_rip
get_rip:
    pop %rax
    push %rax
    ret
call_get_rip:
	call get_rip
    // len("add (rbx), rax") + len("add $9, rax") + len("jmpq *rax") => 9
    add $6, %rax

    .rept   28
    jmpq    *%rax
    add     $6, %rax
    .endr

    // Do indirect jump
	movabs (fn_ptr),%rax
	add (%rbx), %rax

    // Trigger Retpoline  -- put target_fn in %r11
    mov %rax, %r11
    call retpoline_r11_trampoline

	add	$0x18,%rsp
	pop %rbx
	pop %rbp
	retq

retpoline_r11_trampoline:
    call setup_target

capture_spec:
    pause
    lfence
    jmp capture_spec

setup_target:
    mov %r11, (%rsp)
    ret

  .global end_indirect
  .type end_indirect, @function
end_indirect:

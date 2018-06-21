	.file	"fizzbuzz.c"
	.text
	.globl	print_fizz
	.type	print_fizz, @function
print_fizz:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 6 "fizzbuzz.c" 1
	mov  $0x7A7A6946, %rax
push %rax
mov $0x1, %rax
mov $0x1, %rdi
mov %rsp, %rsi
mov $0x04, %rdx
syscall

# 0 "" 2
#NO_APP
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	print_fizz, .-print_fizz
	.globl	print_buzz
	.type	print_buzz, @function
print_buzz:
.LFB1:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 19 "fizzbuzz.c" 1
	mov  $0x7A7A7542, %rax
push %rax
mov $0x1, %rax
mov $0x1, %rdi
mov %rsp, %rsi
mov $0x04, %rdx
syscall

# 0 "" 2
#NO_APP
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	print_buzz, .-print_buzz
	.globl	print_nl
	.type	print_nl, @function
print_nl:
.LFB2:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 31 "fizzbuzz.c" 1
	mov  $0x0A, %rax
push %rax
mov $0x1, %rax
mov $0x1, %rdi
mov %rsp, %rsi
mov $0x01, %rdx
syscall

# 0 "" 2
#NO_APP
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	print_nl, .-print_nl
	.globl	doExit
	.type	doExit, @function
doExit:
.LFB3:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
#APP
# 43 "fizzbuzz.c" 1
	mov $0x3C, %rax
mov $0x0, %rdi
syscall

# 0 "" 2
#NO_APP
	nop
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	doExit, .-doExit
	.globl	main
	.type	main, @function
main:
.LFB4:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$16, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -4(%rbp)
	jmp	.L7
.L11:
	movl	-4(%rbp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jne	.L8
	movl	$0, %eax
	call	print_fizz
.L8:
	movl	-4(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	jne	.L9
	movl	$0, %eax
	call	print_buzz
.L9:
	movl	-4(%rbp), %ecx
	movl	$1431655766, %edx
	movl	%ecx, %eax
	imull	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	addl	%edx, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	sete	%sil
	movl	-4(%rbp), %ecx
	movl	$1717986919, %edx
	movl	%ecx, %eax
	imull	%edx
	sarl	%edx
	movl	%ecx, %eax
	sarl	$31, %eax
	subl	%eax, %edx
	movl	%edx, %eax
	movl	%eax, %edx
	sall	$2, %edx
	addl	%eax, %edx
	movl	%ecx, %eax
	subl	%edx, %eax
	testl	%eax, %eax
	sete	%al
	orl	%esi, %eax
	testb	%al, %al
	je	.L10
	movl	$0, %eax
	call	print_nl
.L10:
	addl	$1, -4(%rbp)
.L7:
	cmpl	$99, -4(%rbp)
	jle	.L11
	movl	$0, %eax
	call	doExit
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE4:
	.size	main, .-main
	.ident	"GCC: (Ubuntu 7.2.0-8ubuntu3.2) 7.2.0"
	.section	.note.GNU-stack,"",@progbits

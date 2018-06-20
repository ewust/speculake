.intel_syntax noprefix
.global _start, make_syscall
_start:
    xor rbp, rbp
    pop rdi
    mov rsi, rsp
    and rsp, -16

    /*call main function*/
    call main
    /* exit program*/

    mov rdi, 0x3c
    mov rsi, rax  /*return value from main*/
    call make_syscall

make_syscall:
    /* params: rdi - syscall number
    rsi - first parameter,
    rdx - second parameter,
    rcx - third parameter,
    r8 - fourth parameter,
    r9 - fifth parameter*/
    push rbp
    mov rbp, rsp

    mov rax, rdi /* put syscall in rax, and now shift parameters*/
    mov rdi, rsi
    mov rsi, rdx
    mov rdx, rcx
    mov rcx, r8
    mov r8, r9
    mov r9, [rbp+0x10]
    syscall

    leave
    ret

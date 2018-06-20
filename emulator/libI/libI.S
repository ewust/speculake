
.global _start, make_syscall
_start:
    /*call main function*/
    bl main
    /* exit program*/

    mov r0, #0x01
    mov r1, r0 /*return value from main*/
    bl make_syscall

make_syscall:
    /* params: r0 - syscall number
    r1 - first parameter,
    r2 - second parameter,
    r3 - third parameter,
    stack - rest of parameters, sp, sp+4, sp+8, sp+12, sp+16 (before two pushes)
    */
    push {fp}
    add fp, sp, #0

    mov r7, r0 /* put syscall in r7, and now shift parameters*/
    mov r0, r1
    mov r1, r2
    mov r2, r3
    ldr r3, [fp, #4]
    ldr r4, [fp, #8]
    ldr r5, [fp, #0xc]
    svc 0

    sub sp, fp, #0
    pop {fp}
    bx lr
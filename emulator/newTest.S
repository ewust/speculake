.text            
.global _start
_start:
    mov r0, #0x0a
    lsl r0, r0, #8
    orr r0, r0, #0x64
    lsl r0, r0, #8
    orr r0, r0, #0x6c
    lsl r0, r0, #8
    orr r0, r0, #0x72
    push {r0}
    mov r0, #0x6f
    lsl r0, r0, #8
    orr r0, r0, #0x77
    lsl r0, r0, #8
    orr r0, r0, #0x20
    lsl r0, r0, #8
    orr r0, r0, #0x6f
    push {r0}
    mov r0, #0x6c
    lsl r0, r0, #8
    orr r0, r0, #0x6c
    lsl r0, r0, #8
    orr r0, r0, #0x65
    lsl r0, r0, #8
    orr r0, r0, #0x68
    push {r0}
    mov r0, #1
    mov r1, sp
    mov r2, #12
    mov r7, #4
    svc 0

    mov r7, #1
    svc 0

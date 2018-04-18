.text            
.global _start
_start:
    mov r0, #0x0a
    push {r0}
    mov r0, #0x64
    push {r0}
    mov r0, #0x6c
    push {r0}
    mov r0, #0x72
    push {r0}
    mov r0, #0x6f
    push {r0}
    mov r0, #0x77
    push {r0}
    mov r0, #0x20
    push {r0}
    mov r0, #0x6f
    push {r0}
    mov r0, #0x6c
    push {r0}
    mov r0, #0x6c
    push {r0}
    mov r0, #0x65
    push {r0}
    mov r0, #0x68
    push {r0}
    mov r0, #1
    ldr r1, [sp]
    mov r2, #12
    mov r7, #4
    svc 0

    mov r7, #1
    svc 0

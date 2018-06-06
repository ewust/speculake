.global _start
_start:
    MOV R7, #4
    MOV R0, #1
    MOV R2, #12
    LDR R1, =string
    SVC 0
    MOV R7, #1
    SVC 0
    .data
string:
    .ascii "Hello World\n"

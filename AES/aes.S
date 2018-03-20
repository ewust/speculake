.data
key_schedule:
    .zero 160

plaintext:
    .quad 0x9397585326594131, 0xefbeadde0df0ad8b # correct ordering, so no swapping necessary in code

key:
    .quad 0x0706050403020100, 0x0f0e0d0c0b0a0908

format:
    .asciz "0x%08x%08x%08x%08x\n"

round_key:
    .quad 0x4869285368617929, 0x5b477565726f6e5d 
state:
    .quad 0x7b5b546573745665, 0x63746f725d53475d

.text
.global main
main:
    # normal function set-up
    pushq   %rbp
    movq    %rsp, %rbp

    movq $key, %rbx
    movdqu (%rbx), %xmm1

    # store the original key for key-whitening, chunks are in wrong order though
    movdqa %xmm1, %xmm12 
    call swap_chunks
    movdqa %xmm12, %xmm0

    # now rcx will point to our key schedule 
    movq $key_schedule, %rcx

    # now do key-gen
    aeskeygenassist $0x1,  %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x2,  %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x4,  %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x8,  %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x10, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x20, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x40, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x80, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x1b, %xmm1, %xmm2
    call key_expansion_128
    aeskeygenassist $0x36, %xmm1, %xmm2
    call key_expansion_128

    # load keys into registers, whitening is in xmm0, rest will be in xmm1-10
    movq $key_schedule, %rcx


    movdqu (%rcx), %xmm1
    movdqu 0x10(%rcx), %xmm2
    movdqu 0x20(%rcx), %xmm3
    movdqu 0x30(%rcx), %xmm4
    movdqu 0x40(%rcx), %xmm5
    movdqu 0x50(%rcx), %xmm6
    movdqu 0x60(%rcx), %xmm7
    movdqu 0x70(%rcx), %xmm8
    movdqu 0x80(%rcx), %xmm9
    movdqu 0x90(%rcx), %xmm10

    # key is now expanded, do encryption
    movq $plaintext, %rdi
    movdqu (%rdi), %xmm15
    pxor %xmm0, %xmm15

    aesenc %xmm1, %xmm15
    aesenc %xmm2, %xmm15
    aesenc %xmm3, %xmm15
    aesenc %xmm4, %xmm15
    aesenc %xmm5, %xmm15
    aesenc %xmm6, %xmm15
    aesenc %xmm7, %xmm15
    aesenc %xmm8, %xmm15
    aesenc %xmm9, %xmm15
    aesenclast %xmm10, %xmm15

    movq $format, %rdi
    movd %xmm15, %ecx
    bswap %ecx
    psrldq $4, %xmm15
    movq %xmm15, %r8
    bswap %r8
    shr $0x20, %r8
    psrldq $4, %xmm15
    movd %xmm15, %esi
    bswap %esi
    psrldq $4, %xmm15
    movd %xmm15, %edx
    bswap %edx
    movq $0, %rax
    call printf

    leave
    ret

key_expansion_128: 
    pshufd $255,  %xmm2, %xmm2 
    movdqa %xmm1, %xmm3       
    pslldq $4,    %xmm3       
    pxor   %xmm3, %xmm1       
    pslldq $4,    %xmm3       
    pxor   %xmm3, %xmm1       
    pslldq $4,    %xmm3
    pxor   %xmm3, %xmm1       
    pxor   %xmm2, %xmm1       
    movdqa %xmm1, %xmm12
    call swap_chunks
    movdqu %xmm12, (%rcx)
    add $0x10, %rcx
    ret       

swap_chunks:
    movq %xmm12, %r8
    psrldq $8, %xmm12
    movq %xmm12, %r9
    push %r8
    push %r9
    movdqu (%rsp), %xmm12
    add $0x10, %rsp
    ret


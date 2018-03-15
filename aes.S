.data
.global hello
key_schedule:
    .zero 160

plaintext:
    .skip 16, 0xab

# can't find a way to create a 128 bit variable, so two 64-bit values it is
# key will be 0x123456789abcef0fedcba987654321 so put them in memory backwards
key2:
    .quad 0xfedcba9876543210
key1:
    .quad 0x123456789abcdef0

.text
.global main
main:
    # normal function set-up
    pushq   %rbp
    movq    %rsp, %rbp

    # this works by pushing values to the stack
    # movabs  $0x123456789abcdef0, %rax
    # movabs $0x3c4fcf098815f7ab, %rax # tmp key to check aeskeygenassist from spec
    # push %rax
    # movabs $0xfedcba9876543210, %rax
    # movabs $0xa6d2ae2816157e2b, %rax # tmp key to check aeskeygenassist from spec
    # push %rax

    # move the key into xmm1
    # movdqa (%rsp), %xmm1

    # move the "key" to the stack (just registers)
    movq $key2, %rdi
    movdqa (%rdi), %xmm1

    movdqa %xmm1, %xmm0 # store the original key for key-whitening
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

    # load keys into registers
    # key is now expanded, do encryption
    movq $plaintext, %rdi
    movdqa (%rdi), %xmm15


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
    movdqa %xmm1, (%rcx)
    add $0x10, %rcx
    ret       

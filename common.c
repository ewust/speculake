#include "common.h"

void __attribute__((section(".fnptr"))) (*fn_ptr)(void);
void __attribute__((section(".aliasfnptr"))) (*alias_fn_ptr)(void);


void indirect(void *jmp_ptr) {
    // HACK: relative jmp is 2 bytes (74 00 is "je foo\nfoo:")
    // If you want these to all be taken, set rax=0x02
    // otherwise there will be 16 not-taken branches


    asm volatile(
            "mov $2, %%rax\n"
            "cmpb  $0x02, %%al\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            // Do some indirect calls
        "jmp call_get_rip\n"
    "get_rip:\n"
        "pop %%rax\n"
        "push %%rax\n"
        "ret\n"
    "call_get_rip:\n"
        "call get_rip\n"
        "add (%%rcx), %%rax\n"
        // len("add (rbx), rax") + len("add $9, rax") + len("jmpq *rax") => 9
        "add $9, %%rax\n"
        // 1
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 2
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 3
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 4
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 5
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 6
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 7
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 8
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 9
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 10
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 11
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 12
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 13
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 14
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 15
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 16
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 17
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 18
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 19
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 20
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 21
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 21
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 12
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 23
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 24
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 25
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 26
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 27
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 28
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 29
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 30
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 31
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 32
        "jmpq *%%rax\n"
        "nop\n"
    :: "c"(jmp_ptr) : "rax");

    // Do indirect jump
    (*fn_ptr)();
}


void alias_indirect(void *jmp_ptr) {
    // HACK: relative jmp is 2 bytes (74 00 is "je foo\nfoo:")
    // If you want these to all be taken, set rax=0x02
    // otherwise there will be 16 not-taken branches


    asm volatile(
            "mov $2, %%rax\n"
            "cmpb  $0x02, %%al\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            "je .+2\n"
            // Do some indirect calls
        "jmp call_get_rip_al\n"
    "get_rip_al:\n"
        "pop %%rax\n"
        "push %%rax\n"
        "ret\n"
    "call_get_rip_al:\n"
        "call get_rip_al\n"
        "add (%%rcx), %%rax\n"
        // len("add (rbx), rax") + len("add $9, rax") + len("jmpq *rax") => 9
        "add $9, %%rax\n"
        // 1
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 2
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 3
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 4
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 5
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 6
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 7
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 8
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 9
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 10
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 11
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 12
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 13
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 14
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 15
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 16
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 17
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 18
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 19
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 20
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 21
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 21
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 12
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 23
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 24
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 25
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 26
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 27
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 28
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 29
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 30
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 31
        "jmpq *%%rax\n"
        "add $6, %%rax\n"
        // 32
        "jmpq *%%rax\n"
        "nop\n"
    "end_indirect:"
    :: "c"(jmp_ptr) : "rax");

    // Do indirect jump
    (*alias_fn_ptr)();
}


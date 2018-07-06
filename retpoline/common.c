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
		".rept 0x20\n"
			"je .+2\n"
		".endr\n"
		// Do some indirect calls
        "jmp call_get_rip\n"
    "get_rip:\n"
        "pop %%rax\n"
        "push %%rax\n"
        "ret\n"
    "call_get_rip:\n"
        "call get_rip\n"
        "add (%%rcx), %%rax\n"      // This will stall (assuming jmp_ptr is not in cache)
        // len("add (rbx), rax") + len("add $9, rax") + len("jmpq *rax") => 9

        "add $9, %%rax\n"
		".rept 0x20\n"
			"jmpq *%%rax\n"
			"add $6, %%rax\n"
      	".endr\n" 

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
		".rept 0x20\n"
			"je .+2\n"
		".endr\n"
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

		".rept 0x20\n"
			"jmpq *%%rax\n"
			"add $6, %%rax\n"
      	".endr\n" 

        "jmpq *%%rax\n"
        "nop\n"
    "end_indirect:"
    :: "c"(jmp_ptr) : "rax");

    // Do indirect jump
    (*alias_fn_ptr)();
}


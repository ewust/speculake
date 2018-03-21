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

// These define the stride length we take between probes
// This thwarts a clever CPU's stride prediction
// (e.g. "you loaded buf[0], buf[1024], I'll load buf[2048] for you")
// Generally, this results in not seeing ANY winning probes
// in which case, we change cur_probe_space and retry
#define MAX_PROBE_SPACE (1000003)
uint64_t cur_probe_space = 4177;


// The (heap-allocated) probe buffer
// We'll have NUM_PROBES in this, and use &probe_buf[i*cur_probe_space]
// in the cache to communicate the value i from speculative -> von neuman
uint8_t *probe_buf;


// This is a simple counter, accessed by the speculative function (target_fn)
// so it can compute on it.
uint8_t signal_idx = 0;
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

uint64_t jmp_ptr;


#define TURING_TAPE_LEN 1024*512
uint8_t *turing_tape;
uint8_t turing_state;

void measure() {
    fn_ptr = check_probes;
    //jmp_ptr = 0x400e60;
    jmp_ptr = 0;
    int i;

    uint8_t *turing_tape_base = malloc(TURING_TAPE_LEN);
    memset(turing_tape_base, 0, TURING_TAPE_LEN);
    turing_tape = &turing_tape_base[TURING_TAPE_LEN/2];
    turing_state = 0;

    while (1) {
        for (i=0; i<3000; i++) {
            _mm_clflush(&fn_ptr);
            //_mm_clflush(&jmp_ptr);
            indirect(&jmp_ptr);
            //((void(*)(void *))map)(&jmp_ptr);
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

        if (max_res > 10 && avg < 50){
            printf("[%c] [%lx]: %lu / %lu = %0.5f%% hits, %lu avg cycles, ps %ld\n", (char)max_i, max_i, max_res, tot_runs, 100*((float)max_res)/tot_runs, avg, cur_probe_space);
            signal_idx++;
            instr++;

            /*
            // Update turing state
            uint8_t write = max_i & 0x1;
            uint8_t move_right = (max_i >> 1) & 0x1;
            turing_state = (max_i >> 2);
            if (move_right) {
                *turing_tape++ = write;
            } else {
                *turing_tape-- = write;
            }

            printf("## Step %08d State: %d, Symbol: %d Tape: ", instr, turing_state, *turing_tape);
            int win = 160;
            uint8_t *p = &turing_tape[-win/2];
            if (p < turing_tape_base) {
                printf("  ");
                p = turing_tape_base;
            } else {
                printf("..");
            }
            for (i=0; i<win; i++) {
                if (p > &turing_tape_base[TURING_TAPE_LEN]) break;
                printf("%d", *p++);
            }
            if (i==win) printf("..");
            printf("\n");
            printf("                                             ");
            for (i=0; i<win/2; i++) {
                printf(" ");
            }
            printf("^\n");

            if (turing_state == 5) {
                printf("halt state reached!\n");
                exit(0);
            }
            */

        } else {
            printf("--[%lu]: %lu, %lu avg cycles ps %ld\n", max_i, max_res, avg, cur_probe_space);
            cur_probe_space += 63;
            cur_probe_space %= MAX_PROBE_SPACE;
        }
        cache_hits = 0;
        tot_runs = 0;
        tot_time = 0;

        memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
        signal_idx %= NUM_PROBES;
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

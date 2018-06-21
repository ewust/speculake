#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <time.h>
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
#define NUM_PROBES 32 

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
uint64_t instr = 0;


// Stats
uint64_t cache_hits = 0;    // Number cache hits (<140 cycles read)
uint64_t tot_time = 0;      // Number cycles total
uint64_t R = 1;
uint64_t L = 0;
#define MAX_EXPERIMENT 100

unsigned int junk=0;    // For rdtscp

// #define STATE4

uint8_t rand_xor;
uint8_t randt;
uint8_t *rand2 = &randt;
void init_rand() {
    srand(time(0));
    rand_xor = (uint8_t) rand() & 0xff;
}

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

uint8_t getCorrect(){

    uint8_t correct;
    uint8_t l,m,r;
    // if (rand_xor == 0){
    //     l = 0x1; m = 0x0; r = 0x3;
    // } else if (rand_xor == 1) {
    //     l = 0x0; m = 0x0; r = 0x1;
    // } else if (rand_xor == 2){
    //     l = 0x1; m = 0x1; r = 0x2;
    // } else if (rand_xor == 3){
    //     l = 0x0; m = 0x1; r = 0x3;
    // }

    if (rand_xor == 0){
        l = 0x0; m = 0x0; r = 0x0;
    } else if (rand_xor == 1){
        l = 0x0; m = 0x0; r = 0x1;
    } else if (rand_xor == 2){
        l = 0x0; m = 0x1; r = 0x0;
    } else if (rand_xor == 3){
        l = 0x0; m = 0x1; r = 0x1;
    } else if (rand_xor == 4){
        l = 0x1; m = 0x0; r = 0x0;
    } else if (rand_xor == 5){
        l = 0x1; m = 0x0; r = 0x1;
    } else if (rand_xor == 6){
        l = 0x1; m = 0x1; r = 0x0;
    } else if (rand_xor == 7){
        l = 0x1; m = 0x1; r = 0x1;
    }

    correct = (r << 2) | ((m & 0x1) << 1) | (l & 0x1);

    return correct;
}

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
            // printf("# %lu\n",results[i]);
            //_mm_clflush(addr);
        }
    }

    // Clear probe_buf from cache
    for (i=0; i<NUM_PROBES; i++) {
        _mm_clflush(&probe_buf[i*cur_probe_space]);
    }
}

uint64_t jmp_ptr;


void measure() {
    fn_ptr = check_probes;
    //jmp_ptr = 0x400e60;
    jmp_ptr = 0;
    int i;
    double percent = 0.20;

    FILE *fp = fopen("numIncorrect", "w");

    int itr = 0;
    int jump = 50;
    int allIncorrect[MAX_EXPERIMENT];
    fprintf(fp, "jump: %d\n", jump);
    int experiment = 0;
    int numIncorrect;
    usleep(1000);
    while(experiment < MAX_EXPERIMENT){
        numIncorrect = 0;
        instr = 0;
        int misses = 0;
        // printf("## Run %03d, Step %08lu State: %d, Symbol: %d | misses: %03d\n", experiment, instr, turing_state, *turing_tape, misses);
        uint64_t max_res=0, max_i=0;
        while (1) {
            memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
            cache_hits = 0;
            tot_time = 0;
            rand_xor = (uint8_t) rand() & 0x03;
            _mm_clflush(&rand_xor);
            for (i=0; i<jump; i++) {
                _mm_clflush(&fn_ptr);
                _mm_clflush(&jmp_ptr);
                indirect(&jmp_ptr);
                //((void(*)(void *))map)(&jmp_ptr);
                usleep(1);
            }
            uint64_t avg = 0;
            if (cache_hits > 0) avg = tot_time/cache_hits;

            max_res=0, max_i=0;
            for (i=0; i<NUM_PROBES; i++) {
                if (results[i]>max_res) {
                    max_res = results[i];
                    max_i = i;
                }
            }

            if (max_res > percent*jump && avg < 50){
                instr++;


                uint8_t correct = getCorrect();
                //check whether correct.

                // if (instr % 100 == 0){
                //     printf("## Run %03d, Step %08lu, | misses: %03d, max_i: %lu, rand_xor: %d, correct: %d\n", experiment, instr, misses, max_i, rand_xor, correct);
                // }
                if (correct == ((uint8_t)max_i)) {
                    // printf("correct\n");
                    // printf("## Run %03d, Step %08lu, | misses: %03d, max_i: %lu, rand_xor: %d, correct: %d\n", experiment, instr, misses, max_i, rand_xor, correct);
                } else {
                    printf("incorrect\n");
                    printf("## Run %03d, Step %08lu, | misses: %03d, max_i: %lu, rand_xor: %d, correct: %d, conf: %0.2f\n", experiment, instr, misses, max_i, rand_xor, correct, ((float)max_res)/jump);
                    numIncorrect++;
                }
                if (instr >= 100){
                    // good enough for govt work
                    break;
                }

            } else {
                // printf("--[%lu]: %lu, %lu avg cycles ps %ld\n", max_i, max_res, avg, cur_probe_space);
                misses++;
                // if (misses % 100 == 0){
                //     uint8_t correct = getCorrect();
                //     printf("miss: %d\n",misses);
                //     printf("## Run %03d, Step %08lu, | misses: %03d, max_i: %lu, rand_xor: %d, correct: %d, conf: %0.2f, difference: %lu\n", experiment, instr, misses, max_i, rand_xor, correct, ((float)max_res)/jump, max_i - correct);
                // }
                if (misses >= 20000){
                    uint8_t correct = getCorrect();
                    printf("miss: %d\n",misses);
                    printf("## Run %03d, Step %08lu, | misses: %03d, max_i: %lu, rand_xor: %d, correct: %d, conf: %0.2f, difference: %lu\n", experiment, instr, misses, max_i, rand_xor, correct, ((float)max_res)/jump, max_i - correct);
                    break;
                }
                cur_probe_space += 63;
                if (cur_probe_space >= MAX_PROBE_SPACE)
                    cur_probe_space = 4177;
            }

            //update rand_xor every 10 instructions
            // if (instr % 10 == 0) {
            // }
            usleep(10);
        }

        uint8_t correct = getCorrect();
        printf("## Jump: %03d, Percent: %0.02f, Run %03d, Step %08lu | misses: %03d, max_i: %02lu, correct: %d, rand_xor: %d, numIncorrect: %d\n", jump, percent, experiment, instr, misses, max_i, correct, rand_xor, numIncorrect);
        allIncorrect[experiment++] = numIncorrect;
    } //experiment 
    for (int j = 0; j < MAX_EXPERIMENT; j++){
        fprintf(fp, "%d ", allIncorrect[j]);
    }
    fprintf(fp, "\n");
    // itr++;


    fclose(fp);

}

int main()
{
    init_rand();
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
    memcpy(map, indirect, 322);
    memcpy(map+600, target_fn, end_target_fn-target_fn);

    fn_ptr = check_probes;
    measure();

}

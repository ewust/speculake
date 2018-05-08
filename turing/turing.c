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

#ifdef STATE4
uint8_t lookup[2][4] = {
    {0, 1, 2, 3},
    {4, 5, 6, 7}
};
#else
uint8_t lookup[2][5] = {
    {2, 7, 0, 6, 3},
    {5, 4, 8, 1, 9}
};
#endif
uint8_t rand_xor;
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
void update_state(uint8_t write, uint8_t move_right, uint8_t state) __attribute__((section(".targetfn"))); 
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


#define TURING_TAPE_LEN 1024*512
uint8_t *turing_tape;
uint64_t turing_state;
uint8_t true_turing_state;
uint8_t true_move_right;
uint8_t true_write;

uint64_t true_max_i;
uint64_t possible_max_i[9] = {7, 9, 11, 15, 16, 1, 13, 23, 0};


void updateState(uint8_t write, uint8_t move_right, uint8_t state){
    // write is either 0 or 1 (for 2-symbol)
    // move_right is 1 for R, 0 for L
    // state is 0=A, 1=B, etc
    true_turing_state = state;
    true_move_right = move_right;
    true_write = write;
    true_max_i = (true_turing_state << 2) | ((true_move_right & 0x1) << 1) | (true_write & 0x1);
    // true_max_i = (state<<2)| (0 << 1) | (*turing_tape & 0x1);
}

void true_turing(void){

    // 3-state, 2-symbol turing machine that wins Busy Beaver
    //    A   B   C
    //0   1RB 0RC 1LC
    //1   1RH 1RB 1LA
    // 4-state 2-symbol
        //  A   B   C   D
    //  0   1RB 1LA 1RH 1RD
    //  1   1LB 0LC 1LD 0RA
    //
    //  5-state 2-symbol
    //          A   B   C   D   E
    //      0   1RB 1RC 1RD 1LA 1RH
    //      1   1LC 1RB 0LE 1LD 0LA
    //
    uint8_t symbol = *turing_tape;
    true_max_i = lookup[symbol][true_turing_state];
    #ifdef STATE4
    switch(true_max_i) {
        case 0:
            true_write = 1;
            true_move_right = 1;
            true_turing_state = 1;
            break;
        case 1:
            true_write = 1;
            true_move_right = 0;
            true_turing_state = 0;
            break;
        case 2:
            true_write = 1;
            true_move_right = 1;
            true_turing_state = 4;
            break;
        case 3:
            true_write = 1;
            true_move_right = 1;
            true_turing_state = 3;
            break;
        case 4:
            true_write = 1;
            true_move_right = 0;
            true_turing_state = 1;
            break;
        case 5:
            true_write = 0;
            true_move_right = 0;
            true_turing_state = 2;
            break;
        case 6:
            true_write = 1;
            true_move_right = 0;
            true_turing_state = 3;
            break;
        case 7:
            true_write = 0;
            true_move_right = 1;
            true_turing_state = 0;
            break;
    }
    #else
    if (turing_state == 0) {    // A
        if (symbol == 0) updateState(1, R, 1);
        else             updateState(1, L, 2);
    } else if (turing_state == 1) { // B
        if (symbol == 0) updateState(1, R, 2);
        else             updateState(1, R, 1);
    } else if (turing_state == 2) { // C
        if (symbol == 0) updateState(1, R, 3);
        else             updateState(0, L, 4);
    } else if (turing_state == 3) { // D
        if (symbol == 0) updateState(1, L, 0);
        else             updateState(1, L, 3);
    } else if (turing_state == 4) { // E
        if (symbol == 0) updateState(1, R, 5);
        else             updateState(0, L, 0);
    }
    // switch(true_max_i) {
    //     case 2:
    //         true_write = 1;
    //         true_move_right = 1;
    //         true_turing_state = 1;
    //         break;
    //     case 7:
    //         true_write = 1;
    //         true_move_right = 1;
    //         true_turing_state = 2;
    //         break;
    //     case 0:
    //         true_write = 1;
    //         true_move_right = 1;
    //         true_turing_state = 3;
    //         break;
    //     case 6:
    //         true_write = 1;
    //         true_move_right = 0;
    //         true_turing_state = 0;
    //         break;
    //     case 3:
    //         true_write = 1;
    //         true_move_right = 1;
    //         true_turing_state = 5;
    //         break;
    //     case 5:
    //         true_write = 1;
    //         true_move_right = 0;
    //         true_turing_state = 2;
    //         break;
    //     case 4:
    //         true_write = 1;
    //         true_move_right = 1;
    //         true_turing_state = 1;
    //         break;
    //     case 8:
    //         true_write = 0;
    //         true_move_right = 0;
    //         true_turing_state = 4;
    //         break;
    //     case 1:
    //         true_write = 1;
    //         true_move_right = 0;
    //         true_turing_state = 3;
    //         break;
    //     case 9:
    //         true_write = 0;
    //         true_move_right = 0;
    //         true_turing_state = 0;
    //         break;
    // }
    #endif
}

void updateLocalState(uint8_t max_i, uint8_t *write, uint8_t *move_right){
    #ifdef STATE4
    switch(max_i) {
        case 0:
            *write = 1;
            *move_right = 1;
            turing_state = 1;
            break;
        case 1:
            *write = 1;
            *move_right = 0;
            turing_state = 0;
            break;
        case 2:
            *write = 1;
            *move_right = 1;
            turing_state = 4;
            break;
        case 3:
            *write = 1;
            *move_right = 1;
            turing_state = 3;
            break;
        case 4:
            *write = 1;
            *move_right = 0;
            turing_state = 1;
            break;
        case 5:
            *write = 0;
            *move_right = 0;
            turing_state = 2;
            break;
        case 6:
            *write = 1;
            *move_right = 0;
            turing_state = 3;
            break;
        case 7:
            *write = 0;
            *move_right = 1;
            turing_state = 0;
            break;
    }
    #else
    // original
    turing_state = max_i >> 2;
    *move_right = (max_i >> 1) & 0x1;
    *write = max_i & 0x1;

    // update everything local
/*
    turing_state = max_i >> 2;
    uint8_t symbol = max_i & 0x1;
    if (turing_state == 0) {    // A
        if (symbol == 0) {*write = 1; *move_right = 1; turing_state = 1;}
        else             {*write = 1; *move_right = 0; turing_state = 2;}
    } else if (turing_state == 1) { // B
        if (symbol == 0) {*write = 1; *move_right = 1; turing_state = 2;}
        else             {*write = 1; *move_right = 1; turing_state = 1;}
    } else if (turing_state == 2) { // C
        if (symbol == 0) {*write = 1; *move_right = 1; turing_state = 3;}
        else             {*write = 0; *move_right = 0; turing_state = 4;}
    } else if (turing_state == 3) { // D
        if (symbol == 0) {*write = 1; *move_right = 0; turing_state = 0;}
        else             {*write = 1; *move_right = 0; turing_state = 3;}
    } else if (turing_state == 4) { // E
        if (symbol == 0) {*write = 1; *move_right = 1; turing_state = 5;}
        else             {*write = 0; *move_right = 0; turing_state = 0;}
    }
*/
    // switch(max_i) {
    //     case 2:
    //         *write = 1;
    //         *move_right = 1;
    //         turing_state = 1;
    //         break;
    //     case 7:
    //         *write = 1;
    //         *move_right = 1;
    //         turing_state = 2;
    //         break;
    //     case 0:
    //         *write = 1;
    //         *move_right = 1;
    //         turing_state = 3;
    //         break;
    //     case 6:
    //         *write = 1;
    //         *move_right = 0;
    //         turing_state = 0;
    //         break;
    //     case 3:
    //         *write = 1;
    //         *move_right = 1;
    //         turing_state = 5;
    //         break;
    //     case 5:
    //         *write = 1;
    //         *move_right = 0;
    //         turing_state = 2;
    //         break;
    //     case 4:
    //         *write = 1;
    //         *move_right = 1;
    //         turing_state = 1;
    //         break;
    //     case 8:
    //         *write = 0;
    //         *move_right = 0;
    //         turing_state = 4;
    //         break;
    //     case 1:
    //         *write = 1;
    //         *move_right = 0;
    //         turing_state = 3;
    //         break;
    //     case 9:
    //         *write = 0;
    //         *move_right = 0;
    //         turing_state = 0;
    //         break;
    // }
    #endif
}
bool possible_i(uint64_t mi) {
    for(int i = 0; i < 9; i++){
        if (possible_max_i[i] == mi)
            return true;
    }

    return false;
}

bool test_Turing(uint8_t move_right, uint8_t write, uint64_t max_i){
    bool ret = true; 
    if (true_turing_state != turing_state) {
        // printf("wrong state: %d, should be: %d\n", turing_state, true_turing_state);
        ret = false;
    }
    if (true_move_right != move_right) {
        // printf("wrong move_right: %d, should be: %d\n", move_right, true_move_right);
        ret = false;
    }
    if (true_write != write) {
        // printf("wrong write: %d, should be: %d\n", write, true_write);
        ret = false;
    }
    // if (max_i != true_max_i) {
    //     // printf("wrong max_i: %lu, should be: %lu\n", max_i, true_max_i);
    //     ret = false;
    // }
    // if (!possible_i(max_i)){
    //     // printf("impossible max_i attained, max_i: %lu\n", max_i);
    //     ret = false;
    // }
    // if (!possible_i(true_max_i)){
    //     // printf("impossible true_max_i attained, max_i: %lu\n", true_max_i);
    //     ret = false;
    // }

    return ret;
}


// const int MINJUMPS = 2;
#define MINJUMPS 50
// const int MAXJUMPS = 10;
#define MAXJUMPS 500 
// const int JUMPINC = 2;
#define INCJUMPS 10 
uint64_t numInstrs[((MAXJUMPS-MINJUMPS)/INCJUMPS + 1)][1000];
uint64_t missedCount[((MAXJUMPS-MINJUMPS)/INCJUMPS + 1)][1000];

#define MINPERCENT 0.3
#define MAXPERCENT 0.6
#define INCPERCENT 0.1
// uint64_t numInstrs[10][1000];
// uint64_t missedCount[10][1000];
void measure() {
    fn_ptr = check_probes;
    //jmp_ptr = 0x400e60;
    jmp_ptr = 0;
    int i;
    double percent = 0.20;

    FILE *fp = fopen("numInstrs", "w");
    FILE *fp2 = fopen("numMisses", "w");
    uint8_t *turing_tape_base = malloc(TURING_TAPE_LEN);

    int itr = 0;
    // for (double per = MINPERCENT; per <= MAXPERCENT; per += INCPERCENT){
    for (int jump = MINJUMPS; jump <= MAXJUMPS; jump += INCJUMPS){
        // fprintf(fp, "percent: %f\n", per);
        // fprintf(fp2, "percent: %f\n", per);
        fprintf(fp, "jump: %d\n", jump);
        fprintf(fp2, "jump: %d\n", jump);
        int experiment = 0;
        usleep(1000);
        while(experiment < MAX_EXPERIMENT){
            instr = 0;
            memset(turing_tape_base, 0, TURING_TAPE_LEN);
            turing_tape = &turing_tape_base[TURING_TAPE_LEN/2];
            turing_state = 0;
            true_turing_state = 0;
            true_max_i = 0;
            int misses = 0;
            // printf("## Run %03d, Step %08lu State: %d, Symbol: %d | misses: %03d\n", experiment, instr, turing_state, *turing_tape, misses);
            uint64_t max_res=0, max_i=0;
            while (1) {
                memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
                cache_hits = 0;
                tot_time = 0;
                for (i=0; i<jump; i++) {
                    // rand_xor = (uint8_t) rand() & 0xff;
                    _mm_clflush(&fn_ptr);
                    // _mm_clflush(&jmp_ptr);
                    turing_state = turing_state & 0xff;
                    *turing_tape = *turing_tape & 0xff;
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

                if ((max_res > percent*jump) && avg < 50){
                    instr++;

                    true_turing();
                    // Update turing state
                    uint8_t write;
                    uint8_t move_right;
                    uint8_t old_turing_state = turing_state;
                    uint8_t old_symbol = *turing_tape;
                    // printf("State: %d, symbol: %d\n", turing_state, *turing_tape);
                    updateLocalState(max_i, &write, &move_right);
                    if (move_right) {
                        *turing_tape++ = write;
                    } else {
                        *turing_tape-- = write;
                    }
                    bool correct = test_Turing(move_right, write, max_i);
                    if (instr % 100 == 0){
                        printf("## Run %03d, Step %08lu, | misses: %03d, max_i: %02lu, true_max_i: %02lu, conf: %0.02f\n", experiment, instr, misses, max_i, true_max_i, ((float)max_res)/jump);
                    }
                    // printf("## Run %03d, Step %08lu, | misses: %03d, max_i: %02lu, true_max_i: %02lu\n", experiment, instr, misses, max_i, true_max_i);
                    // printf("\t-> State: %d, move_right: %d, write: %d, symbol: %d\n", turing_state, move_right, write, *turing_tape);
                    // printf("next max_i = %d\n", lookup[*turing_tape][turing_state]);


                    if (!correct){
                        printf("State: %d, symbol: %d\n", old_turing_state, old_symbol);
                        printf("incorrect turing computation:\n");
                        printf("correct state: %d, received state: %lu\n", 
                            true_turing_state, turing_state);
                        printf("correct move_right: %d, received move_right: %d\n",
                            true_move_right, move_right);
                        printf("correct write: %d, received write: %d\n",
                            true_write, write);
                        printf("correct max_i: %lu, received max_i: %lu\n",
                            true_max_i, max_i);
                        printf("number of instructions: %lu\n", instr);
                        break;
                    }

                    // printf("## Run %03d, Step %08lu State: %d, Symbol: %d | misses: %03d, max_i = %lu\n", experiment, instr, turing_state, *turing_tape, misses, max_i);
                    // misses = 0;
                    // int win = 160;
                    // uint8_t *p = &turing_tape[-win/2];
                    // if (p < turing_tape_base) {
                    //     // printf("  ");
                    //     p = turing_tape_base;
                    // } else {
                    //     // printf("..");
                    // }
                    // for (i=0; i<win; i++) {
                    //     if (p > &turing_tape_base[TURING_TAPE_LEN]) break;
                    //     // printf("%d", *p++);
                    // }
                    // if (i==win) printf("..");
                    // printf("\n");
                    // printf("                                             ");
                    // for (i=0; i<win/2; i++) {
                    //     // printf(" ");
                    // }
                    // printf("^\n");

                    if (instr >= 20000){
                        // good enough for govt work
                        break;
                    }
                    #ifdef STATE4
                    if (turing_state == 4) {
                    #else
                    if (turing_state == 5) {
                    #endif
                        // printf("halt state reached!\n");
                        // printf("## Run %03d, Step %08lu State: %d, Symbol: %d | misses: %03d, max_i = %lu\n", experiment, instr, turing_state, *turing_tape, misses, max_i);
                        break;
                    }

                } else {
                    // printf("--[%lu]: %lu, %lu avg cycles ps %ld\n", max_i, max_res, avg, cur_probe_space);
                    misses++;
                    if (misses % 100 == 0){
                        printf("## Run %03d, Step %08lu, | misses: %03d, max_i: %02lu, true_max_i: %02lu, conf: %0.02f\n", experiment, instr, misses, max_i, true_max_i, ((float)max_res)/jump);
			if (((float)max_res)/jump >= percent){
				printf("confidence higher than threshold?\n");
				printf("max_res: %lu, need to beat: %0.02f\n", max_res, percent*jump);
				printf("avg: %lu\n", avg);
			}
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

            printf("## Jump: %03d, Percent: %0.02f, Run %03d, Step %08lu | misses: %03d, max_i: %02lu, %lu/%d = %0.5f%% conf, true_max_i: %02lu\n\tcur_probe_space = %lu\n", jump, percent, experiment, instr, misses, max_i, max_res, jump, 100*((float)max_res)/jump, true_max_i, cur_probe_space);
            numInstrs[itr][experiment] = instr;
            missedCount[itr][experiment++] = misses;
            // rand_xor = (uint8_t) rand() & 0xff;
        } //experiment 
        for (int j = 0; j < MAX_EXPERIMENT; j++){
            fprintf(fp, "%lu ", numInstrs[itr][j]);
            fprintf(fp2, "%lu ", missedCount[itr][j]);
        }
        fprintf(fp, "\n");
        fprintf(fp2, "\n");
        itr++;
    } //jump


    fclose(fp);
    fclose(fp2);

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

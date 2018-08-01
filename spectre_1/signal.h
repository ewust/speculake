#include <stdint.h>
#include <stdbool.h>
#include "stringify.h"


#define __SIGNAL(val, reg1, reg2, reg3)     \
        movq $(val), reg2;                     \
        mov (cur_probe_space), reg1;        \
        imul reg1, reg2;                          \
        mov (probe_buf), reg3;              \
        add reg2, reg3;                     \
        mov (reg3), reg1;

#define __signal(value) \
        __stringify(__SIGNAL(value, %%rax, %%rcx, %%rdx))

extern uint8_t* probe_buf;
extern uint64_t cur_probe_space;
#define NUM_PROBES 256

/*
 * Find the K items in results that have been hit the most often
 */
bool get_top_k(uint64_t k, uint64_t* results, uint64_t* output_i, uint64_t* output_res, 
               const int MAX_ITERATIONS);

/*
 * Signal32 will use a bitmask on the upper part of each item in the 
 * Top-K items to identify where it goes in the final result. This 
 * reconstructs that result by identifying the bitmasks.
 */
uint64_t construct_result(uint64_t k, uint64_t width, uint64_t* top_k);


void signal(uint64_t state);

void signal32(uint32_t state);

void signal40(uint64_t state);



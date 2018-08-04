#include <stdio.h>
#include "signal.h"

inline void signal(uint64_t state){
    asm volatile ("mov (%%rcx), %%rax" :: "c"(&probe_buf[state*cur_probe_space]) : "rax");
}


inline void signal32(uint32_t state){
    uint32_t a, b, c, d;
    a = state & 0xFF;
    b = state>>8 & 0xFF | 0x100;
    c = state>>16 & 0xFF| 0x200;
    d = state>>24 & 0xFF| 0x300;
    asm volatile (
        "mov (%0), %%rax\n" 
        "mov (%1), %%rbx\n" 
        "mov (%2), %%rcx\n" 
        "mov (%3), %%rdx\n" 
        ::  "r"(&probe_buf[a*cur_probe_space]),
            "r"(&probe_buf[b*cur_probe_space]), 
            "r"(&probe_buf[c*cur_probe_space]),
            "r"(&probe_buf[d*cur_probe_space]) : "rax", "rbx", "rcx", "rdx");
}


inline void signal40(uint64_t state){
    uint32_t a, b, c, d, e, f, g, h;
    a = state & 0x1F;
    b = state>>0x05 & 0x1F | 0x20;
    c = state>>0x0A & 0x1F | 0x40;
    d = state>>0x0F & 0x1F | 0x60;
    e = state>>0x14 & 0x1F | 0x80;
    f = state>>0x19 & 0x1F | 0xA0;
    g = state>>0x1E & 0x1F | 0xC0;
    h = state>>0x23 & 0x1F | 0xE0;
    asm volatile (
        "mov (%0), %%rax\n" 
        "mov (%1), %%rbx\n" 
        "mov (%2), %%rcx\n" 
        "mov (%3), %%rdx\n" 
        "mov (%4), %%rsi\n" 
        "mov (%5), %%rdi\n" 
        "mov (%6), %%r8\n" 
        "mov (%7), %%r9\n" 
        ::  "r"(&probe_buf[a*cur_probe_space]),
            "r"(&probe_buf[b*cur_probe_space]), 
            "r"(&probe_buf[c*cur_probe_space]),
            "r"(&probe_buf[d*cur_probe_space]),
            "r"(&probe_buf[e*cur_probe_space]),
            "r"(&probe_buf[f*cur_probe_space]),
            "r"(&probe_buf[g*cur_probe_space]),
            "r"(&probe_buf[h*cur_probe_space])
         : "rax", "rbx", "rcx", "rdx");
}

/*
 * Find the K items in results that have been hit the most often
 */
bool get_top_k(uint64_t k, uint64_t* results, uint64_t* output_i, uint64_t* output_res,
               const int MAX_ITERATIONS){
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


/*
 * Signal32 will use a bitmask on the upper part of each item in the 
 * Top-K items to identify where it goes in the final result. This 
 * reconstructs that result by identifying the bitmasks.
 */
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

#include <unistd.h>
#include <stdint.h>
#include <stdio.h>
#include "signal.h"

extern uint8_t *probe_buf;
extern uint64_t cur_probe_space;
extern uint64_t signal_idx;

uint64_t try_decrypt(void);
__uint128_t aes_ctr(uint64_t ctr);

extern uint8_t *turing_tape;
extern uint8_t turing_state;

void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void)
{
    asm volatile (
        ".rept 0x6; nop; .endr\n"
    "target_fn_start:"

        ".rept 32\n"
        __signal(0x66)
        "nop;nop;nop;nop;nop;nop\n" // cover (pop %rax; call 1f;)
        
        ".endr\n"
        :::"rax", "rcx", "rdx");  
}

void end_target_fn(void) __attribute__((section(".targetfn")));
void end_target_fn(void) {
}


#include <unistd.h>
#include <stdint.h>
#include "signal.h"


uint64_t try_decrypt(void);
__uint128_t aes_ctr(uint64_t ctr);


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


    // signal(0x11);               // in measure k = 1, width=8;
    // signal32(0xDEADBEEF);    // in measure k = 4, width=8
    // signal40(0xDEADBEEF44);  // in measure k = 8, width=5

    // in measure k = 1, width=8
    // __uint128_t register pt = aes_ctr(signal_idx / 16);
    // signal(pt >> ((signal_idx % 16)*8) & 0xff);

    // in measure k = 4, width=8
    // __uint128_t register pt = aes_ctr(signal_idx / 4);
    // signal32(pt >> ((signal_idx % 4)*32));

}

void end_target_fn(void) __attribute__((section(".targetfn")));
void end_target_fn(void) {
}


#include <unistd.h>
#include <stdint.h>

extern uint8_t *probe_buf;
extern uint64_t cur_probe_space;
extern uint64_t signal_idx;

uint64_t try_decrypt(void);
__uint128_t aes_ctr(uint64_t ctr);

extern uint8_t *turing_tape;
extern uint8_t turing_state;

inline void signal(uint64_t state) __attribute__((always_inline));
inline void signal32(uint32_t state) __attribute__((always_inline));
inline void signal40(uint64_t state) __attribute__((always_inline));

void signal(uint64_t state)
{
    asm volatile ("mov (%%rcx), %%rax" :: "c"(&probe_buf[state*cur_probe_space]) : "rax");
}


void signal32(uint32_t state)
{
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


void signal40(uint64_t state)
{
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



void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void)
{
    /* asm volatile (
        ".rept 0x6; nop; .endr\n"
    "target_fn_start:"

        ".rept 32\n"
        //Signal(0x66)
        "movq $0x66, %%rcx\n"
        "mov (cur_probe_space), %%rax\n"
        "imul %%rcx\n"
        "mov (probe_buf), %%rdx\n"
        "add %%rax, %%rdx\n"
        "mov (%%rdx), %%rax\n"

        "nop;nop;nop;nop;nop;nop\n" // cover (pop %rax; call 1f;)
        
        ".endr\n"
    :::"rax", "rcx", "rdx");  
    */


    signal(0x11);               // in measure k = 1, width=8;
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


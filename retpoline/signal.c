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

#include <stdint.h>
#include <stdbool.h>
#include "stringify.h"


#define __SIGNAL(val, reg1, reg2, reg3)     \
        movq $(val), reg2;                     \
        mov (cur_probe_space), reg1;        \
        imul reg2;                          \
        mov (probe_buf), reg3;              \
        add reg1, reg3;                     \
        mov (reg3), reg1;

#define __signal(value) \
        __stringify(__SIGNAL(value, %%rax, %%rcx, %%rdx))

extern uint8_t* probe_buf;
extern uint64_t cur_probe_space;

void signal(uint64_t state);

void signal32(uint32_t state);

void signal40(uint64_t state);



#ifndef COMMON_H
#define COMMON_H

extern void __attribute__((section(".fnptr"))) (*fn_ptr)(void);
void indirect(void *jmp_ptr) __attribute__((section(".indirect")));

#endif

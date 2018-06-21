#ifndef COMMON_H
#define COMMON_H

extern void __attribute__((section(".fnptr"))) (*fn_ptr)(void);
extern uint64_t __attribute__((section(".jmpptr"))) jmp_ptr;
void indirect(void *jmp_ptr) __attribute__((section(".indirect")));
void end_indirect(void);

#endif

#ifndef COMMON_H
#define COMMON_H

extern void __attribute__((section(".fnptr"))) (*fn_ptr)(void);
extern void __attribute__((section(".fnptr2"))) (*fn_ptr2)(void);
extern uint64_t __attribute__((section(".jmpptr2"))) jmp_ptr2;
void indirect(void *jmp_ptr) __attribute__((section(".indirect")));
extern void __attribute__((section(".aliasfnptr"))) (*alias_fn_ptr)(void);
void alias_indirect(void *jmp_ptr) __attribute__((section(".aliasindirect")));
void end_indirect(void);

#endif

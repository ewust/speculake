#ifndef COMMON_H
#define COMMON_H

extern void __attribute__((section(".fnptr"))) (*fn_ptr)(void);
void indirect(void *jmp_ptr) __attribute__((section(".indirect")));
extern void __attribute__((section(".aliasfnptr"))) (*alias_fn_ptr)(void);
void alias_indirect(void *jmp_ptr) __attribute__((section(".aliasindirect")));

#endif

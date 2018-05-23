#ifndef FULL_EMULATOR_H 
#define FULL_EMULATOR_H
#include <unicorn/unicorn.h>
#define BUFFSIZE 1024*1024
#define CODESIZE 3

void initializeUnicorn(uc_engine *);
int setCode(char[CODESIZE], char[BUFFSIZE]);
int updateUnicorn(char[CODESIZE], uc_engine *, int);
void printState(uc_engine *);
void subString(char[BUFFSIZE], char[8], int); 
void *qemu_get_ram_ptr_arm(void*, long);
#endif
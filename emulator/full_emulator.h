#ifndef FULL_EMULATOR_H 
#define FULL_EMULATOR_H
#include <unicorn/unicorn.h>
#define BUFFSIZE 1024*1024
#define CODESIZE 3

typedef struct Sections {
    uint64_t text_offset;
    uint64_t data_offset;
    uint64_t rodata_offset;
    uint64_t text_size;
    uint64_t data_size;
    uint64_t rodata_size;
} Sections;
void initializeUnicorn(uc_engine *, Sections sect);
int setCode(char[CODESIZE], char[BUFFSIZE]);
int updateUnicorn(char code[BUFFSIZE], uint64_t start, uc_engine *uc, int len);
void runUnicorn(uc_engine *uc, uint64_t start, Sections);
void printState(uc_engine *);
void subString(char[BUFFSIZE], char[8], int); 
void *qemu_get_ram_ptr_arm(void*, long);

static void test_arm(FILE *fp, uint64_t entryPoint, Sections sect);
uint64_t forwardToText64(FILE *fp, Elf64_Ehdr eh, Sections *sect);
uint32_t forwardToText(FILE *fp, Elf32_Ehdr eh, Sections *sect);
#endif
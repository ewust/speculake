#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <sys/mman.h>
#include <unicorn/unicorn.h>
#include <unistd.h>

#include "full_emulator.h"
#define ADDRESS 0x1000000
// code to be emulated
#define ARM_CODE "\x04\xb0\x8b\xe2\x04\xb0\x8b\xe2" // mov r0, #0x37; sub r1, r2, r3

void initializeUnicorn(uc_engine *uc){
    // int r_2 = 0x7;     
    // int r_3 = 0x8;     
    int sp = 0x1001234;
    // map 2MB memory for this emulation
    uc_mem_map(uc, ADDRESS, 2 * 1024 * 1024, UC_PROT_ALL);
    uc_reg_write(uc, UC_ARM_REG_SP, &sp);
    // uc_reg_write(uc, UC_ARM_REG_R2, &r_2);
    // uc_reg_write(uc, UC_ARM_REG_R3, &r_3);
}

int min(int a, int b){
    if (a < b){
        return a;
    } else {
        return b;
    }
}

void subString(char s[BUFFSIZE], char t[8], int len) {
    for (int i = 0; i < 8; i++) {
        t[i] = s[i];
    }

}

int setCode(char c[BUFFSIZE], char s[BUFFSIZE]) {
    int len = min(BUFFSIZE, strlen(s)+1);
    // printf("len = %d\n", len);
    for (int i = 0; i < len; i += 8){
        char t[8];
        subString(s+i,t,8);
        long tmp = strtol(t, NULL, 16);
        // printf("tmp = %lx\n", tmp);
        int j = 4*(i/8);
        memcpy(c+j, &tmp, 4);
    }
    // printf("code = \t\t0x");
    // for (int i = 0; i < len; i++){
    //     printf("%02x",c[i]);
    // }
    // printf("\n");

    return (8*(len/9))+1;
}

int updateUnicorn(char code[BUFFSIZE], uc_engine *uc, int len){
    uc_err err;
    // write machine code to be emulated to memory
    if (uc_mem_write(uc, ADDRESS, code, len - 1)) {
        printf("Failed to write emulation code to memory, quit!\n");
        return -1;
    }

    // emulate code in infinite time, unlimited number of instructions
    err = uc_emu_start(uc, ADDRESS, ADDRESS + len - 1, 0, 0);
    if (err) {
        printf("failed on uc_emu_start() with error returned %u: %s\n",
                err, uc_strerror(err));
    }

    return 0;
}

void printState(uc_engine *uc) {
    int r_2 = 0x0;
    int r_3 = 0x0;
    int sp = 0x0;
    printf("Emulation done. Below is the CPU context\n");

    uc_reg_read(uc, UC_ARM_REG_R2, &r_2);
    uc_reg_read(uc, UC_ARM_REG_R3, &r_3);
    uc_reg_read(uc, UC_ARM_REG_SP, &sp);
    printf(">>> R2 = 0x%x\n", r_2);
    printf(">>> R3 = 0x%x\n", r_3);
    printf(">>> SP = 0x%x\n", sp);
}


// callback for SVC instruction (ARM).
static void hook_syscall(uc_engine *uc, void *user_data)
{
    uint8_t *p = qemu_get_ram_ptr_arm(uc, 0);
    printf("p = %p\n", p);
    // int em_r7;
    // int em_r0;
    // int em_r1;
    // int em_r2;
    // int em_r3;
    // int em_r4;
    // int em_r5;
    // int em_sp;
    uint64_t r7;
    uint64_t r0;
    uint64_t r1;
    uint64_t r2;
    uint64_t r3;
    uint64_t r4;
    uint64_t r5;
    uint64_t sp;

    int opcode;

    // uc_reg_read(uc, UC_ARM_REG_R7, &em_r7);
    // uc_reg_read(uc, UC_ARM_REG_R0, &em_r0);
    // uc_reg_read(uc, UC_ARM_REG_R1, &em_r1);
    // uc_reg_read(uc, UC_ARM_REG_R2, &em_r2);
    // uc_reg_read(uc, UC_ARM_REG_R3, &em_r3);
    // uc_reg_read(uc, UC_ARM_REG_R4, &em_r4);
    // uc_reg_read(uc, UC_ARM_REG_R5, &em_r5);
    // uc_reg_read(uc, UC_ARM_REG_SP, &em_sp);
    // int em_pc;
    // uc_reg_read(uc, UC_ARM_REG_PC, &em_pc);
    // printf("pc = %02x\n", em_pc);
    // printf("sp = %02x\n", em_sp);
    // printf("r0 = %02x\n", em_r0);
    // printf("r1 = %02x\n", em_r1);
    // printf("r2 = %02x\n", em_r2);
    // printf("r3 = %02x\n", em_r3);
    // printf("r4 = %02x\n", em_r4);
    // printf("r5 = %02x\n", em_r5);
    // printf("r7 = %02x\n", em_r7);
    uc_reg_read(uc, UC_ARM_REG_R7, &r7);
    uc_reg_read(uc, UC_ARM_REG_R0, &r0);
    uc_reg_read(uc, UC_ARM_REG_R1, &r1);
    uc_reg_read(uc, UC_ARM_REG_R2, &r2);
    uc_reg_read(uc, UC_ARM_REG_R3, &r3);
    uc_reg_read(uc, UC_ARM_REG_R4, &r4);
    uc_reg_read(uc, UC_ARM_REG_R5, &r5);
    uc_reg_read(uc, UC_ARM_REG_SP, &sp);
    int pc;
    uc_reg_read(uc, UC_ARM_REG_PC, &pc);
    printf("pc = 0x%02x\n", pc);
    printf("sp = 0x%02lx\n", sp);
    printf("r0 = 0x%02lx\n", r0);
    printf("r1 = 0x%02lx\n", r1);
    printf("r2 = 0x%02lx\n", r2);
    printf("r3 = 0x%02lx\n", r3);
    printf("r4 = 0x%02lx\n", r4);
    printf("r5 = 0x%02lx\n", r5);
    printf("r7 = 0x%02lx\n", r7);

    // uint64_t r1;
    // switch(em_r7) {
    //     case 0x1:
    //         opcode = 60;
    //         break;
    //     case 0x4:
    //         opcode = 1;
    //         // converts emulated address to physical address. Uses dictated ADDRESS 
    //         // subtracts this from the given address, adds this to addr (the base)
    //         // address and returns this.
    //         p = p + (em_r1 - ADDRESS);
    //         printf("new p = %p\n", p);
    //         r1 = (uint64_t) p;
    //         printf("new r1 = 0x%02lx\n", r1);
    //         break;
    //     case 0x119:
    //         opcode = 0x29;
    //         break;
    // }
    switch((int)r7) {
        case 0x1:
            opcode = 60;
            break;
        case 0x4:
            opcode = 1;
            // converts emulated address to physical address. Uses dictated ADDRESS 
            // subtracts this from the given address, adds this to addr (the base)
            // address and returns this.
            p = p + ((int)r1 - ADDRESS);
            printf("new  p = %p\n", p);
            r1 = (uint64_t) p;
            printf("new r1 = 0x%02lx\n", r1);
            r2 = (int) r2;
            printf("new r2 = 0x%02lx\n", r2);
            break;
        case 0x119:
            opcode = 0x29;
            break;
    }

    printf("Executing syscall: 0x%x\n", opcode);


    // printf("\nr7 = %d\n", r7);
    // printf("rax = %d\n", opcode);
    // printf("rdi = %d\n", r0);
    // printf("rsi = 0x%02x\n", r1);
    // printf("rdx = %d\n", r2);
    // printf("r10 = %d\n", r3);
    // printf("r8 = %d\n", r4);
    // printf("r9 = %d\n", r5);
    // asm volatile(
    //     "movq %q[r0], %%rdi\n"
    //     "movq %q[r1], %%rsi\n"
    //     "movq %q[r2], %%rdx\n"
    //     "movq %q[r3], %%r10\n"
    //     "movq %q[r4], %%r8\n"
    //     "movq %q[r5], %%r9\n"
    //     "movq %q[opcode], %%rax\n"
    //     "syscall\n"
    //     : 
    //     : [r0] "r" (em_r0), [r1] "r" (r1), [r2] "r" (em_r2), [r3] "r" (em_r3), [r4] "r" (em_r4), [r5] "r" (em_r5), [opcode] "r" (opcode)
    //     : "rdi", "rsi", "rdx", "r10", "r8", "r9", "rax");
    asm volatile(
        "movq %q[r0], %%rdi\n"
        "movq %q[r1], %%rsi\n"
        "movq %q[r2], %%rdx\n"
        "movq %q[r3], %%r10\n"
        "movq %q[r4], %%r8\n"
        "movq %q[r5], %%r9\n"
        "movq %q[opcode], %%rax\n"
        "syscall\n"
        : 
        : [r0] "r" (r0), [r1] "r" (r1), [r2] "r" (r2), [r3] "r" (r3), [r4] "r" (r4), [r5] "r" (r5), [opcode] "r" (opcode)
        : "rdi", "rsi", "rdx", "r10", "r8", "r9", "rax");
}

static void test_arm(void)
{
    uc_engine *uc;
    uc_err err;
    uc_hook trace1;
    char code[BUFFSIZE];
    char str[BUFFSIZE];

    FILE *fp;
 
    fp = fopen("bytes", "r");
    int r0 = 0x1234;     // R0 register
    int r2 = 0x6789;     // R1 register
    int r3 = 0x3333;     // R2 register
    int r1;     // R1 register
    int sp = 0x4321;     // SP register
    int fp_r;     // FP register

    printf("Emulate ARM code\n");

    // Initialize emulator in ARM mode
    err = uc_open(UC_ARCH_ARM, UC_MODE_ARM, &uc);
    if (err) {
        printf("Failed on uc_open() with error returned: %u (%s)\n",
                err, uc_strerror(err));
        return;
    }
    initializeUnicorn(uc);

    // map 2MB memory for this emulation
    // uc_mem_map(uc, ADDRESS, 2 * 1024 * 1024, UC_PROT_ALL);

    // initialize machine registers
    uc_reg_write(uc, UC_ARM_REG_R0, &r0);
    uc_reg_write(uc, UC_ARM_REG_R2, &r2);
    // uc_reg_write(uc, UC_ARM_REG_R3, &r3);
    // uc_reg_write(uc, UC_ARM_REG_SP, &sp);

    // add hook for syscall
    uc_hook_add(uc, &trace1, UC_HOOK_INTR, hook_syscall, NULL, 1, 0);

    bzero(str, BUFFSIZE);
    while(fgets(str, BUFFSIZE, fp))
    {
        memset(code, 0, BUFFSIZE);
        printf("Received: %s\n",str);
        int len = setCode(code, str);
        updateUnicorn(code, uc, len);
        // printState(uc);
 
        bzero(str, BUFFSIZE);
    }
    // emulate machine code in infinite time (last param = 0), or when
    // finishing all the code.
    // err = uc_emu_start(uc, ADDRESS, ADDRESS + sizeof(ARM_CODE) -1, 0, 0);
    // if (err) {
    //     printf("Failed on uc_emu_start() with error returned: %u\n", err);
    // }

    // now print out some registers
    printf(">>> Emulation done. Below is the CPU context\n");

    uc_reg_read(uc, UC_ARM_REG_R0, &r0);
    uc_reg_read(uc, UC_ARM_REG_R1, &r1);
    uc_reg_read(uc, UC_ARM_REG_FP, &fp_r);
    uc_reg_read(uc, UC_ARM_REG_SP, &sp);
    printf(">>> R0 = 0x%x\n", r0);
    printf(">>> R1 = 0x%x\n", r1);
    printf(">>> SP = 0x%x\n", sp);
    printf(">>> FP = 0x%x\n", fp_r);

    uc_close(uc);
}

int main(int argc, char **argv, char **envp)
{
    test_arm();

    return 0;
}

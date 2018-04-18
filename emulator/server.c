#include <sys/socket.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <netdb.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <unicorn/unicorn.h>
#include <unistd.h>
 
#include "server.h"
#define ADDRESS 0x1000000

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

void setCode(char c[CODESIZE], char s[BUFFSIZE]) {
    long tmp = strtol(s, NULL, 16);
    // printf("tmp = %lx\n", tmp);
    memcpy(c, &tmp, 2);
    // printf("code = 0x");
    // for (int i = 0; i < 2; i++){
    //     printf("%02x",c[i]);
    // }
    // printf("\n");
}

int updateUnicorn(char code[CODESIZE], uc_engine *uc){
    uc_err err;
    // write machine code to be emulated to memory
    if (uc_mem_write(uc, ADDRESS, code, CODESIZE - 1)) {
        printf("Failed to write emulation code to memory, quit!\n");
        return -1;
    }

    // emulate code in infinite time, unlimited number of instructions
    err = uc_emu_start(uc, ADDRESS | 1, ADDRESS + CODESIZE - 1, 0, 0);
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

void syscallWrapper(uc_engine *uc) {
    int r7;
    // get the type of call
    uc_reg_read(uc, UC_ARM_REG_R7, &r7);
    printf(">> R7 = 0x%x\n", r7);
    switch(r7) {
        case 1:
            asm volatile(
                "mov $0x00, %%rdi\n"
                "mov $60, %%rax\n"
                "syscall\n"
                ::: "rdi", "rax");
            break;
        case 4:
            printf("write syscall\n");
            int r2, sp, tmp;
            uc_reg_read(uc, UC_ARM_REG_R2, &r2);
            uc_reg_read(uc, UC_ARM_REG_SP, &sp);
            printf("len = %d\n", r2);

            int nearestMultof8 = r2 + 8 - (r2%8);
            char *buf = malloc(sizeof(char) * (nearestMultof8+1));
            // char *buf2 = malloc(sizeof(char) * (nearestMultof8+1));
            memset(buf, 0, nearestMultof8+1);
            // memset(buf2, 0, nearestMultof8+1);
            for (int i = 0; i < r2; i++){
                if (!uc_mem_read(uc, sp +4*i, &tmp, sizeof(tmp))){
                    printf(">>> Read 4 bytes from [0x%x] = 0x%x\n", sp+4*i, tmp);
                    buf[r2-i-1] = (char) tmp;
                    // buf2[i] = (char) tmp;
                }
                else
                    printf(">>> Failed to read 4 bytes from [0x%x]\n", sp);
            }
            // printf("buf2 = %s", buf2);

            printf("buf = 0x");
            for(int i = 0; i < r2; i++) {
                printf("%02x", buf[i]);
            }
            printf("\n");
            // now get buf onto the stack
            asm volatile (
                // push loop to put all of buf on stack
                "movq %%rsp, %%r8\n"
                "mov $0x0, %%rbx\n"
                "movq %q[buf], %%rcx\n"
                "loop: ;"
                "movq  (%%rcx), %%rax\n"
                "bswap %%rax\n"
                "push %%rax\n"
                "add $0x8, %%rcx\n"
                "add $0x8, %%rbx\n"
                "cmpq %%rbx, %q[len]\n"
                "jge loop\n"
                // "mov  $0x0A646C72, %%rax\n"
                // "push %%rax\n"
                // "mov  $0x6F57206F6C6C6548, %%rax\n"
                // "push %%rax\n"
                "mov $0x1, %%rax\n"
                "mov $0x1, %%rdi\n"
                "mov %%rsp, %%rsi\n"
                "movq %%r8, %%rsp\n"
                "subq %q[len], %%rbx\n"
                "addq %%rbx, %%rsi\n"
                "movq %q[len], %%rdx\n"
                "syscall\n"
                :
                :[len] "r" (r2), [buf] "r" (buf)
                : "rdi", "rsi", "rdx", "rsp", "rax", "rbx", "rcx", "r8", "memory", "cc");
            free(buf);
            // free(buf2);
            break;
    }
}

int main(int argc, char **argv)
{
 
    char str[BUFFSIZE];
    char code[CODESIZE] = "\x00\x00\x00";
    int listen_fd, comm_fd;
    uc_engine *uc;
    uc_err err;
    int ch, extra, status = 0, len;
    pid_t cPID, wPID;
 
    err = uc_open(UC_ARCH_ARM, UC_MODE_THUMB, &uc);
    if (err) {
        printf("Failed on uc_open() with error returned: %u\n", err);
        return -1;
    }

    initializeUnicorn(uc);

    struct sockaddr_in servaddr;
 
    listen_fd = socket(AF_INET, SOCK_STREAM, 0);
 
    bzero( &servaddr, sizeof(servaddr));
 
    servaddr.sin_family = AF_INET;
    servaddr.sin_addr.s_addr = htons(INADDR_ANY);
    if (argc <= 1)
        servaddr.sin_port = htons(22000);
    else
        servaddr.sin_port = htons(atoi(argv[1]));
 
    bind(listen_fd, (struct sockaddr *) &servaddr, sizeof(servaddr));
 
    listen(listen_fd, 10);
 
    comm_fd = accept(listen_fd, (struct sockaddr*) NULL, NULL);
 
    bzero(str, BUFFSIZE);
    while((len = read(comm_fd, str, BUFFSIZE)) > 0)
    {
        // printf("Received: %s\n",str);
        if (strcmp(str, "df00") == 0) {
            printf("syscall\n");
            syscallWrapper(uc);
        }
        else {
            setCode(code, str);
            updateUnicorn(code, uc);
            memset(code, 0, CODESIZE);
            // printState(uc);
        }
 
        write(comm_fd, str, strlen(str)+1);
        bzero(str, BUFFSIZE);
    }

    // done with emulation, print registers:
    printState(uc);
    uc_close(uc);

    return 0;

}

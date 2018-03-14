

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <sys/syscall.h>

#include "spasm.h"



// Test the Syscall Function with the Register Pointer (sinulated with an array)
// TODO
int test_doSyscall_mmap(){   //R ax bx cx   dx si di r8 r9  STACK
    uint64_t R_mock[16] = {0, 1, 0, 0, 0x8, 1, 1, 0, 0, 
            0x0a41424344454648,0,0,0,0,0,0};

    R_mock[5] = (int64_t)(R_mock + STK_OFFSET);
    
    printf("R(array): %016lX, R(addr):%016lX, RSI:%016lX\n",(uint64_t)R_mock, (uint64_t)&R_mock, R_mock[5]);

    doSyscall(R_mock);

    printRegs_64((R_mock));
    return 1;
}


// Test the Syscall Function with the Register Pointer (sinulated with an array)
int test_doSyscall_write(){   
                         //R ax bx cx   dx si di r8 r9  STACK
    uint64_t R_mock[16] = {0, 1, 0, 0, 0x8, 1, 1, 0, 0, 
            0x0a41424344454648,0,0,0,0,0,0};

    R_mock[5] = (int64_t)(R_mock + STK_OFFSET);
    
    printf("R(array): %016lX, R(addr):%016lX, RSI:%016lX\n",(uint64_t)R_mock, (uint64_t)&R_mock, R_mock[5]);

    doSyscall(R_mock);
    return 1;
}



void test_changeR(){
    uint64_t R_mock[3] = {0,1,2};
    uint8_t step = 0x0;
    
    for (step=0; step < 16; step++){
        doUpdateR(R_mock, step);
        doSHLR(R_mock);
        printf("step: %02X,\t -- R: 0x%lX\n", step, R_mock[0]);
    }
}

/*
void test_doChangeDerefR(){ 
    uint64_t R_mock[16] = {9,9,0,0,0,0,0,0,0,0,0, 0,0,0,0,0};
    uint64_t *R_p = &(R_mock[2]);
    int i =0;
    
    doUpdateR(R_p, (uint8_t)0x4);
    doSHLR(R_p);
    for (i=0; i<15; i++){
        doChangeDerefR(R_p, true);
        printf("SRAX: %lX\n",*(R_p+1)); 
        *R_p +=1;
    }
    printRegs_64(R_p);

    for (i=15; i>0; i--) {
        doChangeDerefR(R_p, false);
        printf("SRAX: %lX\n",*(R_p+1)); 
        *R_p -=1;
    }
    printRegs_64(R_p);
}*/


void test_PushPop(){
    uint64_t R_mock[16] = {9,9,0,0,0,0,0,0,0,0,0, 0,0,0,0,0};
    uint64_t *R_p = &(R_mock[2]);
    uint8_t step = 0x0;
    
    for (step=0; step < 8; step++){
        doUpdateR(R_p, step);
        doSHLR(R_p);
    }
    printf("Push R: 0x%lX\n", *R_p);
    doPushR( R_p );
    printRegs_64(R_p);
    doPushR( R_p );
    doPushR( R_p );
    
    for (step=0xf; step >8 ; step--){
        doUpdateR(R_p, step);
        doSHLR(R_p);
    }
    printf("Push R: 0x%lX\n", *R_p);
    doPushR( R_p );
    printRegs_64(R_p);
    doPopR(R_p);
    printRegs_64(R_p);
    doPopR(R_p);
    printRegs_64(R_p);
     
    for (step=0; step < 8; step ++){doSHLR(R_p);}
    doPushR(R_p);
    doPushR(R_p);
    doPushR(R_p);
    printRegs_64(R_p);
    doPopR(R_p);
    doPopR(R_p);
    doPopR(R_p);
    doPopR(R_p);
    doPopR(R_p);
    doPopR(R_p);
    printRegs_64(R_p);
}


int test_asmSyscall(){
    int ret; 
    asm volatile(
        "mov  $0x0A646C72, %%rax\n"
        "push %%rax\n"
        "mov  $0x6F57206F6C6C6548, %%rax\n"
        "push %%rax\n"
        "mov $0x1, %%rax\n"
        "mov $0x1, %%rdi\n"
        "mov %%rsp, %%rsi\n"
        "mov $0x0C, %%rdx\n"
        "syscall\n"
        :"=a"(ret):: "rdi", "rsi", "rdx");

    printf("Bytes Written: 0x%X\n", ret);
    return ret;
}


void test_printISA(){
    printISA();
}


void test_printISA_short(){
    printISA_short();
}


int test_generic(){
    bool b[5] = {1,1,1,0,1};
    char s[] = "TEST";
    uint64_t i =1;

    printf("%d, %d\n", (5 & 4), SYS_write);
    printf("%016lX\n",(i<<63));

    return 1;
}

int main(){
    test_printISA_short();
    // test_printISA();
    printf("----------------------------------------\n");
    // test_doSyscall_write();
    // test_changeR();
    // test_PushPop();
    // test_generic();
    // test_doChangeDerefR();
    // test_doCall();
}
    

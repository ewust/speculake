

#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>
#include <sys/syscall.h>

#include "spasm.h"



// Test the Syscall Function with the Register Pointer (sinulated with an array)
// TODO
int test_doSyscall_mmap(){   //R ax bx cx   dx si di r8 r9  STACK

    uint_reg R_mock[16] = {0, 1, 0, 0, 0x8, 1, 1, 0, 0, 
            0x0a414243, 0x44454648,0,0,0,0,0};
    R_mock[5] = (uint_reg)(R_mock + STK_OFFSET);
    
    printf("R(array): %08X, R(addr):%08X, RSI:%08X\n",(uint_reg)R_mock, (uint_reg)&R_mock, R_mock[5]);

    doSyscall(R_mock);

    printRegs((R_mock), 0);
    return 1;
}


// Test the Syscall Function with the Register Pointer (sinulated with an array)
void test_doSyscall_write(){   
    printf("--------[ Test doSyscall write ]--------\n");
    
    uint_reg R_mock[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    R_mock[SRAX_OFFSET] = 0x4;
    R_mock[SRBX_OFFSET] = 0x1;
    R_mock[SRCX_OFFSET] = (uint_reg)(R_mock + STK_OFFSET);
    R_mock[SRDX_OFFSET] = 0xC;
    R_mock[STK_OFFSET] = 0x6C6C6548;
    R_mock[STK_OFFSET+1]  = 0x6F57206F;
    R_mock[STK_OFFSET+2]  = 0x0A646C72;

    doSyscall(R_mock);

    printf("Bytes Written 0x%X\n", R_mock[SRAX_OFFSET]);
}


void test_changeRegs(){
    printf("--------[ Test Update SHL Swap ]--------\n");
    uint_reg R_mock[16] = {0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0};
    uint8_t step = 0x0;
    
    for (step=0; step < 16; step++){
        doSHLReg( &(R_mock[VAL_OFFSET]) );
        doUpdateReg( &(R_mock[VAL_OFFSET]), step );
        printf("step: %02X -- PTR:%08X,  VAL: 0x%08X\n", step, R_mock[PTR_OFFSET], R_mock[VAL_OFFSET]);
        doSwap(R_mock);
    }
}


void test_ControlFlow(){
    printf("-[ Test Base UPTR SHPTR CMP JMP SETIP ]-\n");
    uint_reg R_mock[16] = {0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0};
    
    R_mock[SRAX_OFFSET] = 0x1;
    R_mock[SRDI_OFFSET] = 0x1;
    R_mock[SRSI_OFFSET] = (uint_reg)(R_mock + STK_OFFSET);
    R_mock[SRDX_OFFSET] = 0xC;

    printRegs(R_mock, 0);
    
    update(R_mock, 0x01);   // CLR PTR 
    update(R_mock, 0x2D);   // UPTR D
    update(R_mock, 0x1C);   // SHPTR 
    update(R_mock, 0x2E);   // UPTR E
    update(R_mock, 0x1C);   // SHPTR 
    update(R_mock, 0x2A);   // UPTR A
    update(R_mock, 0x1C);   // SHPTR 
    update(R_mock, 0x2D);   // UPTR D
    update(R_mock, 0x1F);   // SET IP
    
    printRegs(R_mock, 0);

    update(R_mock, 0x18);   // JMP
    update(R_mock, 0x01);   // CLR PTR 
    update(R_mock, 0x2B);   // UPTR B
    update(R_mock, 0x1C);   // SHPTR 
    update(R_mock, 0x2E);   // UPTR E
    update(R_mock, 0x1C);   // SHPTR 
    update(R_mock, 0x2E);   // UPTR E
    update(R_mock, 0x1C);   // SHPTR 
    update(R_mock, 0x2F);   // UPTR F

    printRegs(R_mock, 0);

    update(R_mock, 0x02);   // CLR VAL
    update(R_mock, 0x19);   // CMP
    update(R_mock, 0x18);   // JMP
    update(R_mock, 0x00);   // NOP
    update(R_mock, 0x00);   // NOP
    update(R_mock, 0x00);   // NOP
    update(R_mock, 0x00);   // NOP

    printRegs(R_mock, 0);
}


void test_Pointers(){
    printf("-----[ Test Base Add Deref Assign ]-----\n");
    uint_reg R_mock[16] = {0,0,0,0,0,0,0,0,0,0,0, 0,0,0,0,0};
    
    R_mock[SRAX_OFFSET] = 0x1;
    R_mock[SRDI_OFFSET] = 0x1;
    R_mock[SRSI_OFFSET] = (uint_reg)(R_mock + STK_OFFSET);
    R_mock[SRDX_OFFSET] = 0xC;

    printRegs(R_mock, 0);

    update(R_mock, 0x13);   // PTR = BASE_ADDR 
    update(R_mock, 0x02);   // CLR VAL
    update(R_mock, 0x31);   // UVAL [RAX_OFFSET_BYTES] 
    update(R_mock, 0x1D);   // SHVAL 
    update(R_mock, 0x0F);   // PTR += VAL
    update(R_mock, 0x11);   // *PTR = VAL
    
    printRegs(R_mock, 0);

    update(R_mock, 0x13);   // PTR = BASE_ADDR 
    update(R_mock, 0x02);   // CLR VAL
    update(R_mock, 0x31);   // UVAL [RDX_OFFSET_BYTES] 
    update(R_mock, 0x1D);   // SHVAL 
    update(R_mock, 0x3C);   // UVAL [RDX_OFFSET_BYTES] 
    update(R_mock, 0x0F);   // PTR += VAL
    update(R_mock, 0x12);   // VAL = *PTR
    update(R_mock, 0x10);   // SWAP 
    
    printRegs(R_mock, 0);
}

void test_PushPop(){
    printf("------[ Test Push Pop PrintRegs ]-------\n");
    uint_reg R_mock[16] = {9,9,0,0,0,0,0,0,0,0,0, 0,0,0,0,0};
    uint_reg *R_p = &(R_mock[2]);
    uint8_t step = 0x0;
    
    for (step=0; step < 8; step++){
        doUpdateReg(R_p, step);
        doSHLReg(R_p);
    }
    printf("Push R: 0x%X\n", *R_p);
    doPushReg( R_p );
    printRegs(R_p, 4);
    doPushReg( R_p );
    doPushReg( R_p );
    
    for (step=0xf; step >8 ; step--){
        doUpdateReg(R_p, step);
        doSHLReg(R_p);
    }
    printf("Push R: 0x%X\n", *R_p);
    doPushReg( R_p );
    printRegs(R_p, 6);
    doPopReg(R_p);
    printRegs(R_p, 6);
    doPopReg(R_p);
    printRegs(R_p, 6);
     
    for (step=0; step < 8; step ++){doSHLReg(R_p);}
    doPushReg(R_p);
    doPushReg(R_p);
    doPushReg(R_p);
    printRegs(R_p, 6);
    doPopReg(R_p);
    doPopReg(R_p);
    doPopReg(R_p);
    doPopReg(R_p);
    doPopReg(R_p);
    doPopReg(R_p);
    printRegs(R_p, 4);
}


int test_asmSyscall(){
    printf("------------[ Test syscall ]------------\n");
    int ret; 
    asm volatile(
        "mov  $0x0A646C72, %%eax\n"
        "push %%eax\n"
        "mov  $0x6F57206F, %%eax\n"
        "push %%eax\n"
        "mov  $0x6C6C6548, %%eax\n"
        "push %%eax\n"
        "mov $0x4, %%eax\n"
        "mov $0x1, %%ebx\n"
        "mov %%esp, %%ecx\n"
        "mov $0x0C, %%edx\n"
        "int $0x80\n"
        :"=a"(ret):: "ebx", "ecx", "edx");

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
    uint_reg i =1;

    printf("%d, %d\n", (5 & 4), SYS_write);
    printf("%08X\n",(i<<31));

    return 1;
}

int main(){
    test_printISA_short();
    test_ControlFlow();
    //1 test_printISA();
    //1 test_asmSyscall();
    //1 test_doSyscall_write();
    //1 test_changeRegs();
    //1 test_PushPop();
    //1 test_Pointers();
    // test_generic();
}
    

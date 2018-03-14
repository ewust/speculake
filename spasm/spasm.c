#include <stdbool.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "spasm.h"





Instruction* getInstruction(uint8_t instr) {
    Instruction *b = malloc(sizeof(Instruction)); 
    b->int8 = instr & 0x3F;
    uint8_t i;

    for (i=0; i<SP_INSTR_LENGTH; i++){
        if (instr & 1<<i) {
            b->bits[5-i] = 1;
            b->chars[5-i] = '1';
        } else {
            b->bits[5-i] = 0;
            b->chars[5-i] = '0';
        }
    }
    b->chars[6] = 0;

    return b;
}


void printInstr(Instruction *instr) {
    char *out = (char*)malloc(64*sizeof(char));
    uint8_t step = 0;

    switch(instr->int8 & 0x30){
        case 0x30:
            step = instr->int8 & 0x0F;
            sprintf(out, "Update VAL = 0x%01X", step);
            break; 

        case 0x20:
            step = instr->int8 & 0x0F;
            sprintf(out, "Update PTR = 0x%01X", step);
            break; 

        case 0x10:
            switch(instr->int8 & 0x0F){
                case 0x0F:
                    sprintf(out, "SET IP  ||  SRIP = PTR");
                    break;

                case 0x0E:
                    sprintf(out, "SYSCALL");
                    break;

                case 0x0D:
                    sprintf(out, "VAL = VAL<<4");
                    break;

                case 0x0C:
                    sprintf(out, "PTR = PTR<<4");
                    break;

                case 0x0B:
                    sprintf(out, "PUSH VAL");
                    break;

                case 0x0A:
                    sprintf(out, "POP VAL");
                    break;

                case 0x09:
                    sprintf(out, "CMP  ||  VAL = (VAL <= *PTR)? 1 : 0");
                    break;

                case 0x08:
                    sprintf(out, "JMP  ||  SRIP = (VAL==0)? PTR : SRIP+1");
                    break;

                case 0x06:
                    sprintf(out, "FREE\t(goto?)");
                    break;

                case 0x05:
                    sprintf(out, "FREE\t(load?)");
                    break;

                case 0x04:
                    sprintf(out, "FREE\t(store?)");
                    break;

                case 0x03:
                    sprintf(out, "PTR = BASE_ADDR");
                    break;

                case 0x02:
                    sprintf(out, "VAL = *PTR");
                    break;

                case 0x01:
                    sprintf(out, "*PTR = VAL");
                    break;

                case 0x00:
                    sprintf(out, "SWAP   PTR <-> VAL");
                    break;

                default:
                    sprintf(out, "FREE (DEFINE IF YOU NEED IT)");
                    break;

            } // END SWITCH 10
            break;

        case 0x00:
            switch(instr->int8 & 0x0F){

                case 0x0F:
                    sprintf(out, "PTR += VAL");
                    break;

                case 0x0E:
                    sprintf(out, "VAL = 2sCompl(Val)");
                    break;

                case 0x07:
                    sprintf(out, "CLR BOTH REPEAT");
                    break;

                case 0x06:
                    sprintf(out, "CLR VAL REPEAT");
                    break;

                case 0x05:
                    sprintf(out, "CLR PTR REPEAT");
                    break;

                case 0x04:
                    sprintf(out, "NOP REPEAT");
                    break;

                case 0x03:  
                    sprintf(out, "CLR BOTH");
                    break;

                case 0x02:
                    sprintf(out, "CLR VAL");
                    break;

                case 0x01:  
                    sprintf(out, "CLR PTR");
                    break;

                case 0x00:  
                    sprintf(out, "NOP");
                    break;
    
                default: 
                    sprintf(out, "FREE (DEFINE IF YOU NEED IT)");
                    break;
    
                    
            }// END Switch 00
    }// Update R switch 

    printf(" [%s] - %s\n", instr->chars, out);
    free(out);
}


void printISA_short(){
    int i=0;
    Instruction *b;
    uint8_t defined_instrs[] = {
        0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,0x0E,0x0F,
        0x10,0x11,0x12,0x13,
        0x18,0x19,0x1A,0x1B,0x1C,0x1D,0x1E,0x1F,
        0x20,0x30};
    
    for (i=0; i<24; i++) {
        printf("%02X  - ", defined_instrs[23-i]) ;
        b = getInstruction(defined_instrs[23-i]);
        printInstr(b);
    } 
}


void printISA() {
    Instruction *b; 
    int i;
    for (i=63; i >= 0; i--) {
        printf("%02X  - ", i);
        b = getInstruction(i);
        printInstr(b);
    }
    free(b);
}

void printRegs_64(uint64_t *R){
     printf("--[Registers]---\n");
     printf("SIP  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SIP_OFFSET), *(R+SIP_OFFSET) );
     printf("SSP  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SSP_OFFSET), *(R+SSP_OFFSET) );
     printf("PTR  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+PTR_OFFSET), *(R+PTR_OFFSET) );
     printf("VAL  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+VAL_OFFSET), *(R+VAL_OFFSET) );
     printf("SRAX --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SRAX_OFFSET), *(R+SRAX_OFFSET) );
     printf("SRBX --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SRBX_OFFSET), *(R+SRBX_OFFSET) );
     printf("SRCX --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SRCX_OFFSET), *(R+SRCX_OFFSET) );
     printf("SRDX --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SRDX_OFFSET), *(R+SRDX_OFFSET) );
     printf("SRSI --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SRSI_OFFSET), *(R+SRSI_OFFSET) );
     printf("SRDI --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SRDI_OFFSET), *(R+SRDI_OFFSET) );
     printf("SR8  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SR8_OFFSET), *(R+SR8_OFFSET) );
     printf("SR9  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+SR9_OFFSET), *(R+SR9_OFFSET) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET), *(R+STK_OFFSET) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET+1), *(R+STK_OFFSET+1) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET+2), *(R+STK_OFFSET+2) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET+3), *(R+STK_OFFSET+3) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET+4), *(R+STK_OFFSET+4) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET+5), *(R+STK_OFFSET+5) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET+6), *(R+STK_OFFSET+6) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET+7), *(R+STK_OFFSET+7) );
     printf("STK  --  ADDR:%016lX \t Value: %lX\n", (uint64_t)(R+STK_OFFSET+8), *(R+STK_OFFSET+8) );
     printf("------------\n\n");
}


// TODO: DETERMINE SRIP vs RIP
void doSetIP(uint64_t *R){
    // EITHER:
    //      jump real world execution to an address specified in R
    // or 
    //      set the SIP to do a jump in speculative world

    *(R+SIP_OFFSET) = *R;

    // goto *R
}

void doSyscall(uint64_t *R) {
    /* doSyscall -- Perorm a syscall using the x86-64 calling conventions from the linux 64 abi
     *      https://software.intel.com/sites/default/files/article/402129/mpx-linux64-abi.pdf
     *
     * Return: 
     *      Int -- result from syscall  */
    // Integer Value returned from Syscall 
    
    // Syscall
    asm volatile (
    // #ifdef ENV64 
        "syscall\n"
        : /* outputs*/ "=a"(*(R+SRAX_OFFSET))
        : /* inputs */ "a"(*(R+SRAX_OFFSET)), "D"(*(R+SRDI_OFFSET)), "S"(*(R+SRSI_OFFSET)), "d"(*(R+SRDX_OFFSET)), "c"(*(R+SRCX_OFFSET)), "g"(*(R+SR8_OFFSET)), "g"(*(R+SR9_OFFSET))
        : /*clobbers*/ "cc", "r11", "memory"
    // #else
    //     "int $0x80\n"
    //     : /* outputs*/ "=a"(ret)
    //     :  /* inputs */ "a"(*(R+SRAX_OFFSET)), "D"(*(R+SRDI_OFFSET)), "S"(*(R+SRSI_OFFSET)), "d"(*(R+SRDX_OFFSET)), "c"(*(R+SRCX_OFFSET)), "g"(*(R+SR8_OFFSET)), "g"(*(R+SR9_OFFSET))
    //     : "cc", "edi", "esi", "memory"
    // #endif
    ); 
} 

void doUpdateR(uint64_t *R, uint8_t step){
     *R &= ~0xf;
     *R |= step;
}

void doSHLR(uint64_t *R) {
    *R = *R << 4;
}

void doPushR(uint64_t *R){

    printf("Pushing Value:%lX \t @ 0x%016lX\n", *R, (uint64_t)(R + *(R+SSP_OFFSET)) );
    *(R + *(R+SSP_OFFSET)) = *R;
    *(R+SSP_OFFSET) +=1; 
}

void doPopR(uint64_t *R){
    if ( *(R+SSP_OFFSET) <=9 ){
        *R = 0x0;
        return;
    }
    printf("Popping Value:%lX \t from 0x%016lX\n", *(R + *(R+SSP_OFFSET)), (uint64_t)(R + *(R+SSP_OFFSET)) );
    *R = *(R + *(R+SSP_OFFSET));
    *(R+SSP_OFFSET) -=1; 
}

// TODO: Fill in NOP Options
void doNOPR(uint64_t *R, uint8_t opts){
    *(R+SIP_OFFSET) +=1;
}


void update(uint64_t* R, State *state, uint8_t instr_i){
    Instruction *instr = getInstruction(instr_i);
    uint8_t step = 0;

    switch(instr->int8 & 0x30){
        case 0x30:
            step = instr->int8 & 0x0F;
            // Update VAL
            break; 

        case 0x20:
            step = instr->int8 & 0x0F;
            // Update PTR
            break; 

        case 0x10:
            switch(instr->int8 & 0x0F){
                case 0x0F:
                    doSetIP(R);
                    break;

                case 0x0E:
                    // sprintf(out, "SYSCALL");
                    doSyscall(R);
                    break;

                case 0x0D:
                    // sprintf(out, "VAL = VAL<<4");
                    break;

                case 0x0C:
                    // sprintf(out, "PTR = PTR<<4");
                    break;

                case 0x0B:
                    //sprintf(out, "PUSH VAL");
                    break;

                case 0x0A:
                    //sprintf(out, "POP VAL");
                    break;

                case 0x09:
                    //sprintf(out, "CMP (VAL <= *PTR)");
                    break;

                case 0x08:
                    //sprintf(out, "JMP");
                    break;

                case 0x02:
                    //sprintf(out, "VAL = *PTR");
                    break;

                case 0x01:
                    //sprintf(out, "*PTR = VAL");
                    break;

                case 0x00:
                    //sprintf(out, "SWAP   PTR <-> VAL");
                    break;

                default:
                    // TODO: Handle this case
                    // SOMETHING WENT WRONG 
                    break;

            } // END SWITCH 10
            break;

        case 0x00:
            switch(instr->int8 & 0x0F){
                case 0x07:
                    //sprintf(out, "CLR BOTH REPEAT");
                    break;

                case 0x06:
                    //sprintf(out, "CLR VAL REPEAT");
                    break;

                case 0x05:
                    //sprintf(out, "CLR PTR REPEAT");
                    break;

                case 0x04:
                    //sprintf(out, "NOP REPEAT");
                    break;

                case 0x03:  
                    //sprintf(out, "CLR BOTH");
                    break;

                case 0x02:
                    //sprintf(out, "CLR VAL");
                    break;

                case 0x01:  
                    //sprintf(out, "CLR PTR");
                    break;

                case 0x00:  
                    //sprintf(out, "NOP");
                    break;
    
                default: 
                    //sprintf(out, "FREE (DEFINE IF YOU NEED IT)");
                    break;
    
                    
            }// END Switch 00
    }// Update R switch 
}
/*
    Instruction *instr = getInstruction(instr_i);
    printInstr(instr);
    
    uint8_t step = 0;

    switch(instr->int8 & 0x10){
        case 0x10:
            step = instr->int8 & 0x0F;
            break; 

        case 0x00:
            switch(instr->int8 & 0x0F){
                case 0x0: break;
                case 0x01:
                    break;

                case 0x02:
                    // doChangeDerefR(R, false);
                    break;
                
                case 0x03:
                    // doChangeDerefR(R, true);
                    break;
                
                case 0x04:
                    doSyscall(R);
                    break;
                
                case 0x05:
                    doSHLR(R);
                    break;
                    
                case 0x06:
                    doPushR(R);
                    break;
                    
                case 0x07:
                    doPopR(R);
                    break;
                    
                default:
                    step = instr->int8 & 0x07;
                    doNOPR(R, step);
                    break;
            }// Instr Switch 
    }// Update R switch 
}*/

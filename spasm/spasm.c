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

void initState(State *state){
    state->regs[SRIP_OFFSET] = 0;
    state->regs[SRSP_OFFSET] = STK_OFFSET;
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
            sprintf(out, "FREE (DEFINE IF YOU NEED IT)");
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

                case 0x0B:
                    sprintf(out, "PUSH VAL");
                    break;

                case 0x0A:
                    sprintf(out, "POP VAL");
                    break;

                case 0x09:
                    sprintf(out, "CMP  ||  VAL = (VAL <= PTR)? 1 : 0");
                    break;

                case 0x08:
                    sprintf(out, "JMP  ||  SRIP = (VAL==0)? PTR : SRIP+1");
                    break;

                case 0x07:
                    sprintf(out, "CALL ||  PUSH SRIP+1; SRIP=PTR;");
                    break;

                case 0x06:
                    sprintf(out, "FREE (DEFINE IF YOU NEED IT) (goto?)");
                    break;

                case 0x05:
                    sprintf(out, "FREE (DEFINE IF YOU NEED IT) (load?)");
                    break;

                case 0x04:
                    sprintf(out, "FREE (DEFINE IF YOU NEED IT) (store?)");
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

                case 0x0D:
                    sprintf(out, "VAL *= %d (reg_size)", BYTES_PER_REG);
                    break;

                case 0x0C:
                    sprintf(out, "PTR *= VAL");
                    break;

                case 0x0B:
                    sprintf(out, "PTR /= VAL");
                    break;

                case 0x0A:
                    sprintf(out, "PTR << VAL");
                    break;

                case 0x09:
                    sprintf(out, "PTR &= VAL");
                    break;

                case 0x08:
                    sprintf(out, "VAL = NOT VAL");
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
    int total_instrs = 29;
    Instruction *b;
    uint8_t defined_instrs[] = {
        0x00,0x01,0x02,0x03,0x04,0x05,0x06,0x07,
        0x08,0x09,0x0A,0x0B,0x0C,0x0D,0x0E,0x0F,
        0x10,0x11,0x12,0x13,
        0x17,0x18,0x19,0x1A,0x1B,0x1D,0x1E,0x1F,
        0x30};
    
    printf("SP-ASM ISA v%s -- %s\n", SPASM_VERSION, SPASM_JIT_SUPPORT);
    printf("----------------------------------------\n");
    for (i=0; i<total_instrs; i++) {
        printf("%02X  - ", defined_instrs[(total_instrs-1)-i]) ;
        b = getInstruction(defined_instrs[(total_instrs-1)-i]);
        printInstr(b);
    } 
    printf("----------------------------------------\n");
    printf("Free instructions: %d\n", 64-15-total_instrs);
    printf("----------------------------------------\n");
}


void printISA() {
    Instruction *b; 
    int i;
    printf("SP-ASM ISA v%s -- %s\n", SPASM_VERSION, SPASM_JIT_SUPPORT);
    printf("----------------------------------------\n");
    for (i=63; i >= 0; i--) {
        printf("%02X  - ", i);
        b = getInstruction(i);
        printInstr(b);
    }
    printf("----------------------------------------\n");
    free(b);
}

void printReg(uint_reg *reg, char *name) {
    #if defined(ENV64) 
    printf("%s --  ADDR:%016lX \t Value: %lX\n", name, (uint_reg)(reg), *(reg));
    #elif defined(ENV32)
    printf("%s --  ADDR:%08X \t Value: %X\n", name, (uint_reg)(reg), *(reg));
    #else 
    printf("[64/32] something went wrong\n");
    #endif
}


void printRegs(uint_reg *R, int stk_items) {
    uint32_t i;
    printf("--[Registers]---\n");
    printReg((R+SRIP_OFFSET), "SRIP");
    printReg((R+SRSP_OFFSET), "SRSP");
    printReg((R+PTR_OFFSET),  "PTR ");
    printReg((R+VAL_OFFSET),  "VAL ");
    printReg((R+SRAX_OFFSET), "SRAX");
    printReg((R+SRBX_OFFSET), "SRBX");
    printReg((R+SRCX_OFFSET), "SRCX");
    printReg((R+SRDX_OFFSET), "SRDX");
    printReg((R+SRSI_OFFSET), "SRSI");
    printReg((R+SRDI_OFFSET), "SRDI");
    printReg((R+SRBP_OFFSET), "SRBP");
    printReg((R+SR8_OFFSET),  "SR8 ");
    printReg((R+SR9_OFFSET),  "SR9 ");
    for (i=0; i< stk_items; i++){
        printReg((R+STK_OFFSET+i), "STK ");
    }
    printf("------------\n\n");
}

void doSetIP(uint_reg *R, uint_reg *src){
    // set the SRIP to do a jump in speculative world
    *(R+SRIP_OFFSET) = *src;
}

void doSyscall(uint_reg *R) {
    /* doSyscall -- Perorm a syscall using the x86-64 calling conventions from the linux 64 abi
     *      https://software.intel.com/sites/default/files/article/402129/mpx-linux64-abi.pdf
     *
     * Return: 
     *      Int -- result from syscall  */
    // Integer Value returned from Syscall 
    
    // Syscall
    asm volatile (
    #if defined(ENV64)
        "syscall\n"
        : /* outputs*/ "=a"(*(R+SRAX_OFFSET))
        : /* inputs */ "a"(*(R+SRAX_OFFSET)), "D"(*(R+SRDI_OFFSET)), "S"(*(R+SRSI_OFFSET)), "d"(*(R+SRDX_OFFSET)), "c"(*(R+SRCX_OFFSET)), "g"(*(R+SR8_OFFSET)), "g"(*(R+SR9_OFFSET))
        : /*clobbers*/ "cc", "r11", "memory"
    #elif defined(ENV32)
        "int $0x80\n"
        : /* outputs*/ "=a"(*(R+SRAX_OFFSET))
        :  /* inputs */ "a"(*(R+SRAX_OFFSET)),  "b"(*(R+SRBX_OFFSET)),  "c"(*(R+SRCX_OFFSET)), "d"(*(R+SRDX_OFFSET)), "D"(*(R+SRDI_OFFSET)) , "bp"(*(R+SRBP_OFFSET))
        : "cc", "memory"
    #else
    printf("[64/32] something went wrong\n");
    #endif
    ); 
} 

void doUpdateReg(uint_reg *R, uint8_t step){
     *R &= ~0xF;
     *R |= step & 0xF;
}

void doSHLReg(uint_reg *R) {
    *R = *R << 4;
}

void doPushReg(uint_reg *R){
    uint_reg * val_p  = R+VAL_OFFSET;
    uint_reg * stk_p = R+(int)*(R+SRSP_OFFSET);
    // printf("Push: ADDR %016lX - VAL %lX\n", (uint_reg)stk_p, *(val_p));
    *(stk_p) = *(val_p);
    *(R+SRSP_OFFSET) +=1; 
}

void doPopReg(uint_reg *R){
    *(R+SRSP_OFFSET) -=1; 
    uint_reg * srsp_p = R+SRSP_OFFSET;
    uint_reg * val_p = R+VAL_OFFSET;
    uint_reg * stk_p = R+(int)*(R+SRSP_OFFSET);
    // printf("Pop: ADDR %016lX - VAL %lX\n", (uint_reg)stk_p, *(stk_p));
    if ( *(srsp_p) < STK_OFFSET){
        // Stack is Empty
        // printf("Stack is empty\n");
        *(val_p) = 0x0;
        return;
    }
    *(val_p) = *(stk_p);
}

void doClrReg(uint_reg *R){
    *R = 0x0;
}

void doGetBase(uint_reg *R){
    *(R+PTR_OFFSET) = (uint_reg)R;
}

void doSwap(uint_reg *R) {
    uint_reg tmp;

    tmp = *(R+VAL_OFFSET);
    *(R+VAL_OFFSET) = *(R+PTR_OFFSET);
    *(R+PTR_OFFSET) = tmp;
}

void doCompare(uint_reg *R) {
    // CMP  ||  VAL = (VAL <= PTR)? 1 : 0
    if ( *(R+VAL_OFFSET) <= *(R+PTR_OFFSET) ){
        *(R+VAL_OFFSET) = 0x1;
    }
    else {
        *(R+VAL_OFFSET) = 0x0;
    }
}


void doCall(uint_reg *R){
    uint_reg * srip_p  = R+SRIP_OFFSET;
    uint_reg * stk_p = R+(int)*(R+SRSP_OFFSET);
    // printf("CALL: RIP_ADDR %016lX - VAL %lX\n", (uint_reg)srip_p, *(val_p));

    // Push SRIP+1
    *(stk_p) = *(srip_p)+1;
    *(R+SRSP_OFFSET) +=1; 

    // JMP PTR
    doSetIP(R, R+PTR_OFFSET); 
    return;
}

void update(uint_reg* R, uint8_t instr_i){
    Instruction *instr = getInstruction(instr_i);
    uint8_t step = 0;

    switch(instr->int8 & 0x30){
        case 0x30:  // Update VAL
            step = instr->int8 & 0x0F;
            doUpdateReg((R+VAL_OFFSET), step);
            break; 

        case 0x20:  //  FREE (DEFINE IF YOU NEED IT)
            break; 

        case 0x10:
            switch(instr->int8 & 0x0F){
                case 0x0F:
                    doSetIP(R, R+PTR_OFFSET);
                    return;

                case 0x0E:    // sprintf(out, "SYSCALL");
                    doSyscall(R);
                    break;

                case 0x0D:    // sprintf(out, "VAL = VAL<<4");
                    doSHLReg(R+VAL_OFFSET);
                    break;

                case 0x0B:    //sprintf(out, "PUSH VAL");
                    doPushReg(R);
                    break;

                case 0x0A:    //sprintf(out, "POP VAL");
                    doPopReg(R);
                    break;

                case 0x09:    // CMP  ||  VAL = (VAL <= PTR)? 1 : 0
                    doCompare(R);
                    break;

                case 0x08:    // JMP  ||  SRIP = (VAL==0)? PTR : SRIP+1
                    if ( *(R+VAL_OFFSET) == 0 ) {
                        doSetIP(R, R+PTR_OFFSET); 
                        return;
                    }
                    break;

                case 0x07:    // CALL 
                    doCall(R); 
                    return;

                case 0x03:   // PTR = BASE ADDR 
                    doGetBase(R); 
                    break;

                case 0x02:    //sprintf(out, "VAL = *PTR");
                    *(R+VAL_OFFSET) = *((uint_reg *)*(R+PTR_OFFSET));
                    break;

                case 0x01:    //sprintf(out, "*PTR = VAL");
                    *((uint_reg *)*(R+PTR_OFFSET)) = *(R+VAL_OFFSET);
                    break;

                case 0x00:    //sprintf(out, "SWAP   PTR <-> VAL");
                    doSwap(R);
                    break;

                default:
                    // TODO: Handle this case
                    printf("[ERROR] UPDATE - undefined Instruction\n");
                    break;

            } // END SWITCH 10
            break;

        case 0x00:
            switch(instr->int8 & 0x0F){
                case 0x0F:   // PTR = PTR + VAL
                    *(R+PTR_OFFSET) = *(R+PTR_OFFSET) + *(R+VAL_OFFSET);
                    break;

                case 0x0E:   // VAL = 2comp(VAL) 
                    *(R+VAL_OFFSET) = 1 + ~(*(R+VAL_OFFSET));
                    break;

                case 0x0D:   // VAL *= BYTES_PER_REG 
                    *(R+VAL_OFFSET) *= BYTES_PER_REG;
                    break;

                case 0x0C:   // PTR *= VAL
                    *(R+PTR_OFFSET) *= *(R+VAL_OFFSET);
                    break;

                case 0x0B:   // PTR /= VAL
                    *(R+PTR_OFFSET) /= *(R+VAL_OFFSET);
                    break;

                case 0x0A:   // PTR << VAL
                    *(R+PTR_OFFSET) = *(R+PTR_OFFSET) << *(R+VAL_OFFSET);
                    break;

                case 0x09:   // PTR &= VAL
                    *(R+PTR_OFFSET) &= *(R+VAL_OFFSET);
                    break;

                case 0x08:   // VAL = NOT VAL
                    *(R+VAL_OFFSET) = ~BYTES_PER_REG;
                    break;

                case 0x07:   //sprintf(out, "CLR BOTH REPEAT");
                    doClrReg(R+PTR_OFFSET);
                    doClrReg(R+VAL_OFFSET);
                    return;

                case 0x06:   //sprintf(out, "CLR VAL REPEAT"); 
                    doClrReg(R+VAL_OFFSET);
                    return;

                case 0x05:   //sprintf(out, "CLR PTR REPEAT"); 
                    doClrReg(R+PTR_OFFSET);
                    return;

                case 0x04:
                    //sprintf(out, "NOP REPEAT");
                    return;

                case 0x03:    //sprintf(out, "CLR BOTH");
                    doClrReg(R+PTR_OFFSET);
                    doClrReg(R+VAL_OFFSET);
                    break;

                case 0x02:    //sprintf(out, "CLR VAL");
                    doClrReg(R+VAL_OFFSET);
                    break;

                case 0x01:    //sprintf(out, "CLR PTR");
                    doClrReg(R+PTR_OFFSET);
                    break;

                case 0x00:  
                    //sprintf(out, "NOP");
                    break;
    
                default: 
                    //sprintf(out, "FREE (DEFINE IF YOU NEED IT)");
                    break;
            }// END Switch 00
    }// Update Reg Switch 
                    
    *(R+SRIP_OFFSET) += 1;
}


/*void run(uint_reg *R, uint8_t * Instructions){

    // TODO: Check Instruction bounds
    update(R, Instructions[*(R+SRIP_OFFSET)])
}
*/

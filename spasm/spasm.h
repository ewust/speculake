
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

#include "registers.h"

#ifndef SP_VM_H
#define SP_VM_H

#define SP_INSTR_LENGTH  6
#define SP_STATE_REGS  32
#define SP_STATE_INSTRS  256

#define SPASM_VERSION "1.0.1"

#define DEBUG true

typedef struct __attribute__((__packed__)) {
    uint8_t instr[SP_STATE_INSTRS];
    uint_reg regs[SP_STATE_REGS];  // see registers.h
    uint_reg stack[32]; 
} State;


//Instruction structure.
typedef struct {
    bool bits[SP_INSTR_LENGTH];
    char chars[SP_INSTR_LENGTH+1];
    uint8_t int8;
} Instruction; 


// State* State_new(size_t instructions, size_t stack);

Instruction* getInstruction(uint8_t instr);

void initState(State *state);

void printInstr(Instruction *instr);

void printISA();
void printISA_short();

void update(uint_reg *R, uint8_t);

#if DEBUG
void doSyscall(uint_reg *R);
void doUpdateReg(uint_reg *R, uint8_t step);
void doSHLReg(uint_reg *R);
void doSetIP(uint_reg *R, uint_reg *src);
void doPopReg(uint_reg *R);
void doPushReg(uint_reg *R);
void doNOPR(uint_reg *R, uint8_t opts);
void doClrReg(uint_reg *R);
void doSwap(uint_reg *R);

void printReg(uint_reg *reg, char *name);
void printRegs(uint_reg *R, int stk_items);
#endif // DEBUG

#endif


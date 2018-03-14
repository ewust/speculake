
#include <stdint.h>
#include <stdbool.h>
#include <stddef.h>

#ifndef SP_VM_H
#define SP_VM_H

#define SP_INSTR_LENGTH  6
#define SP_STATE_REGS  32
#define SP_STATE_INSTRS  256

#define PTR_OFFSET (uint64_t)0x00
#define VAL_OFFSET (uint64_t)0x01
#define SRAX_OFFSET (uint64_t)0x02
#define SRBX_OFFSET (uint64_t)0x03
#define SRCX_OFFSET (uint64_t)0x04
#define SRDX_OFFSET (uint64_t)0x05
#define SRSI_OFFSET (uint64_t)0x06
#define SRDI_OFFSET (uint64_t)0x07
#define SR8_OFFSET  (uint64_t)0x08
#define SR9_OFFSET  (uint64_t)0x09

#define SIP_OFFSET  (uint64_t)0x02 * -1
#define SSP_OFFSET  (uint64_t)0x01 * -1
#define STK_OFFSET (uint64_t)0x0A


#define SPASM_VERSION "1.0.1"

#define DEBUG true

typedef struct __attribute__((__packed__)) {
    uint8_t instr[SP_STATE_INSTRS];
    int64_t regs[SP_STATE_REGS];       // [ip, r, sp, eax, ebx, ecx, edx, ... ]
    int64_t stack[32]; 
} State;


//Instruction structure.
typedef struct {
    bool bits[SP_INSTR_LENGTH];
    char chars[SP_INSTR_LENGTH+1];
    uint8_t int8;
} Instruction; 


// State* State_new(size_t instructions, size_t stack);

Instruction* getInstruction(uint8_t instr);

void printInstr(Instruction *instr);

void printISA();
void printISA_short();

void update(uint64_t *R, State *state, uint8_t);

#if DEBUG
void doSyscall(uint64_t *R);
void doUpdateR(uint64_t *R, uint8_t step);
void doSHLR(uint64_t *R);
void doSetIP(uint64_t *R);
void doChangeDerefR(uint64_t *R, bool bit);
void doPopR(uint64_t *R);
void doPushR(uint64_t *R);
void doNOPR(uint64_t *R, uint8_t opts);

void printRegs_64(uint64_t *R);
#endif // DEBUG

#endif


/*  STATE STRUCT LAYOUT (x86-64)

    ______________
    |            | 
    |    Text    | 
   ...          ... 
    |____________| 
-40 | SIP || SSP | 
0   |     R      | 
40  |    SRAX    |   // Syscall OP 
80  |    SRBX    | 
C0  |    SRCX    |   // Syscall arg 4
100 |    SRDX    |   // Syscall arg 3
140 |    SRSI    |   // Syscall arg 2 
1C0 |    SRDI    |   // Syscall arg 1 
200 |    SR8     |   // Syscall arg 5 
240 |    SR9     |   // Syscall arg 6
    |------------| 
280 |  | Stack | | 
    |  v       v | 
    |____________| 

*/

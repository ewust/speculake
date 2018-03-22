
#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

#include "spasm.h"


State state; 

uint_reg *R;


void run(int num_instr) {
    uint_reg rip = *(R+SRIP_OFFSET);

    Instruction *instr;

    while (true) {
        rip = *(R+SRIP_OFFSET);
        // printf("RIP - %lX, I - 0x%02X - ", rip, state.instr[ rip ]);
        instr = getInstruction(state.instr[rip]);
        // printInstr(instr);

        // if (( state.instr[ rip ] == 0x1A ) || ( state.instr[ rip ] == 0x1B ))  {
        //      printReg((R+VAL_OFFSET),  "VAL ");
        //     printReg((R+SRAX_OFFSET), "SRAX");
        // }
        // if ( state.instr[ rip ] == 0x1E ) {
        //       printRegs(R, 3);
        // }
        update(R, state.instr[ rip ]);
        if (rip > 102) break;
    }
}

int setup(char *fname){
    uint8_t instr;
    FILE *finstr = fopen(fname, "r");
    int i =0; 

    // Parse spasm instructions out of file into state text section
    while (fread(&instr, 1, 1, finstr) == 1) {
        // printInstr(getInstruction((uint8_t)instr));
        state.instr[i] = (uint8_t)instr;
        i++;
    }

    initState(&state);
    R = state.regs;
    return i;
}


int main(){
    // printISA();
    int x =0; 
    char *fname = "./examples/hello.sp";
    
    x = setup(fname);
    run(x);
}

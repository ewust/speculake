
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>

#include "spasm.h"


State state; 

uint_reg *R;


void run(int num_instr) {
    uint_reg rip = *(R+SRIP_OFFSET);

    Instruction *instr;

    while (true) {
        rip = *(R+SRIP_OFFSET);

        // if (( state.instr[ rip ] == 0x1A )  || ( state.instr[ rip ] == 0x1B ) || ( state.instr[ rip ] == 0x11 ) || ( state.instr[ rip ] == 0x13 ))  {
        //    printRegs(R, 3);
        // }
        // printReg((R+SRIP_OFFSET),  "SRIP ");
        // printReg((R+VAL_OFFSET),   "VAL  "); 
        // printReg((R+PTR_OFFSET),   "PTR  "); 
        // // printReg((R+SRAX_OFFSET), "SRAX");
        // if ( state.instr[ rip ] == 0x1E ) {
        //     printRegs(R, 3);
        // }
        // if ( state.instr[ rip ] == 0x00 ) {
        //     break;
        // }

        // instr = getInstruction(state.instr[rip]);
        // printInstr(instr);
        update(R, state.instr[ rip ]);
        // usleep(250000);
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


int main(int argc, char *argv[] ){
    // printISA();
    int x =0; 
    // char *fname = "./examples/hello.sp";
    char *fname;

    if (argc < 2){
        printf("No SPASM file specified\n\t> ./process <spasm.sp>\n\n");
        exit(1);
    }
    fname = argv[1];
    
    x = setup(fname);
    run(x);
}


#include <stdint.h>
#include <stdio.h>
#include <stdbool.h>

#include "spasm.h"


State state; 

uint64_t *R;


void run() {
    uint8_t instr;

    FILE *finstr = fopen("./hello.sp", "r");
    while (fread(&instr, 1, 1, finstr) == 1) {
        printf("%02X - ", (uint8_t)instr); 
        printInstr(getInstruction((uint8_t)instr));
    }
}


int setup(char *fname){
    uint8_t instr;
    FILE *finstr = fopen(fname, "r");
    int i =0; 

    // Parse spasm instructions out of file into state text section
    while (fread(&instr, 1, 1, finstr) == 1) {
        printInstr(getInstruction((uint8_t)instr));
        state.instr[i] = (uint8_t)instr;
        i++;
    }

    R = state.regs;
    printf("0x%016lX\n", (uint64_t)R);

    for (i=0; i<168; i++){
        printf("%02X\n", state.instr[i]); 
    }
}


int main(){
    // printISA();
    
    char *fname = "./hello.sp";
    
    setup(fname);
    // run();
}

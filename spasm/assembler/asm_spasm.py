#!/usr/bin/env python3

import re
import sys
from instr_spasm import *
from parser_spasm import *

    
        
class Assembler():
    """ SPASM Assembler - Add functionality for macros that 
            improve usability of language overall. See README 
            for information on MACRO vs Instr and optimal 
            programming techniques."""
    
    label_pattern = re.compile("^[.]*[a-zA-Z0-9]*\w*:")
    
    def __init__(self, fname, fname_o=None):
        self.fname_i = fname 
        self.instrs = []
        if fname_o == None: 
            self.fname_o = ''.join([fname.split(".")[0], ".sp"])
        else:
            self.fname_o = fname_o
            
       
    def assemble(self):
        self.labels = self.get_labels()

        parser = Parser(self.labels)
        self.get_instrs(parser)
        self.fill_labels()
        self.write_bin()


    def get_labels(self):
        # Parse out all lables and function name using regex 
        #       see README for format and convention
        labels = {}
        for i, line in enumerate(open(self.fname_i)):
    
            match = re.search(self.label_pattern, line)
            if match != None:
                func = True 
                label = match.group().strip(":")
                # print('Found on line {0}: {1}'.format(i+1,label) )
    
                if label[0] == ".": 
                    func = False 
    
                labels[match.group().strip(":")] = {}
                labels[match.group().strip(":")]["is_func"] = func
                labels[match.group().strip(":")]["line_num"] = i+1
                labels[match.group().strip(":")]["index"] = 0

        return labels

            

    def insert_instrs(self, index, new_instrs):
        try: 
            if index > len(self.instrs):
                raise AssemblerInsertError("Instruction index out of range", new_instrs[0], index)
            self.instrs[index:index] = new_instrs
            return 1
        except AssembleError() as asm_e:
            asm_e.print_summary()
            sys.exit()
    

    def fill_labels(self):
        for instr in self.instrs:
            if instr.use_label == True:
                # Fill label address from labels using label index etc.
                label_index_str = format(self.labels[instr.label_str]["index"], 'x')
                if instr.label_index >= len(label_index_str):
                    instr.immed = 0
                else:
                    instr.immed = int(label_index_str[len(label_index_str)-1-instr.label_index], 16)


    def get_instrs(self, parser):
        # Purpose   
        #   Fill the self.instrs while reading from input file.
        # Note
        #   Lines that contain no instructions wont affect index or self.instrs
        index = 0
        for i, line in enumerate(open(self.fname_i, "r")): 
            n, new_instrs, new_label = parser.parse(line)
            
            # update labels to have the instruction index of their location 
            if new_label != None: 
                self.labels[new_label]["index"] = index
                print("Label: {0} \t Index: {1} \t Details: {2}".format(new_label, index, self.labels[new_label]))

            # Add the new instructions to the list at the correect index
            self.insert_instrs(index, new_instrs)
            index += n
        

    # Write the Full SPASM executable to output file
    def write_bin(self):
        print("Output File: {}".format(self.fname_o))
        out = []
        for i, instr in enumerate(self.instrs):
            print("{0:08X} - {1:02X} - {2}".format(i, ord(instr.get_opcode()), instr))
            out.append(instr.get_opcode())

        with open(self.fname_o, "w") as fout:
            fout.write("".join(out))


    # Write the Full SPASM executable to output file
    #   ONLY USE 6 BITS FOR EACH INSTR
    def write_bin_compact(self):
        print("Output File: {}".format(self.fname_o))
        print("TODO") 


class AssemblerParseError(Exception):
    def __init__(self, message, instruction, index, line_num):
        super().__init__(message)
        self.instruction = instruction  
        self.index = index 
        self.line_num = line_num

    def print_summary(self):
        print("MEOWMEOW") # TODO
        

class AssemblerInsertError(Exception):
    def __init__(self, message, instruction, index):
        super().__init__(message)

        self.instruction = instruction  
        self.index = index 
        self.line_num = line_num

    def print_summary(self):
        print("MEOWMEOW") # TODO
        




def main(argv):

    fname_i = argv[1]
    if len(argv) >= 3:
        fname_o = argv[2]
        asm = Assembler(fname_i, fname_o)
    else:
        asm = Assembler(fname_i)

    
    # labels = asm.get_labels()
    asm.assemble()
    

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("No in-file Specified")
    else:
        main(sys.argv)

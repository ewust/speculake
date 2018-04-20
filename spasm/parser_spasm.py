
from instr_spasm import *

class Parser:

    MACROS = ["EUVAL", "SET", "GET", "CALL", "J", 
            "CMPJE", "CMPJNE", "CMPJZ", "CMPJNZ", 
            "CMPJL", "CMPJLE", "CMPJG", "CMPJGE"]

    
    def __init__(self, labels):
        self.labels = labels


    def parse(self, line):
        # Return
        #    n              Number of instructions to be added 
        #    instrs         Array of Instr - instructions to be executed in order
        #    Label(s) (opt) If the instruction has any labels associated with it return here

        label = None
        instrs = []
        n = 0

        # Split off any comments 
        line_sep = line.split("#", 1)[0]

        # If the line is empty ignore it
        if line_sep.isspace():
            return (n, instrs, label)
        
        # Separate opstring from arguments
        line_split = line_sep.split()
    
        if self.has_label(line_split):
            label = line_split[0].strip(":")
            
            # Only a label on this line return it for assembler to index
            if len(line_split) == 1:
                return (n, instrs, label)

            else: 
                line_split = line_split [1:]
         
        if self.is_macro(line_split):
            # Generate the series of instructions composing the macro    
            n, instrs = self.expand_macro(line_split)

        else:
            # generate the one instruction and return it
            instr = Instr(line_split)
            instrs.append(instr)
            n = 1

        # Return the number of instructions added by expand_macro
        return (n, instrs, label)


    def has_label(self, instr):
        # Purpose 
        #   if the opstring is a label report it
        # Return 
        #   result          True / False whether the line has a label in the first index

        if instr[0].strip(":") in self.labels:
            return True
        else: 
            return False


    #===========[ Functions to handle Macros ]=============

    def is_macro(self, instr):
        # Purpose 
        #   If the opstring is a MACRO handle it 
        # Return 
        #   result          True / False whether the line has a macro 

        if instr[0].upper() in self.MACROS:
            return True
        else:
             return False
        

    def expand_macro(self, line):
        # Purpose      
        #    Translate Macro into array of Instr each encoding one SPASM instruction 
        #
        # Return 
        #   instrs          Array of Instr - 

        n = 0
        expanded_instrs = []
        # J JZ / JNZ / JL / JLE / JG / JGE / JE / JNE  [label / address / register]
        # if instr[0] == "J":
        # elif instr[0] == "JZ":
        # elif instr[0] == "JNZ":
        # elif instr[0] == "JL":
        # elif instr[0] == "JLE":
        # elif instr[0] == "JG":
        # elif instr[0] == "JGE":
        # elif instr[0] == "JE":
        # elif instr[0] == "JNE":  
        # elif instr[0] == "EUVAL": # EUVAL [label / value] 
        # elif instr[0] == "CALL":  # CALL  [label / address / register] 
        # elif instr[0] == "SET":   # SET REG       REG = VAR 
        # elif instr[0] == "GET":   # GET REG       VAR = REG 
        # else:
        #     #TODO
        #     print("HOW DID YOU GET HERE?") 
    
        return (n, expanded_instrs)


class ParseError(Exception):
    def __init__(self, message, line):
        super().__init__(message)
    
        self.line = line

    def print_summary(self):
        print(self.line)

class ParseMacroError(ParseError):

    def __init__(self, message, line):
        super().__init__(message, line)
    
    def print_summary(self):
        print("Error with Macro Parseing - Macro does not exist")
        super().print_summary()





from instr_spasm import *

MACROS = ["EUVAL", "ESET", "EGET", "ECALL", "EPUSH"]
        # TODO: "CMPJE", "CMPJNE", "CMPJZ", "CMPJNZ", "CMPJL", "CMPJLE", "CMPJG", "CMPJGE"]

REGISTERS = {"SRIP":0, "SRSP":1, "SRAX":4, "SRBX":5, "SRCX":6, "SRDX":7,
             "SRSI":8, "SRDI":9, "SRBP":10, "SR8":11, "SR9":12}
MAX_ADDR_LEN = 10

class Parser:
    
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
        

    def expand_macro(self, instr):
        # Purpose      
        #    Translate Macro into array of Instr each encoding one SPASM instruction 
        #
        # Return 
        #   instrs          Array of Instr - 

        n = 0
        expanded_instrs = []
        op = instr[0].upper()

        if   op == "EUVAL": # EUVAL [label / value] 
            n, expanded_instrs = self.expand_EUVAL(
        elif op == "ECALL":  # CALL  [label / address / register] 
            n, expanded_instrs = self.expand_ECALL(
        elif op == "EPUSH":  # PUSH  [ str / hex / reg ]
            n, expanded_instrs = self.expand_EPUSH(
        elif op == "ESET":   # SET REG       REG = VAR 
            n, expanded_instrs = self.expand_ESET(
        elif op == "EGET":   # GET REG       VAR = REG 
            n, expanded_instrs = self.expand_EGET(
        else:
            raise ParseMacroError("Attempting to exapand undefined Macro", instr)
    
        return (n, expanded_instrs)

    def expand_EPUSH(self, instr):
        test = '  EPUSH "This is a test" #'                            
        stage_1 = test.split("#")[0] 
        stage_2 = stage_1.split('"') 
        # ['  EPUSH ', 'This is a test', ' ']                                
        op = stage_2[0].split()      
        # ['EPUSH']                        
        op.append(stage_2[1])                                                                                                              
        # ['EPUSH', 'This is a test']      
        ''.join([format(ord(c), 'x') for c in stage_2[1]])                                                                                 
        # '5468697320697320612074657374'

    def expand_EUVAL(self, instr):
        expanded_instrs = []

        instr = Instr(["CLR"])
        expanded_instrs.append(instr)

        if instr[1] in self.labels: 
            # USING A LABEL
            for i in range(MAX_ADDR_LEN):
                instr = Instr()
                instr.use_label = True
                instr.label_str = instr[1]
                instr.label_index = MAX_ADDR_LEN-1 - i
                expanded_instrs.append(instr)
                instr = Instr(["SHVAL"])

        else:
            # USING A HEX VALUE
            try:
                immed = format(int(instr[1], 16), 'x')
            except ValueError as e:
                raise ParseMacroError("EUVAL parse error - not label or hex value", instr)
                return (0, [])

            for i in range(len(immed)):
                instr = Instr(["UVAL", )
                instr.use_immed = True
                instr.immed = immed[len(immed)-1 - i ]
                expanded_instrs.append(instr)
                instr = Instr(["SHVAL"])
                expanded_instrs.append(instr)
        
        return(len(expanded_instrs), expanded_instrs)
                

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




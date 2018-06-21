
import shlex
from instr_spasm import *

MACROS = ["EUVAL", "ESET", "EGET", "ECALL", "EPUSH"]
        # TODO: "CMPJE", "CMPJNE", "CMPJZ", "CMPJNZ", "CMPJL", "CMPJLE", "CMPJG", "CMPJGE"]

REGISTERS = {"SRIP":0, "SRSP":1, "SRAX":4, "SRBX":5, "SRCX":6, "SRDX":7,
             "RIP":0, "RSP":1, "RAX":4, "RBX":5, "RCX":6, "RDX":7,
             "SRSI":8, "SRDI":9, "SRBP":10, "SR8":11, "SR9":12,
             "RSI":8, "RDI":9, "RBP":10, "R8":11, "R9":12}


# 8 Half words gives 32 bits for addressing - should be plenty
MAX_ADDR_LEN = 8

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
        line_split = shlex.split(line_sep)
    
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
        if instr[0].upper() in MACROS:
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
            n, expanded_instrs = self.expand_EUVAL(instr)
        elif op == "ECALL":  # CALL  [label / address / register] 
            n, expanded_instrs = self.expand_ECALL(instr)
        elif op == "EPUSH":  # PUSH  [ str / hex / reg ]
            n, expanded_instrs = self.expand_EPUSH(instr)
        elif op == "ESET":   # SET [reg] [reg / hex] 
            n, expanded_instrs = self.expand_ESET(instr)
        elif op == "EGET":   # GET [reg] 
            n, expanded_instrs = self.expand_EGET(instr)
        else:
            raise ParseMacroError("Attempting to expand undefined Macro", instr)
    
        return (n, expanded_instrs)


    def expand_EPUSH(self, instr):
        if len(instr) < 2:
            raise ParseMacroError("Not enough arguments to EPUSH", instr)
        elif instr[1] in REGISTERS:
            # USING REGISTER
            n, eget_instrs = self.expand_EGET(["EGET", instr[1]])
            expanded_instrs = eget_instrs
            expanded_instrs.extend([
                Instr(["PUSH"])])
        else:
            try:
                # USING HEX
                immed = format(int(instr[1], 16), 'x')
                n, expanded_instrs = self.expand_EUVAL(["EUVAL", instr[1]])
                expanded_instrs.append(Instr(["PUSH"]))
            except ValueError as e:
                # not HEX => USING STRING
                immed = "0x{}".format(str2hex(instr[1])) 
                n, expanded_instrs = self.expand_EUVAL(["EUVAL", immed])
                expanded_instrs.append(Instr(["PUSH"]))
        return (len(expanded_instrs), expanded_instrs)


    def expand_ECALL(self, instr):
        if len(instr) < 2:
            raise ParseMacroError("Not enough arguments to ECALL", instr)

        elif instr[1] in REGISTERS:
            #USING REG
            n, eget_instrs = self.expand_EGET(["EGET", instr[1]])
            expanded_instrs = eget_instrs
            expanded_instrs.extend([
                Instr(["SWAP"]),
                Instr(["CALL"])])
        elif instr[1] in self.labels:
            # Using label
            n, expanded_instrs = self.expand_EUVAL(["EUVAL", instr[1]])
            expanded_instrs.extend([
                Instr(["SWAP"]),
                Instr(["CALL"])])
        else:
            # using hex value as ADDR
            n, expanded_instrs = self.expand_EUVAL(["EUVAL", instr[1]])
            expanded_instrs.extend([
                Instr(["SWAP"]),
                Instr(["CALL"])])

        return (len(expanded_instrs), expanded_instrs)


    def expand_EGET(self, instr):
        if instr[1] not in REGISTERS:
            raise ParseMacroError("Unknown Register", instr)
        else:
            reg_index = REGISTERS[instr[1]]
            expanded_instrs = [
                Instr(["CLR"]),
                Instr(["BASE"]),
                Instr(["UVAL", "0x{}".format(format(reg_index, 'x'))]),
                Instr(["MREG"]),
                Instr(["ADD"]),
                Instr(["DPTR"]) ]
            return (len(expanded_instrs), expanded_instrs) 
        

    def expand_ESET(self, instr):
        if len(instr) < 2:
            raise ParseMacroError("Not enough arguments to ESET", instr)
        elif instr[1] not in REGISTERS:
            raise ParseMacroError("Unknown Register", instr)

        else:   
            expanded_instrs = []
            rdst_idx = REGISTERS[instr[1]]
            if len(instr) == 2:
                # NO SECOND ARG - SET R_DST to VAL
                expanded_instrs = [
                    Instr(["PUSH"]),
                    Instr(["CLR"]),
                    Instr(["BASE"]),
                    Instr(["UVAL", "0x{}".format(format(rdst_idx, 'x'))]),
                    Instr(["MREG"]),
                    Instr(["ADD"]),
                    Instr(["POP"]),
                    Instr(["APTR"]) ]
            elif instr[2] in REGISTERS:
                # USING REGISTER
                n, eget_instrs = self.expand_EGET(["EGET", instr[2]])
                expanded_instrs = eget_instrs
                n, eset_instrs = self.expand_ESET(["ESET", instr[1]])
                expanded_instrs.extend(eset_instrs)
            else: 
                # USING HEX VALUE
                try:
                    immed = format(int(instr[2], 16), 'x')
                except ValueError as e:
                    raise ParseMacroError("ESET parse error - not REG or hex value", instr)
                    return (0, [])
                expanded_instrs = [
                    Instr(["CLR"]),
                    Instr(["BASE"]),
                    Instr(["UVAL", "0x{}".format(format(rdst_idx, 'x'))]),
                    Instr(["MREG"]),
                    Instr(["ADD"])]
                n, euval_instrs = self.expand_EUVAL(["EUVAL", instr[2]])
                expanded_instrs.extend(euval_instrs)
                expanded_instrs.append(Instr(["APTR"]))
                
            return (len(expanded_instrs), expanded_instrs)
        

    def expand_EUVAL(self, instr):
        expanded_instrs = [Instr(["CLR"])]

        if instr[1] in self.labels: 
            # USING A LABEL
            for i in range(MAX_ADDR_LEN - 1):
                new_instr = Instr(["UVAL", "0x0"])
                new_instr.use_label = True
                new_instr.label_str = instr[1]
                new_instr.label_index = MAX_ADDR_LEN-1 - i
                expanded_instrs.append(new_instr)
                expanded_instrs.append(Instr(["SHVAL"]))

            # Add last hex digit and don't Shift it.
            new_instr = Instr(["UVAL", "0x0"])
            new_instr.use_label = True
            new_instr.label_str = instr[1]
            new_instr.label_index = 0
            expanded_instrs.append(new_instr)

        else:
            # USING A HEX VALUE
            try:
                immed = format(int(instr[1], 16), 'x')
            except ValueError as e:
                raise ParseMacroError("EUVAL parse error - not label or hex value", instr)
                return (0, [])

            if len(immed) == 1:
                expanded_instrs.append(Instr(["UVAL", "0x{}".format(immed[0])] ))

            else:
                expanded_instrs.append(Instr(["UVAL", "0x{}".format(immed[0])] ))
                for i in range(1, len(immed)):
                    expanded_instrs.append(Instr(["SHVAL"]))
                    expanded_instrs.append(Instr(["UVAL", "0x{}".format(immed[i])] ))

        
        return(len(expanded_instrs), expanded_instrs)
                

def str2hex(string):
    # Purpose 
    #   take a string and return an ascii string of hex to go into instrs
    string_d = bytes(string, "utf-8").decode("unicode_escape") 
    out = []
    for c in string_d[::-1]:
        out.append(format(ord(c), 'x'))
    return  ''.join(out)
    

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


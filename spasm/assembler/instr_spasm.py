#!/usr/bin/env python3


class Instr:

    def __init__(self):
        
        self.opstr = ""
        self.opcode = 0

        self.use_immed = False
        self.immed = 0

        self.use_label = False
        self.label_index = 0 
        self.label_str = ""


    def __init__(self, instr):
        self.opstr = ""
        self.opcode = 0

        self.use_immed = False
        self.immed = 0

        self.use_label = False
        self.label_index = 0 
        self.label_str = ""
        
        # Now parse the new instruction
        self.parse_opstr(instr)


    def parse_opstr(self, instr):
        op = instr[0].upper()

        if op == "UVAL":
            self.opstr = op
            self.use_immed = True
            if len(instr) <= 1:
                raise InstrError("UVAL - immediate not specified", self) 
            try: 
                if len(format(int(instr[1], 16), 'x')) > 1: 
                    raise InstrError("UVAL - immediate too long", self)
                self.immed = int(instr[1], 16) 
            except ValueError as e:
                raise InstrError("UVAL - unable to parse immediate", self)

        elif op == "SYSCALL":
            self.opstr = op
            self.opcode = 0x1F
        elif op == "BASE":
            self.opstr = op
            self.opcode = 0x1E
        elif op == "SHVAL":
            self.opstr = op
            self.opcode = 0x1D
        elif op == "MREG":
            self.opstr = op
            self.opcode = 0x1C
        elif op == "PUSH":
            self.opstr = op
            self.opcode = 0x1B
        elif op == "POP":
            self.opstr = op
            self.opcode = 0x1A
        elif op == "DPTR":
            self.opstr = op
            self.opcode = 0x19
        elif op == "APTR":
            self.opstr = op
            self.opcode = 0x18
        elif op == "SWAP":
            self.opstr = op
            self.opcode = 0x17
        elif op == "JZ":
            self.opstr = op
            self.opcode = 0x13
        elif op == "J":
            self.opstr = op
            self.opcode = 0x12
        elif op == "CALL":
            self.opstr = op
            self.opcode = 0x11
        elif op == "CMP":
            self.opstr = op
            self.opcode = 0x10
        elif op == "ADD":
            self.opstr = op
            self.opcode = 0x0F
        elif op == "2CMP":
            self.opstr = op
            self.opcode = 0x0E
        elif op == "DADD":
            self.opstr = op
            self.opcode = 0x0D
        elif op == "DMUL":
            self.opstr = op
            self.opcode = 0x0C
        elif op == "DDIV":
            self.opstr = op
            self.opcode = 0x0B
        elif op == "DSHL":
            self.opstr = op
            self.opcode = 0x09
        elif op == "DSHR":
            self.opstr = op
            self.opcode = 0x08
        elif op == "DAND":
            self.opstr = op
            self.opcode = 0x07
        elif op == "DOR":
            self.opstr = op
            self.opcode = 0x06
        elif op == "DXOR":
            self.opstr = op
            self.opcode = 0x05
        elif op == "NOT":
            self.opstr = op
            self.opcode = 0x04
        elif op == "RCLR":
            self.opstr = op
            self.opcode = 0x03
        elif op == "CLR":
            self.opstr = op
            self.opcode = 0x02
        elif op == "RNOP":
            self.opstr = op
            self.opcode = 0x01
        elif op == "NOP":
            self.opstr = op
            self.opcode = 0x00
        else: 
            self.opstr = op
            raise InstrError("Op String Not Recognized!", self)
                

    def get_opcode(self):
        if self.use_immed == True:
            if self.opstr != "UVAL":
                raise InstrError("Immediate included but not used", self) 
            else: 
                self.opcode = 0x30 | (0x0F & self.immed)

        return chr(self.opcode)
    
    def __repr__(self):
        if self.use_label:
            return 'Instr: {} {} {} - {}'.format(self.opstr, self.immed, self.label_str, self.label_index)
        elif self.use_immed:
            return 'Instr: {} {}'.format(self.opstr, self.immed)
        else:
            return 'Instr: {}'.format(self.opstr)
        
    def __str__(self):
        if self.use_label:
            return 'Instr: {} {} {} - {}'.format(self.opstr, self.immed, self.label_str, self.label_index)
        elif self.use_immed:
            return 'Instr: {} {}'.format(self.opstr, self.immed)
        else:
            return 'Instr: {}'.format(self.opstr)
        

class InstrError(Exception):
    def __init__(self, message, instr):
        self.print_summary(instr)
        super().__init__(message)

    def print_summary(self, instr):
        print(instr)
        

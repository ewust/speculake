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
        #TODO

        if instr[0] == "J":
            if instr[1] in labels:
                print(labels[instr[1]])
    
        print("TODO")

    def is_label(self):
        if self.label:
            return label
        else: 
            return False

    def get_opcode(self):
        # TODO
        print("TODO")
        return format(self.opcode, 'x')
    
    def __repr__(self):
        if self.use_label:
            return "Instr: {} {}".format(self.opstr, self.label_str)
        elif self.use_immed:
            return 'Instr: {} {}'.format(self.opstr, self.immed)
        else:
            return 'Instr: {}'.format(self.opstr)
        
    def __str__(self):
        if self.use_label:
            return 'Instr: {} {}'.format(self.opstr, self.label_str)
        elif self.use_immed:
            return 'Instr: {} {}'.format(self.opstr, self.immed)
        else:
            return 'Instr: {}'.format(self.opstr)
        

class InstrError(Exception):
    def __init__(self, message, instr):
        super().__init__(message)

    def print_summary(self):
        print(instr)
        

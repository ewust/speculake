#!/usr/bin/env python3

# lib
import os
import signal
import subprocess
import time 
import numpy as np
import matplotlib.pyplot as plt

# local
from tag_sr import tagged_sr

INC_STR = "    inc %rdx\n"
DEC_STR = "    dec %rdx\n"
ADD_STR = "    add $1, %dx\n"
ADD_LONG_STR = "    add $0xBEEF, %rdx\n"
MUL_STR = "    imul $3, %rdx, %rdx\n"
XOR_STR = "    xor %rdx, %rax\n"
SHL_STR = "    shl $1, %rdx\n"
AND_STR = "    and %rdx, %rax\n"
T_TESTS = {
    "inc": INC_STR, "dec": DEC_STR, "add":ADD_STR, "add_long":ADD_LONG_STR, "mul":MUL_STR, 
    "xor":XOR_STR, "and":AND_STR, "shl":SHL_STR}

C_INSTR =  "\t\t\"{}\\\\n\"\n"
JMP_REL_STR = C_INSTR.format("jmp .+2")
JMP_IND_STR = C_INSTR.format("jmp %%rax")
BRANCH_STR = C_INSTR.format("cmp $0x02, %%al")+C_INSTR.format("je .+2")
CALL_STR = C_INSTR.format("call get_rip")
TAKEN_B_STR = C_INSTR.format("jmp .+2")
UNTAKEN_B_STR = C_INSTR.format("jmp .+2")
C_TESTS = [JMP_REL_STR, JMP_IND_STR, BRANCH_STR, CALL_STR, TAKEN_B_STR, UNTAKEN_B_STR]


C_TEMPLATE_DEFAULT = "templates/common.c"
M_TEMPLATE_DEFAULT = "templates/measure.c"
T_TEMPLATE_DEFAULT = "templates/target_fn_empty.S"




class Gen_Job:
# Add success and failure callback functions 
# Add error types

    def __init__(self, 
            m_template = M_TEMPLATE_DEFAULT,
            c_template = C_TEMPLATE_DEFAULT,
            t_template = T_TEMPLATE_DEFAULT,
            m_strings = [],
            c_strings = [],
            t_strings = [],
            cpu_num = 0,
            cpu_mask = '0x1',
            duration = 60,
            description = ''):

        # Templates to be filled
        self.c_template = c_template 
        self.m_template = m_template
        self.t_template = t_template
        
        # Args to be filled into the templates
        self.c_strings = c_strings
        self.m_strings = m_strings
        self.t_strings = t_strings

        # Run parameters
        self.cpu_num = cpu_num      
        self.cpu_mask = cpu_mask
        self.duration = duration
        self.description = description
        self.job_complete = self.complete
        self.run = self.run_pipe
        

    def setup(self, m_template, c_template, m_strings, c_strings):
        tagged_sr(m_template, m_strings, "measure.c")
        tagged_sr(c_template, c_strings, "common.c")
        tagged_sr(t_template, t_strings, "target_fn.S")

    def setup(self):
        tagged_sr(self.m_template, self.m_strings, "measure.c")
        tagged_sr(self.c_template, self.c_strings, "common.c")
        tagged_sr(self.t_template, self.t_strings, "target_fn.S")

    def complete(self):
        print("Job Complete: \n{0}".format(self.description))

    def run_file(self):
        # Make the new measure and inject executables
        m = subprocess.Popen(["make", "all"], stdout=None)
        make_result =  m.wait()
        if make_result != 0:
            exit(1)

        print("Starting Inject\n")
        inject = subprocess.Popen(["taskset", "0x1", "./inject"])

        time.sleep(1)
        print("Starting Measure\n")
        measure = subprocess.Popen(["taskset", "0x1", "./measure"])

        timeout = time.time() + self.duration
        while time.time() < timeout:
            time.sleep(1)
            continue

        print("Ending Measure\n")
        measure.terminate()
        print("Ending inject\n")
        inject.terminate()
         
        self.job_complete()
        return 


    def run_pipe(self):    

        # Make the new measure and inject executables
        m = subprocess.Popen(["make", "new"], stdout=None)
        make_result =  m.wait()
        if make_result != 0:
            exit(1)

        print("Starting Inject\n")
        inject = subprocess.Popen(["taskset", "0x1", "./inject"])

        time.sleep(1)
        print("Starting Measure\n")
        measure = subprocess.Popen(["taskset", "0x1", "./measure"], stdout=subprocess.PIPE)

        max_res_ar = []
        avg_ar = []

        timeout = time.time() + self.duration
        for line in iter(measure.stdout.readline, b''):
            # print(line.rstrip())

            # Parse the data from the measure process pipE
            data = line.rstrip().split(b' ')
            max_res = int(data[0])
            avg = int(data[1])
            # print("max_res: {0}    avg:{1} ".format(max_res, avg))
            max_res_ar.append(max_res)
            avg_ar.append(avg)


            # Exit programs at the end of the time period
            if time.time() > timeout:
                print("Ending Measure\n")
                measure.terminate()
                print("Ending inject\n")
                inject.terminate()
                break

        return max_res_ar, avg_ar

    def __repr__(self):
        s = "<Gen_Job - Code Generation job\n\t"
        s += "Description: {}\n\n".format(self.description)

        s += "    -- Templates to be filled--\n\t"
        s += "C template: {}\n\t".format(self.c_template)
        s += "M template: {}\n\t".format(self.m_template)
        s += "T template: {}\n\n".format(self.t_template)
        
        s +=  "    -- Args to be filled into the templates --\n\t"
        s += "C template: {}\n\t".format(self.c_strings)
        s += "M template: {}\n\t".format(self.m_strings)
        s += "T template: {}\n\n".format(self.t_strings)

        s += "    -- Run parameters -- \n\t"
        s += "CPU Num: {}\n\t".format(self.cpu_num)
        s += "CPU Mask: {}\n\t".format(self.cpu_mask)
        s += "Duration: {}\n\t".format(self.duration)
        s += "Func Complete: {}\n\t".format(self.job_complete.__name__)
        s += "Func Run: {}\nend>\n".format(self.run.__name__)

        return s

    def __str__(self):
        return self.__repr__()


if __name__=="__main__":
    main()

#!/usr/bin/env python3

from gen_code import *
import random



def main():
    file_many_range()

# Many instructions  once To make sure they all work.
def file_many_range():
    
    file_format = "data/t_{0}_{1}.dat"

    for key, val in T_TESTS.items():

        i_range = list(range(0,181, 5))
        random.shuffle(i_range)

        for i in i_range:

            print("Starting Test {}".format(key))
        
            outfile = file_format.format(key, i)
        
            m_strs = ["FILE *fp = fopen(\"{}\", \"w\");".format(outfile), "fp", "", "fclose(fp);"] 
            c_strs = [JMP_REL_STR* 32] 
            t_strs = [val * i]
            desc = "Many instruction test (no range variation) - {}".format(val)

            # Use default templates and cpu masks
            job = Gen_Job(m_strings=m_strs, c_strings=c_strs, t_strings=t_strs, duration=20, description=desc)
            job.run = job.run_file
            job.setup()
            job.run()


# Many instructions  once To make sure they all work.
def file_many_one():
    
    file_format = "data/t_{0}_{1}.dat"

    for key, val in T_TESTS.items():
        print("Starting Test {}".format(key))
    
        outfile = file_format.format(key, 10)
    
        m_strs = ["FILE *fp = fopen(\"{}\", \"w\");".format(outfile), "fp", "", "fclose(fp);"] 
        c_strs = [JMP_REL_STR* 32] 
        t_strs = [val * 10]
        desc = "Many instruction test (no range variation) - {}".format(val)

        # Use default templates and cpu masks
        job = Gen_Job(m_strings=m_strs, c_strings=c_strs, t_strings=t_strs, duration=20, description=desc)
        job.run = job.run_file
        job.setup()
        job.run()

# One instruction across a range
def file_one_range():
    
    print("Testing file output")

    file_format = "data/t_{0}_{1}.dat"

    i_range = list(range(0,180, 5))
    random.shuffle(i_range)

    for i in i_range:

        print("Starting Test {}".format(i))

        outfile = file_format.format("inc", i)
    
        m_strs = ["FILE *fp = fopen(\"{}\", \"w\");".format(outfile), "fp", "", "fclose(fp);"] 
        c_strs = [JMP_REL_STR* 32] 
        t_strs = [INC_STR * i]

        # Use default templates and cpu masks
        job = Gen_Job(m_strings=m_strs, c_strings=c_strs, t_strings=t_strs,
                    description="test run to make sure files are filled correctly and all.")
        

        job.run = job.run_file
        job.setup()
        job.run()


def print_job():

    m_strings = ["// Printing to Pipe","stdout", "", ""]
    c_strs = [JMP_REL_STR* 10]
    t_strs = [INC_STR * 100]

    # Use default templates and cpu masks
    job = Gen_Job(m_strings=m_strs, c_strings=c_strs, t_strings=t_strs,
                description="test run for live printing into pipe.")

    job.run = job.run_pipe
    job.setup()
    # job.run()
    
    r = range(0, 181, 20)

    job1 = Gen_Job()

    for i in r:
        max_res, avg = run(ADD_LONG_STR, i, 20) 
        averages.append(np.mean(max_res))
        stds.append(np.std(max_res))
    
    plt.plot(r, averages) 
    plt.xlabel("# of instructions")
    plt.ylabel("Max Cache hit Results")
    plt.show()
    
    print("Done") 



def file_one_one():
    print("Testing file output")

    file_format = "t_{0}_{1}.dat"

    print("Starting Test {}".format(145))

    outfile = file_format.format("inc", 145)

    m_strs = ["FILE *fp = fopen(\"{}\", \"w\");".format(outfile), "fp", "", "fclose(fp);"] 
    c_strs = [JMP_REL_STR* 32] 
    t_strs = [INC_STR * 145]

    # Use default templates and cpu masks
    job = Gen_Job(m_strings=m_strs, c_strings=c_strs, t_strings=t_strs, duration=20,
                description="Running One job to test output. (t - inc - 145)")

    job.run = job.run_file
    job.setup()
    job.run()

if __name__ == "__main__":
    main()

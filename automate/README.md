# Automate

This is a small python framework to automate code generation and testing for speculake.

TLDR: 

`tag_sr.py` - tagged search and replace framework

`gen_code.py` - tagged_sr, make, taskset, and generally running jobs

`./templates/` - example templates.

`run_all.py` - multiple examples of running jobs automating code in measure, common, and target_fn


To run the current test in run_all.py 
```
> ./run_all.py
```

### Generating Code 

The file `tag_sr.py` specifies a small framework for parsing files (of any type) 
and filling tags in comment sections with text. Tags come in the form  `<<<{n[:k]}>>>`.
The tag id `n` is used to as an index into an array of strings to determine which string
to replace this tag with. The second tag argument, `k` is optional, and specifies the 
number of copies of the string to insert. 


To make use of this framework `gen_code.py` create a job where you can specify a template file,
the array of strings to fill that template file, and the cpu/cpu_mask on which to run that 
job. This way, you can guarantee that the inject and measure processes run on corresponding (or
on the same) cpu. 

To see some examples of tags in use look at the files `templates/measure.c` and `run_all.py`. 
The `measure()` function includes three tags as shown below. The first (`<<<{0}>>>`) tag uses 
the first item in the array. The second tag (`<<<{1}>>>`) uses the second, etc. 

```c
void measure() {
    fn_ptr = check_probes;
    /*<<<{0}>>>*/
    //jmp_ptr = 0x400e60;
    jmp_ptr = 0;
    int i;

...
    
        fprintf(/*<<<{1}>>>*/, "%lu %lu %lu\n",  max_res, tot_runs, avg);
        fflush(/*<<<{1}>>>*/);
        if (max_res > 10 && avg < 80){
            signal_idx++;
        } else {
            cur_probe_space += 63; 
            cur_probe_space %= MAX_PROBE_SPACE;
        }
        cache_hits = 0;
...

    }   

    /*<<<{3}>>>*/
}
```

A job created using `gen_code.py` will automatically do the tagged search and replace (`tagged_sr()`) in 
the setup function for any job, as long as the array of string arguments is passed. In `run_all.py` 
the tags are filled using the `m__strs` variable. If we look at the arguments that are going to fill in 
measure.c template, we fill in opening the file, the the fp pointer string, then the file close string.
This allows data to be written out to a different file name for every job. The strings provided in `c_strs` and `t_strs` fill in the tags in `common.c` and `target_fn_empty.S` accordingly. 

```python
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

```


The file `run_all.py` has more examples of different jobs that I have run also.



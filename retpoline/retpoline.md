# Retpoline Write-up


The plain inline construction of the retpoline where a desired destination function
is call is protected against speculation. Here we use the function pointer `fn_ptr` to
hold the destination and flush it from cache before using the retpoline to observe the
behavior.

```c
_mm_clflush(&fn_ptr);
asm volatile (
        "movq (fn_ptr), %%r11\n"    // (1)
        "jmp set_up_return\n"
     "inner_indirect_branch:\n"
        "call set_up_target\n"
    "capture_spec:\n"
        "pause\n"                   // (2)
        "jmp capture_spec\n"
    "set_up_target:\n"
                                    // (3)
        "mov %%r11, (%%rsp)\n"
                                    // (4)
        "ret\n"
    "set_up_return:\n"
        "call inner_indirect_branch\n"
:::"rax", "rcx", "rdx" );
```


To signal to the flush and reload mechanism that is looking for a signal we use this
load from the `probe_buf` array offset at `cur_probe_space` value to fool cache prediction
mechanisms.

```asm
// Signal(0x11)
movq $0x11, %rcx\n
mov (cur_probe_space), %rax\n
imul %rcx\n
mov (probe_buf), %rdx\n
add %rax, %rdx\n
mov (%rdx), %rax\n
nop\n
```

### Experiment 1
This experiment used the measure and trigger programs where the shared training sequence
of jumps makes use of a retpoline instead of an indirect call. The trigger program is trained
to use the retpoline to jump to `target_fn`, while the measure program uses the indirect
and retpoline to call `check_probes` performing the flush and reload timing check. In the
measure program the `target_fn` is set to a static signal that (if called speculatively)
will be detectable by `check_probes`.

##### Result:
The measure program never detected a signal from `target_fn` meaning that this construction
did not speculate the return based on the Indirect Branch Predictor (IBP) as trained by
trigger.

Tested on:

    intel i5-7200U          -- Kaby Lake
    intel Xeon E3-1270 v5   -- Skylake
    intel Xeon E3-1276 v3   -- Haswell
    intel i3-2105           -- Sandy Bridge

### Experiment 2

This experiment tested whether the retpoline construction speculated into the `capture_spec`
tag where speculated returns are supposed to be caught and stalled. To test this we placed
a static `Signal` (as described above) at `(2)` in place of the `pause` instruction.
##### Expectation:
We expect that this will trigger 100% of the time when the retpoline is used to indirectly
call a function using a function pointer that is not in cache.

##### Result:
Different processor generations saw different levels of speculation at `(2)`, ranging from
~60% in older processors to 100% in newer generations. We do not know where the missed
speculation is going when it is missing.

Tested on:

    intel Xeon E3-1270 v6   -- 100% -- Kaby Lake   (w/ microcode update)
    intel Xeon E3-1270 v6   -- 100% -- Kaby Lake
    intel i5-7200U          -- ~95% -- Kaby Lake
    intel Xeon E3-1270 v5   -- 100% -- Skylake
    intel i3-2105           -- 100% -- Sandy Bridge
    intel Xeon E3-1276 v3   -- ~60% -- Haswell


### Experiment 3
In these experiments we attempt to interfere and modify the RSB to cause it to mis-speculate
the return that is used within the retpoline construction, and investigate the way that 
returns and return speculation work in general. To do this we employ various methods,
code for these methods can be found in the appendix. 

    1) Clear RSB - we clear the RSB by doing 32 more returns than calls within a short period of time. 
    2) Dilute RSB - push many extra entries into the RSB by doing 32 more calls than returns. 
    3) Flush probe array - the same mechanism used in the flush and reload detection. 
    4) Repeated instructions - using nops or increments to separate sections by a significant number of instructions. 

These methods are mixed and matched on two test scenarios using retpoline. The first 
consists of the regular construction of retpoline. The second attempts to train 
the IBP to jump a certain way when retpoline is called. 

```
// in retpoline_miss.c line 302
for i=0 ... 100 {
    retpoline(&rt1)         // (e3 1)
}
flush_probe_array
clear_RSB                   // (e3 2)
flush_RSB
retpoline(&check_probes)    // (e3 3)

...

func rt1(){ 
    signal(0x11)
}
```

##### Expectation:
Because retpoline is being used repeatedly to jump to the function rt1 `(e3 1)` where a
signal is being transmitted by loading a value into cache we theorized that 
clearing the RSB or adding trash `(e3 2)` would force it to use the IBP to predict 
the final usage of the retpoline function `(e3 3)`. 


##### Results:
We tried many configurations of clearing the RSB and flushing to find the places where 
a signal could be detected. We noticed that ocassionally the return at `(clear_rsb 1)` 
was being speculated, meaning that the program would be speculating going into the final 
retpoline call. However, it never speculated the repoline return to a location 
containing a signal.  

We also included a test where we cleared the RSB inline in the retpoline construction
between the direct call and the return and it still speculated to `capture_spec`.

It is of note that the program can be induced into speculating the return in `clear_rsb`
with high consistency. The table below shows all of the different scanarios tested. 
It seems that 

[//]: <> (TODO)


|    |`(1)`|`(2)`|`(clear_rsb 2)`|`(dilute_rsb 1)`|`(dilute_rsb 2)`|
|----|:---:|:---:|:-------------:|:--------------:|:--------------:|
|Test<br> under test<br>more under test|test |test|test|test|test|
|mov r11, (rsb)<br>sys_sched_yield<br>ret|high|test|test|test|test|
|inc 1000<br>flush_cache<br>clear_rsb|low|test|test|test|test|
|inc 1000<br>flush_cache<br>flush_rsb|N/A|test|test|test|test|

[//]: <> ( intel Xeon E3-1270 v6   -- Kaby Lake   (w/ microcode update)
    intel Xeon E3-1270 v6   -- Kaby Lake
    intel i5-7200U          -- Kaby Lake
[//]: <> (   intel Xeon E3-1270 v5   -- Skylake            )
[//]: <> (   intel i3-2105           -- Sandy Bridge       )
[//]: <> (   intel Xeon E3-1276 v3   -- Haswell            )


### Experiment 4
This experiment inserted a voluntary yield at `(3)` or `(4)` such that another process 
might influence RSB. At the same time run a specially crafted trigger that continually
adds entries to the RSB. This must be done aligned with the `target_fn` of the measure
program so that the entries in the RSB will theoretically speculatively execute onto 
signal gadgets. 

##### Expectation:
A secondary process could add entries to the RSB that would be used to resolve a
speculative return.

##### Result:
With the inserted yield at `(3)` there is no signal indicating that the RSB was used to
speculate the return in the retpoline construction. Interestingly if the signal is left
`(2)` in place of the pause the process still speculates to this place meaning that somehow
entries of RSB are surviving across context switches.

If the inserted yield is placed at `(4)` there is no signal indicating that the secondary
process is properly training the RSB to speculatively execute the `target_fn`. If the 
signal gadget is left in at `(2)` there is no signal, suggesting that the load which 
originally caused speculation is resolved during the yield. 

Tested on:

[//]: <> ( intel Xeon E3-1270 v6   -- Kaby Lake   (w/ microcode update)
    intel Xeon E3-1270 v6   -- Kaby Lake
    intel i5-7200U          -- Kaby Lake
[//]: <> (   intel Xeon E3-1270 v5   -- Skylake            )
[//]: <> (   intel i3-2105           -- Sandy Bridge       )
[//]: <> (   intel Xeon E3-1276 v3   -- Haswell            )


### Experiment 5 -- (Not completed)
Voluntarily yield at `(3)` or `(4)` and try to determine how much the context switch
has affected the RSB by adding extra returns. 

### Experiment 6 -- (Not completed)
Place signals with nop sleds across the possible 32 bit "near jump" space to see where
the missed speculation attemps actually land. 


## Appendix and Code:

#### Clear RSB
This code theoretically clears the return stack buffer by repeatedly pushing 32 addresses
onto the stack and then using them to return. If the RSB really works as a stack then this 
should exhaust all entries. 

We added a signal after the call at `(clear_rsb 2)` to test if this the return address from
this call was being speculated by the retpoline ever (see Experiment 3).

```c
void clear_RSB() {
    asm vo latile (
    "clear_rsb:\n"
        "jmp go\n"
    "get_rip:\n"
        "p op %%rax\n"
        "add $0x21, %%rax\n"    // Add offset to jump over signal
        ".rept 33\n"
        "push %%rax\n"
        ".endr\n"
        "ret\n"                 // (clear_rsb 1)
    "go:\n"
        "call get_rip\n" 
                                // (clear_rsb 2)
        //Signal(0x22)
        "movq $0x22, %%rcx\n"
        "mov (cur_probe_space), %%rax\n"
        "imul %%rcx\n"
        "mov (probe_buf), %%rdx\n"
        "add %%rax, %%rdx\n"
        "mov (%%rdx), %%rax\n"

        "ret\n"
    :::);
}
```

#### Dilute RSB
The intel retpoline and spectre mitigation writeup includes a suggested method
for flushing the RSB. This is done by creating 33 nearby calls which perform no action
and are NOT accompanied by returns. 

We have adapted this method to include signal gadgets that 
are never executed in the real world run time. We hypothesized that this method 
of flushing the cache could allow a return to speculate to these new values 
flushed into the RSB over old values (see Experiment 3).

```c
void dilute_RSB() {
    asm volatile(
        ".rept 32\n"
        "call 1f\n"
        // "pause\n"
        // "lfence\n"
                                    // (dilute_rsb 1)
        "movq $0x88, %%rcx\n"
        "mov (cur_probe_space), %%rax\n"
        "imul %%rcx\n"
        "mov (probe_buf), %%rdx\n"
        "add %%rax, %%rdx\n"
        "mov (%%rdx), %%rax\n"

        "1: \n"
        ".endr\n"
        "callq .+0x26\n"
                                    // (dilute_rsb 2)
        "movq $0x88, %%rcx\n"
        "mov (cur_probe_space), %%rax\n"
        "imul %%rcx\n"
        "mov (probe_buf), %%rdx\n"
        "add %%rax, %%rdx\n"
        "mov (%%rdx), %%rax\n"
        
        "addq $(8 * 33),%%rsp\n"
    :::);
}
```


#### Headfake RSB
With head-fake we attempt to trick the RSB such that the "top" entry on the 
return stack points to a signal. This doesn't quite work as the call within 
the retpoline instruction is a direct call which we are always behind in the 
stack. 

```c
static inline __attribute__((always_inline)) void headfake_rsb(){
// void headfake_rsb(){
    asm volatile (
    "hf_rsb:\n"
        "jmp hf_go\n"
    "hf_get_rip:\n"
        "pop %%rax\n"
        "call retpoline_r11\n"
        "jmp hf_end\n"
    "hf_go:\n"
        "call hf_get_rip\n"

        //Signal(0x44)
        "movq $0x44, %%rcx\n"
        "mov (cur_probe_space), %%rax\n"
        "imul %%rcx\n"
        "mov (probe_buf), %%rdx\n"
        "add %%rax, %%rdx\n"
        "mov (%%rdx), %%rax\n"
    "hf_end:\n"
    :::);
}
```

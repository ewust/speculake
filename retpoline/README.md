# Retpoline Experiments

This file exaplains how to run the various experiments and 
the a simplified version about the alterations that can be 
easily tested. Most alterations just reqire commenting or
uncommenting a section.

See `retpoline.md` for more information on test results 
and interpretation. 

### How to run:

#### Experiment 2:
This should cause the retpoline construction to signal from 
within the `capture_spec` tag meaning that you will see
a signal printed to console if the speculation is happening.
For most processors it will have a hit rate close to 2000/2000.

```
> make exp2
> ./exp2
```

You can comment out the signal in the inline retpoline
construction and replace it with `pause;lfence\n` which 
will reduce the signal to 0. 

#### Experiment 4:
This program should show no signal whether the inject program is 
running or not. The yeild currently happens before the load of 
the target function pointer into the rsp register. 
```
> make exp4
> ../launch-no-aslr-shell.sh
> taskset 0x1 ./inject &
> taskset 0x1 ./measure
```
##### Alterations:
1. `measure_retp.c`
	a) Comment in/out usleep 
	b) Comment in/out clflush fn_ptr 
	c) Comment in/out retpoline
	d) Retpoline with yield in/out
	e) Comment in/out signal in capture_spec section of retpoline

2. Makefile
	a) Swap gcc version
	b) Swap in/out retpoline compile time options.
	c) Thunk options -- thunk (by block), thunk-inline (everwhere)


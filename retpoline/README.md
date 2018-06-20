# Retpoline Experiments

This file exaplains how to run the various experiments and 
the a simplified version about the alterations that can be 
easily tested. Most alterations just reqire commenting or
uncommenting a section.

See `retpoline.md` for more information on test results 
and interpretation. 

### How to run:

#### Experiment 1:
```
> make exp1
> ../launch-no-aslr-shell.sh
> taskset 0x1 ./exp1_inject &
> taskset 0x1 ./exp1_measure
```

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

#### Experiment 3:
In the default version of experiment 3 (default becuase it is current)
you should see a string signal for `0x22` and `0x11` as those are the 
signals from `clear_rsb` and `capture_spec` respectively. The signal 
in `clear_rsb` is caused by speculation coming through from an
unresolved instruction before. The series of increments amplify this 
speculation. The speculation in `capture_spec` is the retpoline 
construction functioning as expected (using the RSB).
```
> make exp3
> ./exp3
```

Modifications to this program include varying the things that are
done between line 349 and 367 including flushing the  probe array,
diluting the RSB and removing/changing the repeated increment. 
Alternatively signals can be enabled in `rt1` or disbabled in 
`clear_rsb`, etc.

#### Experiment 4:
This program should show no signal whether the inject program is 
running or not. The yeild currently happens before the load of 
the target function pointer into the rsp register. 
```
> make exp4
> ../launch-no-aslr-shell.sh
> taskset 0x1 ./exp4_inject &
> taskset 0x1 ./exp4_measure
```

One alteration is to add a signal to the `capture_spec` section 
of the retpoline constuction to see whether the yield interferes
with the speculation of the return to the direct call. Our 
experiments show that the inject process and the yield don't
affect it. 

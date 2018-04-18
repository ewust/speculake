# SPASM\_VM

1. Generate an encryted spasm binary

```sh
> python2 encrypt.py [filename]
```


2. Add the encrypted binary to the decrypt.S file to be passed back
    through cache side-channel 

```asm
ctext: 
    // insert encrypted bin here
```


3. Run `trigger` and `spasm_vm` 
```
(1)
>taskset 0x1 ./trigger

(2)
>taskset 0x2 ./spasm_vm

```

If `trigger` is not running the `spasm_vm` will make no progress and continue running.

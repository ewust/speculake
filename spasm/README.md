# SPASM


To run example programs use `process.c` or `process32.c` for 64 and 32 bit archetecture respectively.

32: 
```sh
$ make process32
$ ./process32 examples/hello32.sp
```

64: 
```sh
$ make process
$ ./process examples/hello.sp
```



To make the .sp spasm file use `pack_spasm.py` to pack the hex into one byte instructions

32 or 64:
```sh
$ python pack_spasm.py [spasm_outline.(txt|hex)]
```

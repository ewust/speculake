# SPASM

v1.3.0 -- 6/29/2018

#### Latest Updates:

Changed functionality of the SRSP pseudo-register. It now holds a
pointer to the top of the stack instead of an index into the 
structure that functions as register table. 

Underflow prevention is ensured by bounds check -> returns 0 if stack is empty.

Updated `hello_world`, `hello_world32`, and `rev_shell` to accomodate this 
new manner of functionality. 

#### Upcoming:
1. SRIP conversion to pointer.
2. Relative addressing & label addressing.
3. Control Flow Macros.
4. Full example programs 32 and 64

## Usage

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


## Instruction Set Arch,

```
SP-ASM ISA v1.1.0 -- X86-64      
----------------------------------------                           
3F  - UVAL    -  [111111] - Update VAL = 0xF                                 
3E  - UVAL    -  [111110] - Update VAL = 0xE                                 
3D  - UVAL    -  [111101] - Update VAL = 0xD                                 
3C  - UVAL    -  [111100] - Update VAL = 0xC                                 
3B  - UVAL    -  [111011] - Update VAL = 0xB                                 
3A  - UVAL    -  [111010] - Update VAL = 0xA                                 
39  - UVAL    -  [111001] - Update VAL = 0x9                                 
38  - UVAL    -  [111000] - Update VAL = 0x8                                 
37  - UVAL    -  [110111] - Update VAL = 0x7                                 
36  - UVAL    -  [110110] - Update VAL = 0x6                                 
35  - UVAL    -  [110101] - Update VAL = 0x5                                 
34  - UVAL    -  [110100] - Update VAL = 0x4                                 
33  - UVAL    -  [110011] - Update VAL = 0x3                                 
32  - UVAL    -  [110010] - Update VAL = 0x2                                 
31  - UVAL    -  [110001] - Update VAL = 0x1                                 
30  - UVAL    -  [110000] - Update VAL = 0x0                                 
2F  -         -  [101111] - FREE (DEFINE IF YOU NEED IT)
2E  -         -  [101110] - FREE (DEFINE IF YOU NEED IT)
2D  -         -  [101101] - FREE (DEFINE IF YOU NEED IT)
2C  -         -  [101100] - FREE (DEFINE IF YOU NEED IT)
2B  -         -  [101011] - FREE (DEFINE IF YOU NEED IT)
2A  -         -  [101010] - FREE (DEFINE IF YOU NEED IT)
29  -         -  [101001] - FREE (DEFINE IF YOU NEED IT)
28  -         -  [101000] - FREE (DEFINE IF YOU NEED IT)
27  -         -  [100111] - FREE (DEFINE IF YOU NEED IT)
26  -         -  [100110] - FREE (DEFINE IF YOU NEED IT)
25  -         -  [100101] - FREE (DEFINE IF YOU NEED IT)
24  -         -  [100100] - FREE (DEFINE IF YOU NEED IT)
23  -         -  [100011] - FREE (DEFINE IF YOU NEED IT)
22  -         -  [100010] - FREE (DEFINE IF YOU NEED IT)
21  -         -  [100001] - FREE (DEFINE IF YOU NEED IT)
20  -         -  [100000] - FREE (DEFINE IF YOU NEED IT)
1F  - SYSCALL -  [011111] - SYSCALL                                      
1E  - BASE    -  [011110] - PTR = BASE_ADDR                              
1D  - SHVAL   -  [011101] - VAL = VAL<<4   
1C  - MREG    -  [011100] - VAL *= 8 (reg_size)                          
1B  - PUSH    -  [011011] - PUSH VAL       
1A  - POP     -  [011010] - POP VAL        
19  - APTR    -  [011001] - VAL = *PTR                                   
18  - DPTR    -  [011000] - *PTR = VAL                                   
17  - SWAP    -  [010111] - SWAP   PTR <-> VAL                           
16  -         -  [010110] - FREE (DEFINE IF YOU NEED IT) (goto?)
15  -         -  [010101] - FREE (DEFINE IF YOU NEED IT) (load?)  
14  -         -  [010100] - FREE (DEFINE IF YOU NEED IT) (store?) 
13  - JZ      -  [010011] - JZ   ||  SRIP = (VAL==0)? PTR : SRIP+1       
12  - J       -  [010010] - J    ||  SRIP = PTR                          
11  - CALL    -  [010001] - CALL ||  PUSH SRIP+1; SRIP=PTR; //PUSH REGS? 
10  - CMP     -  [010000] - CMP  ||  VAL = (VAL <= PTR)? 1 : 0           
0F  - ADD     -  [001111] - PTR += VAL     
0E  - 2CMP    -  [001110] - VAL = 2sCompl(Val)                           
0D  - DADD    -  [001101] - *PTR += VAL                                  
0C  - DMUL    -  [001100] - *PTR *= VAL                                  
0B  - DDIV    -  [001011] - *PTR \= VAL                                  
0A  -         -  [001010] - FREE (DEFINE IF YOU NEED IT)
09  - DSHL    -  [001001] - *PTR << VAL                                  
08  - DSHR    -  [001000] - *PTR >> VAL                                  
07  - DAND    -  [000111] - *PTR &= VAL                                  
06  - DOR     -  [000110] - *PTR |= VAL                                  
05  - DXOR    -  [000101] - *PTR ^= VAL                                  
04  - NOT     -  [000100] - VAL = NOT VAL                                
03  - RCLR    -  [000011] - CLR VAL REPEAT                               
02  - CLR     -  [000010] - CLR VAL
01  - RNOP    -  [000001] - NOP REPEAT                                   
00  - NOP     -  [000000] - NOP            
---------------------------------------- 
Free Instructions: 20
---------------------------------------- 
---------------------------------------- 
MACROS :
---------------------------------------- 
EUVAL   [ label | hex ] 
ECALL   [ label | hex | reg ]
EPUSH   [ reg | hex | str ] 
EGET    [ reg ]
ESET    [ reg ] [ reg | hex |   ] 
---------------------------------------- 
```

### Examples

See the example programs in the `examples/` directory. All files that end `.spa` 
are spasm assembly files (probably written by hand), and all .sp files are spasm
binary files to be run through an emulator.




### Previous updates

---

v1.2.0 -- 4/5/2018

Multiple New instructions.

Both arithmetic and logical Operations have been changed to dereference PTR before applying the operation.
This allows The skipping of multiple instructions for `GET SR_X` and `SET SR_X`. 

```
NEW:
    0A  - PTR >> VAL 
    09  - *PTR += VAL
    06  - PTR |= VAL 
    05  - PTR ^= VAL 

DELETED:
    07  - CLR BOTH REPEAT 
    05  - CLR PTR REPEAT
    03  - CLR BOTH 
    01  - CLR PTR

MOVED: 
    1E -> 1F  - SYSCALL
    13 -> 1E  - PTR = BASE_ADDR
    0D -> 1C  - VAL *= 8 (reg_size)
    12 -> 19  - VAL = *PTR
    11 -> 18  - *PTR = VAL
    10 -> 17  - SWAP   PTR <-> VAL
    18 -> 13  - JZ   ||  SRIP = (VAL==0)? PTR : SRIP+1
    1F -> 12  - J    ||  SRIP = PTR
    17 -> 11  - CALL ||  PUSH SRIP+1; SRIP=PTR; //PUSH REGS?
    19 -> 10  - CMP  ||  VAL = (VAL <= PTR)? 1 : 0
    0A -> 09  - *PTR << VAL
    09 -> 07  - *PTR &= VAL
    08 -> 04  - NOT VAL
    06 -> 03  - CLR VAL REPEAT
    04 -> 01  - NOP REPEAT
```


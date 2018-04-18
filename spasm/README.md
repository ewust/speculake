# SPASM

v1.2.0 -- 4/5/2018

#### Latest Updates:

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
3F  -  [111111] - Update VAL = 0xF                                 
3E  -  [111110] - Update VAL = 0xE                                 
3D  -  [111101] - Update VAL = 0xD                                 
3C  -  [111100] - Update VAL = 0xC                                 
3B  -  [111011] - Update VAL = 0xB                                 
3A  -  [111010] - Update VAL = 0xA                                 
39  -  [111001] - Update VAL = 0x9                                 
38  -  [111000] - Update VAL = 0x8                                 
37  -  [110111] - Update VAL = 0x7                                 
36  -  [110110] - Update VAL = 0x6                                 
35  -  [110101] - Update VAL = 0x5                                 
34  -  [110100] - Update VAL = 0x4                                 
33  -  [110011] - Update VAL = 0x3                                 
32  -  [110010] - Update VAL = 0x2                                 
31  -  [110001] - Update VAL = 0x1                                 
30  -  [110000] - Update VAL = 0x0                                 
2F  -  [101111] - FREE (DEFINE IF YOU NEED IT)
2E  -  [101110] - FREE (DEFINE IF YOU NEED IT)
2D  -  [101101] - FREE (DEFINE IF YOU NEED IT)
2C  -  [101100] - FREE (DEFINE IF YOU NEED IT)
2B  -  [101011] - FREE (DEFINE IF YOU NEED IT)
2A  -  [101010] - FREE (DEFINE IF YOU NEED IT)
29  -  [101001] - FREE (DEFINE IF YOU NEED IT)
28  -  [101000] - FREE (DEFINE IF YOU NEED IT)
27  -  [100111] - FREE (DEFINE IF YOU NEED IT)
26  -  [100110] - FREE (DEFINE IF YOU NEED IT)
25  -  [100101] - FREE (DEFINE IF YOU NEED IT)
24  -  [100100] - FREE (DEFINE IF YOU NEED IT)
23  -  [100011] - FREE (DEFINE IF YOU NEED IT)
22  -  [100010] - FREE (DEFINE IF YOU NEED IT)
21  -  [100001] - FREE (DEFINE IF YOU NEED IT)
20  -  [100000] - FREE (DEFINE IF YOU NEED IT)
1F  -  [011111] - SYSCALL                                           ### Moved (1E->1F)
1E  -  [011110] - PTR = BASE_ADDR                                   ### Moved (13->1E)
1D  -  [011101] - VAL = VAL<<4   
1C  -  [011100] - VAL *= 8 (reg_size)                               ### Moved (0D->1C) 
1B  -  [011011] - PUSH VAL       
1A  -  [011010] - POP VAL        
19  -  [011001] - VAL = *PTR                                        ### Moved (12->19)
18  -  [011000] - *PTR = VAL                                        ### Moved (11->18)
17  -  [010111] - SWAP   PTR <-> VAL                                ### Moved (10->17)                              
16  -  [010110] - FREE (DEFINE IF YOU NEED IT) (goto?)
15  -  [010101] - FREE (DEFINE IF YOU NEED IT) (load?)  
14  -  [010100] - FREE (DEFINE IF YOU NEED IT) (store?) 
13  -  [010011] - JZ   ||  SRIP = (VAL==0)? PTR : SRIP+1            ### Moved (18->13)
12  -  [010010] - J    ||  SRIP = PTR                               ### Moved (1F->12) 
11  -  [010001] - CALL ||  PUSH SRIP+1; SRIP=PTR; //PUSH REGS?      ### Moved (17->11) 
10  -  [010000] - CMP  ||  VAL = (VAL <= PTR)? 1 : 0                ### Moved (19->10)
0F  -  [001111] - PTR += VAL     
0E  -  [001110] - VAL = 2sCompl(Val)                               
0D  -  [001101] - *PTR += VAL                                       ### New
0C  -  [001100] - *PTR *= VAL                                       ### Changed 
0B  -  [001011] - *PTR \= VAL                                       ### Changed 
0A  -  [001010] - FREE (DEFINE IF YOU NEED IT)
09  -  [001001] - *PTR << VAL                                       ### Moved (0A->09)
08  -  [001000] - *PTR >> VAL                                       ### New
07  -  [000111] - *PTR &= VAL                                       ### Moved (09->07)
06  -  [000110] - *PTR |= VAL                                       ### New
05  -  [000101] - *PTR ^= VAL                                       ### New
04  -  [000100] - VAL = NOT VAL                                     ### Moved (08->04)
03  -  [000011] - CLR VAL REPEAT                                    ### Moved (06->03)
02  -  [000010] - CLR VAL
01  -  [000001] - NOP REPEAT                                        ### Moved (04->01)     
00  -  [000000] - NOP            
---------------------------------------- 
Free Instructions: 20
---------------------------------------- 
```




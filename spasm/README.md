# SPASM

v1.0.2 -- 4/3/2018

#### Latest Updates:

Call Instruction added


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
SP-ASM ISA v1.0.2 -- X86-64      
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
2F  -  [101111] - Update PTR = 0xF                                 
2E  -  [101110] - Update PTR = 0xE                                 
2D  -  [101101] - Update PTR = 0xD                                 
2C  -  [101100] - Update PTR = 0xC                                 
2B  -  [101011] - Update PTR = 0xB                                 
2A  -  [101010] - Update PTR = 0xA                                 
29  -  [101001] - Update PTR = 0x9                                 
28  -  [101000] - Update PTR = 0x8                                 
27  -  [100111] - Update PTR = 0x7                                 
26  -  [100110] - Update PTR = 0x6                                 
25  -  [100101] - Update PTR = 0x5                                 
24  -  [100100] - Update PTR = 0x4                                 
23  -  [100011] - Update PTR = 0x3                                 
22  -  [100010] - Update PTR = 0x2                                 
21  -  [100001] - Update PTR = 0x1                                 
20  -  [100000] - Update PTR = 0x0                                 
1F  -  [011111] - SET IP  ||  SRIP = PTR                           
1E  -  [011110] - SYSCALL        
1D  -  [011101] - VAL = VAL<<4   
1C  -  [011100] - PTR = PTR<<4   
1B  -  [011011] - PUSH VAL       
1A  -  [011010] - POP VAL        
19  -  [011001] - CMP  ||  VAL = (VAL <= RAX)? 1 : 0               
18  -  [011000] - JMP  ||  SRIP = (VAL==0)? PTR : SRIP+1           
17  -  [010111] - CALL  ||  PUSH SRIP+1; SRIP=PTR; //PUSH REGS?    
16  -  [010110] - FREE  (goto?)  
15  -  [010101] - FREE  (load?)  
14  -  [010100] - FREE  (store?) 
13  -  [010011] - PTR = BASE_ADDR                                  
12  -  [010010] - VAL = *PTR     
11  -  [010001] - *PTR = VAL     
10  -  [010000] - SWAP   PTR <-> VAL                               
0F  -  [001111] - PTR += VAL     
0E  -  [001110] - VAL = 2sCompl(Val)                               
0D  -  [001101] - VAL *= 8 (reg_size)                              
0C  -  [001100] - FREE (DEFINE IF YOU NEED IT)                     
0B  -  [001011] - FREE (DEFINE IF YOU NEED IT)                     
0A  -  [001010] - FREE (DEFINE IF YOU NEED IT)                     
09  -  [001001] - FREE (DEFINE IF YOU NEED IT)                     
08  -  [001000] - FREE (DEFINE IF YOU NEED IT)                     
07  -  [000111] - CLR BOTH REPEAT                                  
06  -  [000110] - CLR VAL REPEAT 
05  -  [000101] - CLR PTR REPEAT 
04  -  [000100] - NOP REPEAT     
03  -  [000011] - CLR BOTH       
02  -  [000010] - CLR VAL        
01  -  [000001] - CLR PTR        
00  -  [000000] - NOP            
---------------------------------------- 
```

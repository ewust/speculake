
#include <stdint.h>

// Check GCC
#if __GNUC__
  #if __x86_64__ || __ppc64__
    #define ENV64
    typedef uint64_t uint_reg;
    #define BYTES_PER_REG 8
    #define SPASM_JIT_SUPPORT "X86-64"
  #else
    #define ENV32
    typedef uint32_t uint_reg;
    #define BYTES_PER_REG 4
    #define SPASM_JIT_SUPPORT "X86 (i386)"
  #endif
#endif

#define SRIP_OFFSET  (uint_reg)0x00
#define SRSP_OFFSET  (uint_reg)0x01
#define PTR_OFFSET  (uint_reg)0x02
#define VAL_OFFSET  (uint_reg)0x03
#define SRAX_OFFSET (uint_reg)0x04
#define SRBX_OFFSET (uint_reg)0x05
#define SRCX_OFFSET (uint_reg)0x06
#define SRDX_OFFSET (uint_reg)0x07
#define SRSI_OFFSET (uint_reg)0x08
#define SRDI_OFFSET (uint_reg)0x09
#define SRBP_OFFSET (uint_reg)0x0A
#define SR8_OFFSET  (uint_reg)0x0B
#define SR9_OFFSET  (uint_reg)0x0C
#define STK_OFFSET  (uint_reg)0x0D


#define SRIP_OFFSET_BYTES  BYTES_PERPREG * SRIP_OFFSET 
#define SRSP_OFFSET_BYTES  BYTES_PERPREG * SRSP_OFFSET 
#define PTR_OFFSET_BYTES   BYTES_PERPREG * PTR_OFFSET  
#define VAL_OFFSET_BYTES   BYTES_PERPREG * VAL_OFFSET  
#define SRAX_OFFSET_BYTES  BYTES_PERPREG * SRAX_OFFSET 
#define SRBX_OFFSET_BYTES  BYTES_PERPREG * SRBX_OFFSET 
#define SRCX_OFFSET_BYTES  BYTES_PERPREG * SRCX_OFFSET 
#define SRDX_OFFSET_BYTES  BYTES_PERPREG * SRDX_OFFSET 
#define SRSI_OFFSET_BYTES  BYTES_PERPREG * SRSI_OFFSET 
#define SRDI_OFFSET_BYTES  BYTES_PERPREG * SRDI_OFFSET 
#define SRBP_OFFSET_BYTES  BYTES_PERPREG * SRBP_OFFSET 
#define SR8_OFFSET_BYTES   BYTES_PERPREG * SR8_OFFSET  
#define SR9_OFFSET_BYTES   BYTES_PERPREG * SR9_OFFSET  
#define STK_OFFSET_BYTES   BYTES_PERPREG * STK_OFFSET  
#define NUM_REGS 13



/*  STATE STRUCT LAYOUT 

               ______________
               |            | 
               |    Text    | 
              ...          ... 
               |____________| 
0   0      0   |    SRIP    | 
1   8      40  |    SRSP    | 
2   10     80  |    PTR     | 
3   18     C0  |    VAL     |   // X86-64   |    X86 (32)
4   20     100 |    SRAX    |   //   OP     |       OP
5   28     140 |    SRBX    |               |     arg 1 
6   30     1C0 |    SRCX    |   //  arg 4   |     arg 2 
7   38     200 |    SRDX    |   //  arg 3   |     arg 3 
8   40     240 |    SRSI    |   //  arg 2   |     arg 4 
9   48     280 |    SRDI    |   //  arg 1   |     arg 5 
A   50     2C0 |    SRBP    |   //          |     arg 6 
B   58     300 |    SR8     |   //  arg 5   | 
C   60     340 |    SR9     |   //  arg 6   |
               |------------| 
D   68     3C0 |  | Stack | | 
               |  v       v | 
               |____________| 

*/

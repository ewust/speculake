#include <stdio.h>
#include <sys/mman.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>

typedef struct jump_st {
    uint64_t from;
    uint64_t to;
} jump;

#define PAGE_SIZE 0x1000
#define MAX_PAGES 100
#define NUM_JUMPS 31



inline void call(void *fn_ptr) __attribute__((always_inline));
void call(void* fn_ptr) {
    asm volatile ("jmpq *%%rax\n" :: "a"(fn_ptr) :);
}

inline void push(uint64_t val) __attribute__((always_inline));
void push(uint64_t val) {
    asm volatile ("push %%rax\n" :: "a"(val):);
}


uint64_t loaded_pages[MAX_PAGES];
int loaded_pages_idx = 0;

void load_page(uint64_t addr)
{
    uint64_t page = addr & ~(PAGE_SIZE-1);
    int i;
    for (i=0; i<loaded_pages_idx; i++) {
        if (loaded_pages[i] == page) {
            // Already loaded
            return;
        }
    }
    loaded_pages[loaded_pages_idx++] = page;

    void *map = mmap((void*)page, PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED, -1, 0);

    if (map == ((void*)-1)) {
        printf("Error mapping %lx (page %lx):\n", addr, page);
        perror("mmap");
        exit(-1);
    }
    printf("Mapped %p -> %p\n", (void*)page, map);

    // Fill with returns:
    memset(map, '\xc3', PAGE_SIZE);
}



int main()
{


    memset(loaded_pages, 0, sizeof(uint64_t)*MAX_PAGES);
    jump addrs[NUM_JUMPS] = {
        // CAMELLIA256-SHA / EVP_MD_CTX_init...
        {0x7ffff780d32d, 0x7ffff780d3ff}, //  retq   
        {0x7ffff788a28b, 0x7ffff788a3b1}, //  retq   
        {0x7ffff77fedad, 0x7ffff77fe8f0}, //  callq  *0x36d5f5(%rip)        # 0x7ffff7b6c3a8
        {0x7ffff77fe8f7, 0x7ffff7458a80}, //  jmpq   *%rax
        {0x7ffff745687e, 0x7ffff7458ae0}, //  retq   
        {0x7ffff7458b29, 0x7ffff77fedb3}, //  retq   
        {0x7ffff77fede3, 0x7ffff788a513}, //  retq   
        {0x7ffff77fdb40, 0x7ffff7470a30}, //  jmpq   *0x36e68a(%rip)        # 0x7ffff7b6c1d0
        {0x7ffff7470a71, 0x7ffff788a40a}, //  retq   
        {0x7ffff788a495, 0x7ffff780cc39}, //  retq   
        {0x7ffff788a28b, 0x7ffff788a3b1}, //  retq   
        {0x7ffff77fedad, 0x7ffff77fe8f0}, //  callq  *0x36d5f5(%rip)        # 0x7ffff7b6c3a8
        {0x7ffff77fe8f7, 0x7ffff7458a80}, //  jmpq   *%rax
        {0x7ffff745687e, 0x7ffff7458ae0}, //  retq   
        {0x7ffff7458b29, 0x7ffff77fedb3}, //  retq   
        {0x7ffff77fede3, 0x7ffff788a513}, //  retq   
        {0x7ffff77fdb40, 0x7ffff7470a30}, //  jmpq   *0x36e68a(%rip)        # 0x7ffff7b6c1d0
        {0x7ffff7470a71, 0x7ffff788a40a}, //  retq   
        {0x7ffff788a495, 0x7ffff780cc5d}, //  retq   
        {0x7ffff788a28b, 0x7ffff788a3b1}, //  retq   
        {0x7ffff77fedad, 0x7ffff77fe8f0}, //  callq  *0x36d5f5(%rip)        # 0x7ffff7b6c3a8
        {0x7ffff77fe8f7, 0x7ffff7458a80}, //  jmpq   *%rax
        {0x7ffff745687e, 0x7ffff7458ae0}, //  retq   
        {0x7ffff7458b29, 0x7ffff77fedb3}, //  retq   
        {0x7ffff77fede3, 0x7ffff788a513}, //  retq   
        {0x7ffff77fdb40, 0x7ffff7470a30}, //  jmpq   *0x36e68a(%rip)        # 0x7ffff7b6c1d0
        {0x7ffff7470a71, 0x7ffff788a40a}, //  retq   
        {0x7ffff788a495, 0x7ffff780cc6e}, //  retq   
        {0x7ffff780cc45, 0x7ffff780d437}, //  retq   
        {0x7ffff780d407, 0x7ffff789730b}, //  retq   
        {0x7ffff7897318, 0x7ffff788a420}, //  retq  
    };
        /* AES something
        {0x7ffff7837bd9, 0x7ffff7834da4}, //  retq   
        {0x7ffff77fd9f0, 0x7ffff74628d0}, //  jmpq   *0x36e732(%rip)        # 0x7ffff7b6c128
        {0x7ffff783bf4c, 0x7ffff7834dd0}, //  retq   
        {0x7ffff77fd9f0, 0x7ffff74628d0}, //  jmpq   *0x36e732(%rip)        # 0x7ffff7b6c128
        {0x7ffff74629c6, 0x7ffff783bf08}, //  retq   
        {0x7ffff783bf4c, 0x7ffff7834e08}, //  retq   
        {0x7ffff783f5d4, 0x7ffff7834fcf}, //  retq   
        {0x7ffff783f768, 0x7ffff7834ff8}, //  retq   
        {0x7ffff783f5d4, 0x7ffff7834fcf}, //  retq   
        {0x7ffff783f768, 0x7ffff7834ff8}, //  retq   
        {0x7ffff7837ac3, 0x7ffff7837bd6}, //  retq   
        {0x7ffff7837bd9, 0x7ffff783c038}, //  retq   
        {0x7ffff783c0fd, 0x7ffff783507f}, //  retq   
        {0x7ffff7838bd2, 0x7ffff78350cd}, //  retq   
        {0x7ffff7834cec, 0x7ffff783db35}, //  retq   
        {0x7ffff7838ab2, 0x7ffff783a322}, //  retq   
        {0x7ffff783f5d4, 0x7ffff78391ff}, //  retq   
        {0x7ffff783929d, 0x7ffff783a390}, //  retq   
        {0x7ffff7838bd2, 0x7ffff783a3e2}, //  retq   
        {0x7ffff783a3f2, 0x7ffff783daab}, //  retq   
        {0x7ffff783f728, 0x7ffff7834718}, //  retq   
        {0x7ffff78347a3, 0x7ffff7834b15}, //  retq   
        {0x7ffff7834b24, 0x7ffff783dac1}, //  retq   
        {0x7ffff7838ab2, 0x7ffff7834d40}, //  retq   
        {0x7ffff7838036, 0x7ffff7838c45}, //  retq   
        {0x7ffff7838c56, 0x7ffff7834d48}, //  retq   
        {0x7ffff7838036, 0x7ffff7838c45}, //  retq   
        {0x7ffff7838c56, 0x7ffff7834d53}, //  retq   
        {0x7ffff7838036, 0x7ffff7838c45}, //  retq   
        {0x7ffff7838c56, 0x7ffff7834d5f}, //  retq   
    };*/

    // Camellia write (I think SSL_CTX_clean or something)
    /*
        {0x7ffff788a28b, 0x7ffff788a3b1},    // :   retq   
        {0x7ffff77fedad, 0x7ffff77fe8f0},    // :   callq  *0x36d5f5(%rip)        # 0x7ffff7b6c3a8
        {0x7ffff77fe8f7, 0x7ffff7458a80},    // :   jmpq   *%rax
        {0x7ffff745687e, 0x7ffff7458ae0},    // :   retq   
        {0x7ffff7458b29, 0x7ffff77fedb3},    // :   retq   
        {0x7ffff77fede3, 0x7ffff789726c},    // :   retq   
        {0x7ffff77fe3f7, 0x00418980    },    //:   jmpq   *%rax
        {0x004189cb, 0x7ffff77fe877    },    //:   retq   
        {0x7ffff77fe3f7, 0x00418980    },    //:   jmpq   *%rax
        {0x004189cb, 0x7ffff77fe896    },    //:   retq   
        {0x7ffff77fe8a3, 0x7ffff78972b0},    //:   retq   
        {0x7ffff7897308, 0x7ffff780d3f0},    //:   callq  *0x10(%rax)
        {0x7ffff77fedad, 0x7ffff77fe8f0},    //:   callq  *0x36d5f5(%rip)        # 0x7ffff7b6c3a8
        {0x7ffff77fe8f7, 0x7ffff7458a80},    //:   jmpq   *%rax
        {0x7ffff745687e, 0x7ffff7458ae0},    //:   retq   
        {0x7ffff7458b29, 0x7ffff77fedb3},    //:   retq   
        {0x7ffff77fede3, 0x7ffff780d2df},    //:   retq   
        {0x7ffff780d32d, 0x7ffff780d3ff},    //:   retq   
        {0x7ffff788a28b, 0x7ffff788a3b1},    //:   retq   
        {0x7ffff77fedad, 0x7ffff77fe8f0},    //:   callq  *0x36d5f5(%rip)        # 0x7ffff7b6c3a8
        {0x7ffff77fe8f7, 0x7ffff7458a80},    //:   jmpq   *%rax
        {0x7ffff745687e, 0x7ffff7458ae0},    //:   retq
        {0x7ffff7458b29, 0x7ffff77fedb3},    //:   retq
        {0x7ffff77fede3, 0x7ffff788a513},    //:   retq
        {0x7ffff77fdb40, 0x7ffff7470a30},    //:   jmpq   *0x36e68a(%rip)        # 0x7ffff7b6c1d0
        {0x7ffff7470a71, 0x7ffff788a40a},    //:   retq
        {0x7ffff788a495, 0x7ffff780cc39},    //:   retq
        {0x7ffff788a28b, 0x7ffff788a3b1},    //:   retq
    };
    */


    int i;
    // Setup
    for (i=0; i<NUM_JUMPS-1; i++) {
        load_page(addrs[i].from);
        load_page(addrs[i].to);

        // Write the jump from this .to to  the next .from
        // get difference - 5 (len(jmpq $xxxx) instruction)
        uint8_t *p = (uint8_t*)(addrs[i].to);
        int32_t diff = addrs[i+1].from - addrs[i].to;
        if (diff > 0 && diff < 5) {
            // Fill with nops instead
            // a jmpq instruction would overwrite the next
            // retq byte...
            memset(p, '\x90', diff);
        } else {
            // Fill with a jump
            *p++ = 0xe9; // jumpq
            int32_t from = diff - 5;
            memcpy(p, &from, 4);
        }
    }


    // Do the jumps
    void *x = &&come_home;
    push((uint64_t)x);

    // Do the pushes then call!
    for (i=NUM_JUMPS-2; i>=0; i--) {
        push(addrs[i].to);
    }

    // Call the first thing in the chain. See ya!
    void (*fn_ptr)(void);
    fn_ptr = (void (*)(void))addrs[0].from;
    //(*fn_ptr)();
    call(fn_ptr);


    // We won't actually return here...
    printf("look ma, no return\n");

    //asm volatile("come_home:\n" :::);
come_home:
    printf("AND WE'RE BACK!!!\n");
}

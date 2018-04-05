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

jump addrs[NUM_JUMPS] = {
        // in openssl-accept.repeats2}, //254 repeats (line 14491502):
        // part of EC_GFp_nistp224_method()
        {0x7ffff785a74b, 0x7ffff785c256}, //  retq   
        {0x7ffff785a926, 0x7ffff785c261}, //  retq   
        {0x7ffff785ae37, 0x7ffff785c277}, //  retq   
        {0x7ffff785a74b, 0x7ffff785c28f}, //  retq   
        {0x7ffff785a74b, 0x7ffff785c2a2}, //  retq   
        {0x7ffff785abfc, 0x7ffff785c2b5}, //  retq   
        {0x7ffff785ae37, 0x7ffff785c2cd}, //  retq   
        {0x7ffff785a34a, 0x7ffff785c2e3}, //  retq   
        {0x7ffff785a27e, 0x7ffff785c2f3}, //  retq   
        {0x7ffff785a74b, 0x7ffff785ac1d}, //  retq   
        {0x7ffff785a74b, 0x7ffff785ac28}, //  retq   
        {0x7ffff785abfc, 0x7ffff785ac36}, //  retq   
        {0x7ffff785ac40, 0x7ffff785c3c5}, //  retq   
        {0x7ffff785ae37, 0x7ffff785c3d0}, //  retq   
        {0x7ffff785a74b, 0x7ffff785c3e3}, //  retq   
        {0x7ffff785a926, 0x7ffff785c3f3}, //  retq   
        {0x7ffff785ae37, 0x7ffff785c3ff}, //  retq   
        {0x7ffff785a34a, 0x7ffff785c4b7}, //  retq   
        {0x7ffff785a27e, 0x7ffff785c4c9}, //  retq   
        {0x7ffff785a27e, 0x7ffff785c538}, //  retq   
        {0x7ffff785a74b, 0x7ffff785c543}, //  retq   
        {0x7ffff785a926, 0x7ffff785c54e}, //  retq   
        {0x7ffff785ae37, 0x7ffff785c55e}, //  retq   
        {0x7ffff785a34a, 0x7ffff785c569}, //  retq   
        {0x7ffff785a41a, 0x7ffff785c61d}, //  retq   
        {0x7ffff785a74b, 0x7ffff785c628}, //  retq   
        {0x7ffff785abfc, 0x7ffff785c638}, //  retq   
        {0x7ffff785a926, 0x7ffff785c645}, //  retq   
        {0x7ffff785a5f0, 0x7ffff785c798}, //  retq   
        {0x7ffff785ae37, 0x7ffff785c847}, //  retq   
        {0x7ffff785c858, 0x7ffff785ea59}, //  retq   

    };




void setup()
{
    memset(loaded_pages, 0, sizeof(uint64_t)*MAX_PAGES);

    int i;
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

    load_page(addrs[NUM_JUMPS-1].to);
    //memcpy((void*)jump_addrs[NUM_JUMPS-1].to, target_fn, end_target_fn-target_fn);

}

void bar()
{
    asm volatile("mov (0x440000),%%rax\n"
                    "callq *%%rax\n":::);
}


int main()
{



    // Do the jumps
    //void *x = &&come_home;
    //push((uint64_t)x);
    //asm volatile ("push %%rax\n" :: "a"(x):);
    setup();
    printf("setup1\n");

    /*
    uint8_t *p = (uint8_t*)(addrs[NUM_JUMPS-1].to);
    *p++ = 0xe9;
    int32_t from = (uint64_t)&&done_jumps - addrs[NUM_JUMPS-1].to - 5;
    memcpy(p, &from, 4);
    */

    printf("setup done\n");

    int i;
    while (1) {

        asm volatile ("push %%rax\n" :: "a"(&&done_jumps):);
        // Do the pushes then call!
        for (i=NUM_JUMPS-1; i>=0; i--) {
            //push(addrs[i].to);
            asm volatile ("push %%rax\n" :: "a"(addrs[i].to):);
        }

        // Call the first thing in the chain. See ya!
        void (*fn_ptr)(void);
        fn_ptr = (void (*)(void))addrs[0].from;
        //(*fn_ptr)();
        //printf("calling...\n");
        call(fn_ptr);
done_jumps:
        //printf("returned\n");
        i = 0;

    }
}

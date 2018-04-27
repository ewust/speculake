#include <stdio.h>
#include <sys/mman.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>


void __attribute__((section(".fnptr"))) (*fn_ptr)(void);


typedef struct jump_st {
    uint64_t from;
    uint64_t to;
} jump;

#define PAGE_SIZE 0x1000
#define MAX_PAGES 100
#define NUM_JUMPS 32



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
        {0x7ffff77d304c, 0x7ffff77dc0d4}, // :   retq   
        {0x7ffff77d314c, 0x7ffff77dc1d4}, // :   retq   
        {0x7ffff77d324c, 0x7ffff77dc2d4}, // :   retq   
        {0x7ffff77d334c, 0x7ffff77dc3d4}, // :   retq   
        {0x7ffff77d344c, 0x7ffff77dc4d4}, // :   retq   
        {0x7ffff77d354c, 0x7ffff77dc5d4}, // :   retq   
        {0x7ffff77d364c, 0x7ffff77dc6d4}, // :   retq   
        {0x7ffff77d374c, 0x7ffff77dc7d4}, // :   retq   
        {0x7ffff77d384c, 0x7ffff77dc8d4}, // :   retq   
        {0x7ffff77d394c, 0x7ffff77dc9d4}, // :   retq   
        {0x7ffff77d3a4c, 0x7ffff77dcad4}, // :   retq   
        {0x7ffff77d3b4c, 0x7ffff77dcbd4}, // :   retq   
        {0x7ffff77d3c4c, 0x7ffff77dccd4}, // :   retq   
        {0x7ffff77d3d4c, 0x7ffff77dcdd4}, // :   retq   
        {0x7ffff77d3e4c, 0x7ffff77dced4}, // :   retq   
        {0x7ffff77d3f4c, 0x7ffff77dcfd4}, // :   retq   


        {0x7ffff77e3a4c, 0x7ffff77eccd4}, // :   retq   
        {0x7ffff77e7bf9, 0x7ffff77e9421}, // :   retq   
        {0x7ffff77ee8a0, 0x7ffff77e836f}, // :   retq   
        {0x7ffff77e840d, 0x7ffff77e9548}, // :   retq   
        {0x7ffff77e7d22, 0x7ffff77e9591}, // :   retq   
        {0x7ffff77e95a1, 0x7ffff77ecc4b}, // :   retq   
        {0x7ffff77ee9a8, 0x7ffff77e33d8}, // :   retq   
        {0x7ffff77e3457, 0x7ffff77e37a5}, // :   retq   
        {0x7ffff77e37b3, 0x7ffff77ecc61}, // :   retq   
        {0x7ffff77e7bf9, 0x7ffff77e3965}, // :   retq   
        {0x7ffff77e7166, 0x7ffff77e7d95}, // :   retq   
        {0x7ffff77e7da6, 0x7ffff77e396d}, // :   retq   
        {0x7ffff77e7166, 0x7ffff77e7d95}, // :   retq   
        {0x7ffff77e7da6, 0x7ffff77e3978}, // :   retq   
        {0x7ffff77e7166, 0x7ffff77e8d90}, // :   retq   
        {0x7ffff77e8da6, 0x7ffff77e3985}, // :   retq   
    };




void setup()
{
    memset(loaded_pages, 0, sizeof(uint64_t)*MAX_PAGES);

    uint8_t callq_rax[] = {
        0x48, 0x03, 0x03,   // add (%rbx),%rax
        //0xff, 0xd0,         //  callq *%rax
         0xff, 0xe0,  // jmpq *%rax
    };
    int callq_offset = 2;

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
            if (i == (NUM_JUMPS - 2)) {
                from -= (sizeof(callq_rax) - callq_offset);
            }
            memcpy(p, &from, 4);
        }
    }

    load_page(addrs[NUM_JUMPS-1].to);

    uint8_t stalled_jmp[] = {
                            0x90, 0x90,
                            0x90,                               // nop
            0x48, 0x8b, 0x04, 0x25, 0x00, 0x00, 0x44, 0x00,     // mov (0x440000),%rax
                            //0x90, 0x90,                         // nop, nop
                            //0x50,                               // push %rax
                            0x90,
                            0x90,                               // nop
                            //0x90, 0x90,                         // nop, nop
                            //0xeb, 0x02,                          // jmp +2
                            0x90, 0x90,                         // nop, no
                            //0xc3, 0x90,                       // ret, nop
                            0xff, 0xd0,                         // callq *%rax
                            0x90};

    //memcpy((void*)addrs[NUM_JUMPS-1].to, stalled_jmp, 20);

    //fn_ptr = (void*)addrs[NUM_JUMPS-1].to;
    //memcpy((void*)jump_addrs[NUM_JUMPS-1].to, target_fn, end_target_fn-target_fn);

    // -3 or -5?
    memcpy((void*)addrs[NUM_JUMPS-1].from - (sizeof(callq_rax) - callq_offset), callq_rax, sizeof(callq_rax));

}

void bar()
{
    asm volatile("mov (0x440000),%%rax\n"
                    "callq *%%rax\n":::);
}


void nop()
{
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
    uint64_t jmp_ptr = 0;
    while (1) {

        asm volatile ("push %%rax\n" :: "a"(&&done_jumps):);
        // Do the pushes then call!
        for (i=NUM_JUMPS-1; i>=0; i--) {
            //push(addrs[i].to);
            asm volatile ("push %%rax\n" :: "a"(addrs[i].to):);
        }

        // Call the first thing in the chain. See ya!
        void (*fn_ptr)(void);
        void (*fn_ptr2)(void);
        fn_ptr = (void (*)(void))addrs[0].from;
        fn_ptr2 = (void (*)(void))addrs[NUM_JUMPS-1].to;
        //(*fn_ptr)();
        //printf("calling...\n");
        asm volatile ("jmpq *%%rcx\n" :: "c"(fn_ptr), "a"(fn_ptr2), "b"(&jmp_ptr) :);
        //call(fn_ptr);
done_jumps:
        //printf("returned\n");
        i = 0;

    }
}

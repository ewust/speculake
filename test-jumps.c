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



inline void call(void *fn_ptr) __attribute__((always_inline));
void call(void* fn_ptr) {
    asm volatile ("jmpq *%%rax\n" :: "a"(fn_ptr) :);
}

inline void push(uint64_t val) __attribute__((always_inline));
void push(uint64_t val) {
    asm volatile ("push %%rax\n" :: "a"(val):);
}



int main()
{

    jump addrs[] = {
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


    void *map = mmap((void*)(addrs[0].from & ~(PAGE_SIZE-1)), PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED, -1, 0);
    if (map == ((void*)-1)) {
        perror("mmap");
        exit(-1);
    }
    printf("Got it: %p\n", map);
    memset(map, '\xc3', PAGE_SIZE);


    //map = mmap((void*)(addrs[0].to & ~(PAGE_SIZE-1)), PAGE_SIZE, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED, -1, 0);

    uint8_t *p = (uint8_t*)(addrs[0].to);
    *p++ = 0xe9;    //jmpq
    int32_t from = addrs[1].from - addrs[0].to - 5; //5 for len(jmpq $xxxx)
    memcpy(p, &from, 4);

    push(addrs[1].to);
    push(addrs[0].to);


    void (*fn_ptr)(void);
    fn_ptr = (void (*)(void))addrs[0].from;
    //(*fn_ptr)();
    call(fn_ptr);

}

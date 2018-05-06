#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <sys/mman.h>
#include <string.h>
#include "common.h"

__uint128_t do_jumps();

int idx = 0;

void train(int print_key)
{
    fn_ptr = (void(*)(void))(0x510fd0);
    printf("fn_ptr: %p\n", fn_ptr);
    jmp_ptr = 0;
    uint64_t ctr = 0;
    while (1) {
        //_mm_clflush(fn_ptr);
        //_mm_clflush(&jmp_ptr);


        //__uint128_t register ct = do_jumps(ctr);
        uint8_t register ct = do_jumps(ctr);

        if (print_key) {
            //uint64_t low = ct;
            //uint64_t high = (ct >> 64);
            //printf("  .quad 0x%016lx, 0x%016lx    # %08lx\n", high, low, ctr);
            printf("  .byte 0x%02x    # %08lx\n", ct, ctr);

            ctr++;
            if (++idx > 100) {
                exit(0);
            }
        }

        //signal(pt >> ((signal_idx % 16)*8) & 0xff);
        //indirect(&jmp_ptr);
        //((void (*)(void *))map)(&jmp_ptr);
    }
}

void usage(char *argv[])
{
    printf("\nUsage: %s [e|t]\n", argv[0]);
    printf("\te = encrypt\n");
    printf("\tt = train\n");
}

int main(int argc, char *argv[])
{

    if (argc < 2) {
        usage(argv);
        exit(1);
    }

    if (argv[1][0] == 'e') {
        printf("encrypting...\n");
        train(1);
    } else if (argv[1][0] == 't') {
        printf("training...\n");
        train(0);
    }

    usage(argv);
    exit(1);

}



#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <string.h>
#include <sys/mman.h>
#include "common.h"

unsigned int junk=0;    // For rdtscp

int main()
{

    uint64_t t0, t1;
    int i;

    uint8_t *addr;

    uint8_t *buf = malloc(4096*100);
    addr = &buf[4096*13];

    for (i=0; i<100000; i++) {

        // Flush from cache
        _mm_clflush(addr);

        t0 = _rdtscp(&junk);
        asm volatile( "movb (%%rbx), %%al\n"
            :: "b"(addr) : "rax");
        t1 = _rdtscp(&junk);
        printf("%d\n", (t1-t0));
    }
}

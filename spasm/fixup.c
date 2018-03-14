#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>

#define OP_DONE 0x80
#define OP_SHL  0x40
#define OP_UP   0x20
#define OP_CLR  0x10


uint8_t update(uint64_t cur, uint64_t target)
{
    if (cur == target) {
        return OP_DONE;
    }
    int i;
    uint64_t t = cur;
    for (i=0; i<sizeof(uint64_t)*2; i++) {
        //printf("----%016lx | %016lx\n",
        //        (cur << (i*4)), ((target & ((1ULL << (i*4)) -1))));

        if (((cur  << (i*4)) | ((target & ((1ULL << (i*4)) - 1))) ) == target &&
                (cur << 4) != cur) {
            return OP_SHL;
        }

        if ((cur | ((target >> (i*4))&0xf)) == (target >> (i*4))) {
            return OP_UP | ((target >> (i*4))&0xf);
        }
    }
    //return OP_UP | ((target >> (15*4)) & 0xf);
    return OP_CLR;
}




int main() {
    uint64_t cur = 0xabcdef010203;
    uint64_t target = 0xbabecafedeadbeef;


    while (1) {
        printf("  cur:    0x%016lx\n", cur);
        printf("  target: 0x%016lx\n", target);
        uint8_t op = update(cur, target);
        if (op == OP_DONE) {
            printf("Done!\n");
            break;
        }
        if (op == OP_CLR) {
            printf("OP_CLR\n");
            cur = 0;
        } else if (op == OP_SHL) {
            printf("OP_SHL\n");
            cur <<= 4;
        } else {
            printf("OP_UP 0x%x\n", (op & 0xf));
            cur |= (op & 0xf);
        }
    }
}

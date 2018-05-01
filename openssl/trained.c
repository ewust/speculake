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

void addr_0x7ffff77e339c();
void addr_0x7ffff77e33ac();
void addr_0x7ffff77e33b7();
void addr_0x7ffff77e343d();
void addr_0x7ffff77e3466();
void addr_0x7ffff77e36e0();
void addr_0x7ffff77e37a0();
void addr_0x7ffff77e38e0();
void addr_0x7ffff77e3927();
void addr_0x7ffff77e3942();
void addr_0x7ffff77e394d();
void addr_0x7ffff77e3955();
void addr_0x7ffff77e3a24();
void addr_0x7ffff77e3a3b();
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
void addr_0x7ffff77e7d8b();
void addr_0x7ffff77e7db0();
void addr_0x7ffff77e8320();
void addr_0x7ffff77e834d();
void addr_0x7ffff77e835d();
void addr_0x7ffff77e83ff();
void addr_0x7ffff77e93e0();
void addr_0x7ffff77e93ff();
void addr_0x7ffff77e9407();
void addr_0x7ffff77e942f();
void addr_0x7ffff77e943b();
void addr_0x7ffff77e9456();
void addr_0x7ffff77e9520();
void addr_0x7ffff77e952d();
void addr_0x7ffff77e9589();
void addr_0x7ffff77eb240();
void addr_0x7ffff77ecc38();
void addr_0x7ffff77ecc53();
void addr_0x7ffff77ecc7a();
void addr_0x7ffff77ee7c0();
void addr_0x7ffff77ee7cb();
void addr_0x7ffff77ee851();
void addr_0x7ffff77ee89d();
void addr_0x7ffff77ee980();


void setup()
{
    load_page(0x7ffff77e3000);
    memcpy((void*)0x7ffff77e339c, addr_0x7ffff77e339c, 2);
    memcpy((void*)0x7ffff77e33ac, addr_0x7ffff77e33ac, 7);
    memcpy((void*)0x7ffff77e33b7, addr_0x7ffff77e33b7, 53);
    memcpy((void*)0x7ffff77e343d, addr_0x7ffff77e343d, 27);
    memcpy((void*)0x7ffff77e3466, addr_0x7ffff77e3466, 9);
    memcpy((void*)0x7ffff77e36e0, addr_0x7ffff77e36e0, 33);
    memcpy((void*)0x7ffff77e37a0, addr_0x7ffff77e37a0, 20);
    memcpy((void*)0x7ffff77e38e0, addr_0x7ffff77e38e0, 67);
    memcpy((void*)0x7ffff77e3927, addr_0x7ffff77e3927, 23);
    memcpy((void*)0x7ffff77e3942, addr_0x7ffff77e3942, 7);
    memcpy((void*)0x7ffff77e394d, addr_0x7ffff77e394d, 4);
    memcpy((void*)0x7ffff77e3955, addr_0x7ffff77e3955, 48);
    memcpy((void*)0x7ffff77e3a24, addr_0x7ffff77e3a24, 19);
    memcpy((void*)0x7ffff77e3a3b, addr_0x7ffff77e3a3b, 18);
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
    memcpy((void*)0x7ffff77e7d72, addr_0x7ffff77e7d72, 21);
    memcpy((void*)0x7ffff77e7d8b, addr_0x7ffff77e7d8b, 28);
    memcpy((void*)0x7ffff77e7db0, addr_0x7ffff77e7db0, 15);
    load_page(0x7ffff77e8000);
    memcpy((void*)0x7ffff77e8320, addr_0x7ffff77e8320, 34);
    memcpy((void*)0x7ffff77e834d, addr_0x7ffff77e834d, 12);
    memcpy((void*)0x7ffff77e835d, addr_0x7ffff77e835d, 32);
    memcpy((void*)0x7ffff77e83ff, addr_0x7ffff77e83ff, 15);
    load_page(0x7ffff77e9000);
    memcpy((void*)0x7ffff77e93e0, addr_0x7ffff77e93e0, 27);
    memcpy((void*)0x7ffff77e93ff, addr_0x7ffff77e93ff, 4);
    memcpy((void*)0x7ffff77e9407, addr_0x7ffff77e9407, 36);
    memcpy((void*)0x7ffff77e942f, addr_0x7ffff77e942f, 8);
    memcpy((void*)0x7ffff77e943b, addr_0x7ffff77e943b, 23);
    memcpy((void*)0x7ffff77e9456, addr_0x7ffff77e9456, 9);
    memcpy((void*)0x7ffff77e9520, addr_0x7ffff77e9520, 9);
    memcpy((void*)0x7ffff77e952d, addr_0x7ffff77e952d, 81);
    memcpy((void*)0x7ffff77e9589, addr_0x7ffff77e9589, 25);
    load_page(0x7ffff77eb000);
    memcpy((void*)0x7ffff77eb240, addr_0x7ffff77eb240, 1);
    load_page(0x7ffff77ec000);
    memcpy((void*)0x7ffff77ecc38, addr_0x7ffff77ecc38, 23);
    memcpy((void*)0x7ffff77ecc53, addr_0x7ffff77ecc53, 35);
    memcpy((void*)0x7ffff77ecc7a, addr_0x7ffff77ecc7a, 98);
    load_page(0x7ffff77ee000);
    memcpy((void*)0x7ffff77ee7c0, addr_0x7ffff77ee7c0, 7);
    memcpy((void*)0x7ffff77ee7cb, addr_0x7ffff77ee7cb, 11);
    memcpy((void*)0x7ffff77ee851, addr_0x7ffff77ee851, 25);
    memcpy((void*)0x7ffff77ee89d, addr_0x7ffff77ee89d, 4);
    memcpy((void*)0x7ffff77ee980, addr_0x7ffff77ee980, 12);

}

void do_pattern();

int main()
{
    setup();
    do_pattern();
}


#ifndef SPEC_SIZE_H
#define SPEC_SIZE_H


void make_routine(unsigned char* ibuf, void *p1, void *p2, int icount, int instr);
void init_dbuf(void ** dbuf, int size, int cycle_length);

#endif

//const int memsize = 536870912;
static const int memsize = 268435456;
static int outer_its = 64;
static int its = 8192;
static const int unroll = 17;


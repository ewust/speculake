
#include "stringify.h"
#include "signal.h"

/* Return target place-holder functions. Used while attempting to train
 * the return buffer through continuous use. 
 *
 * rt1 employs __signal to affect cache if this function ever hit speculatively.
 */
void rt1(){ asm volatile( __signal(0xFF) :::); }
void rt2(){}


/* 
 * Retpoline construction used to test effect of unfortunately timed 
 * context switches.
 * 
 * The __signal in capture_spec gives an idea of how often the intended 
 * speculative behavior is realized by affecting the cache.
 */
void retpoline_r11_yield(){
    asm volatile(
        "jmp y_set_up_return\n"
    "y_inner_indirect_branch:\n"
        "call y_set_up_target\n"
    "y_capture_spec:\n"
        __signal(0x11)          /* swap out with pause; lfence to ignore */
        // "pause; lfence\n"
        "jmp y_capture_spec\n"
    "y_set_up_target:\n"
        // "mov $0x18, %%rax\n"     /* sys_sched_yield */
        // "syscall\n"              /*    Uncomment for exact context switch */
        "movq (fn_ptr), %%r11\n"
        "mov %%r11, (%%rsp)\n"
        "ret\n"
    "y_set_up_return:\n"
        "call y_inner_indirect_branch\n"
    :::"r11", "rax");
}


/* 
 * Generic retpoline construction taken from Google white paper spec.
 */
void retpoline_r11(){
    asm volatile(
        "movq (fn_ptr), %%r11\n"
        "jmp set_up_return\n"
    "inner_indirect_branch:\n"
        "call set_up_target\n"
    "capture_spec:\n"
        "pause;lfence\n"
        "jmp capture_spec\n"
    "set_up_target:\n"
        "mov %%r11, (%%rsp)\n"
        "ret\n"
    "set_up_return:\n"
        "call inner_indirect_branch\n"
    :::);
}

/*
 * Fill the CPU return stack buffer.
 *
 * Each entry in the RSB, if used for a speculative 'ret', contains an
 * infinite 'pause; lfence; jmp' loop to capture speculative execution.
 *
 * This is required in various cases for retpoline and IBRS-based
 * mitigations for the Spectre variant 2 vulnerability. Sometimes to
 * eliminate potentially bogus entries from the RSB, and sometimes
 * purely to ensure that it doesn't get empty, which on some CPUs would
 * allow predictions from other (unwanted!) sources to be used.
 *
 * We define a CPP macro such that it can be used from both .S files and
 * inline assembly. It's possible to do a .macro and then include that
 * from C via asm(".include <asm/nospec-branch.h>") but let's not go there.
 */

#define RSB_CLEAR_LOOPS		32	/* To forcibly overwrite all entries */
#define RSB_FILL_LOOPS		16	/* To avoid underflow */
#define BITS_PER_LONG       32

/*
 * Google experimented with loop-unrolling and this turned out to be
 * the optimal version — two calls, each with their own speculation
 * trap should their return address end up getting used, in a loop.
 */
#define __FILL_RETURN_BUFFER(reg, nr, sp)	\
	mov	$(nr/2), reg;			\
771:						\
	call	772f;				\
773:	/* speculation trap */			\
	pause;					\
	lfence;					\
	jmp	773b;				\
772:						\
	call	774f;				\
775:	/* speculation trap */			\
	pause;					\
	lfence;					\
	jmp	775b;				\
774:						\
	dec	reg;				\
	jnz	771b;				\
	add	$(BITS_PER_LONG/8) * nr, sp;


#define __retpoline_fill_return_buffer					\
		__stringify(__FILL_RETURN_BUFFER(%%ebx, RSB_CLEAR_LOOPS, %%esp))


void fill_RSB() { asm volatile(__retpoline_fill_return_buffer:::"rbx");}

void fill_RSB_s() {
    asm volatile(
        ".rept 32\n"
        "call 1f\n"
        __signal(0x88)
        // "pause;lfence\n"
        "1: \n"
        ".endr\n"
        "callq .+0x26\n"//
        __signal(0x88)
        "nop\n"
        "addq $(8 * 33),%%rsp\n"
    :::);
}


/* 
 * Clear any Return Buffer that doesn't loop on itself using unmatched
 * returns to underflow any stack-like data structure.
 */
#define __CLEAR_RETURN_BUFFER(reg, nr) \
	jmp 783f;		\
781:				\
	pop  reg;		\
	.rept nr;		\
	push reg;		\
	.endr;			\
	ret;			\
782:				\
	call 	781b;	\
	ret;			\
783:				\
	call 	782b;	



#define __retpoline_clear_return_buffer		\
		__stringify(__CLEAR_RETURN_BUFFER(%%rbx, RSB_CLEAR_LOOPS))

/* 
 * Underflow the return buffer. Perform a series of unmatched returns
 * such that any stack based data-structure will be completely empty. 
 */
void clear_RSB() { asm volatile(__retpoline_clear_return_buffer:::"rbx");}

void clear_RSB_s() {
    asm volatile (
    "clear_rsb:\n"
        "jmp go\n"
    "get_rip:\n"
        "pop  %%rax\n"
        "add $0x21, %%rax\n"    /* Add offset to jump over signal */
        ".rept 33\n"
        "push %%rax\n"
        ".endr\n"
        "ret\n"
    "go:\n"
        "call get_rip\n"
        __signal(0x22)
        "ret\n"
    :::);
}

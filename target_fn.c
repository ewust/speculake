#include <unistd.h>
#include <stdint.h>

extern uint8_t *probe_buf;
extern uint64_t cur_probe_space;
extern uint64_t signal_idx;

uint64_t try_decrypt(void);

extern uint8_t *turing_tape;
extern uint8_t turing_state;

// This will be an int 0-255 typically...
void signal(uint64_t state)
{
    asm volatile ("mov (%%rcx), %%rax" :: "c"(&probe_buf[state*cur_probe_space]) : "rax");
}


void update_state(uint8_t write, uint8_t move_right, uint8_t state)
{
    // write is either 0 or 1 (for 2-symbol)
    // move_right is 1 for R, 0 for L
    // state is 0=A, 1=B, etc
    signal((state << 2) | ((move_right&0x1) << 1) | (write & 0x1));
}

#define L 0
#define R 1

void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void)
{


    uint64_t dec = try_decrypt();
    signal((dec >> 8*signal_idx) & 0xff);

    /*
    asm volatile (
        ".align 16\n"
        "key_schedule:\n"
            ".quad 0xf0e0d0c0b0a0908, 0x706050403020100  \n"      // xmm0
            ".quad 0xfe76abd6f178a6da, 0xfa72afd2fd74aad6\n"    // xmm1
            ".quad 0xfeb3306800c59bbe, 0xf1bd3d640bcf92b6\n"    // xmm2
            ".quad 0x41bf6904bf0c596c, 0xbfc9c2d24e74ffb6\n"    // xmm3
            ".quad 0xfd8d05fdbc326cf9, 0x33e3595bcf7f747 \n"    // xmm4
            ".quad 0xaa22f6ad57aff350, 0xeb9d9fa9e8a3aa3c\n"    // xmm5
            ".quad 0x6b1fa30ac13d55a7, 0x9692a6f77d0f395e\n"    // xmm6
            ".quad 0x26c0a94e4ddf0a44, 0x8ce25fe31a70f914\n"    // xmm7
            ".quad 0xd27abfaef4ba16e0, 0xb9651ca435874347\n"    // xmm8
            ".quad 0x4e972cbe9ced9310, 0x685785f0d1329954\n"    // xmm9
            ".quad 0xc5302b4d8ba707f3, 0x174a94e37f1d1113\n"    // xmm10
        */


    /*
    register int i;
    register int x = 0;
    //signal(15);
    for (i=0; i<19; i++) {
        x += i;
    }
    signal(x & 0xff);
    */
}

void end_target_fn(void) __attribute__((section(".targetfn")));
void end_target_fn(void) {
}

/*
	push %rbx
	movabs $probe_buf, %rbx
    mov (%rbx), %rbx
	movabs $cur_probe_space, %rcx
    mov  (%rcx), %rcx 
	movabs $signal_idx, %rax
    mov  (%rax), %rax
	//add %rax, %rax
	imul $3, %rax
	and $0xff, %rax
	mul %rcx
	add %rax, %rbx
	movb (%rbx),%al
end_target_fn:

	pop %rbx
	ret
*/

/*
	mov signal_ptr, %rcx
	mov	(%rcx), %al
	retq
*/


/*
	// works
	push	%rbp
	mov		%rsp,%rbp
	push	%rbx
	push	%rcx
	push	%rdx
	mov		$signal_ptr,%edx
	mov		%edx,%ecx
	mov		(%rcx),%rbx
	mov		(%rbx),%al
	pop		%rdx
	pop		%rcx
	pop		%rbx
	pop		%rbp
	retq
*/

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
    uint64_t register dec = try_decrypt();
    signal((dec >> 8*signal_idx) & 0xff);

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

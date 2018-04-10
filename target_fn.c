#include <unistd.h>
#include <stdint.h>

extern uint8_t *probe_buf;
extern uint64_t cur_probe_space;
extern uint64_t signal_idx;

uint64_t try_decrypt(void);
__uint128_t aes_ctr(uint64_t ctr);

extern uint8_t *turing_tape;
extern uint8_t turing_state;

// This will be an int 0-255 typically...
inline void signal(uint64_t state) __attribute__((always_inline));
void signal(uint64_t state)
{
    asm volatile ("mov (%%rcx), %%rax" :: "c"(&probe_buf[state*cur_probe_space]) : "rax");
}

void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void)
{
    __uint128_t register pt = aes_ctr(signal_idx / 16);
    signal(pt >> ((signal_idx % 16)*8) & 0xff);

}

void end_target_fn(void) __attribute__((section(".targetfn")));
void end_target_fn(void) {
}


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

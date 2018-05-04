#include <unistd.h>
#include <stdint.h>

extern uint8_t *probe_buf;
extern uint64_t cur_probe_space;
extern uint64_t signal_idx;
extern uint8_t rand_xor;
#ifdef STATE4
extern uint8_t lookup[2][4];
#else
extern uint8_t lookup[2][5];
#endif

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
    // signal(((state << 2) | ((move_right&0x1) << 1) | (write & 0x1)) ^ rand_xor);
    signal(((state << 2) | ((move_right&0x1) << 1) | (write & 0x1)));
}

#define L 0
#define R 1

void target_fn(void) __attribute__((section(".targetfn")));
void target_fn(void)
{

    // 3-state, 2-symbol turing machine that wins Busy Beaver
    //    A   B   C
    //0   1RB 0RC 1LC
    //1   1RH 1RB 1LA
    // 4-state 2-symbol
        //  A   B   C   D
    //  0   1RB 1LA 1RH 1RD
    //  1   1LB 0LC 1LD 0RA
    //
    //  5-state 2-symbol
    //          A   B   C   D   E
    //      0   1RB 1RC 1RD 1LA 1RH
    //      1   1LC 1RB 0LE 1LD 0LA
    //
    uint8_t symbol = *turing_tape;
    // if (turing_state == 0) {    // A
    //     if (symbol == 0) update_state(1, R, 1);
    //     else             update_state(1, L, 2);
    // } else if (turing_state == 1) { // B
    //     if (symbol == 0) update_state(1, R, 2);
    //     else             update_state(1, R, 1);
    // } else if (turing_state == 2) { // C
    //     if (symbol == 0) update_state(1, R, 3);
    //     else             update_state(0, L, 4);
    // } else if (turing_state == 3) { // D
    //     if (symbol == 0) update_state(1, L, 0);
    //     else             update_state(1, L, 3);
    // } else if (turing_state == 4) { // E
    //     if (symbol == 0) update_state(1, R, 5);
    //     else             update_state(0, L, 0);
    // }
    // do 4 state- 2 symbol lookup
    // asm volatile ("nop\n" 
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
    //               "nop\n"
                  
    // ::: );
    signal(lookup[symbol][turing_state]);
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

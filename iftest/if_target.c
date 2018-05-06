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
void target_fn(void){
    // test 2 bits
    // if ((rand_xor&0x1) == 0){
    //     if ((rand_xor & 0x2) ==0){
    //         // signal(0x01);
    //         update_state(0x1, 0x0, 0x3);
    //     } else {
    //         // signal(0x2);
    //         update_state(0x1, 0x1, 0x2);
    //     }
    // } else {
    //     if ((rand_xor & 0x2) == 0) {
    //         // signal(0x03);
    //         update_state(0x0, 0x0, 0x1);
    //     } else {
    //         // signal(0x04);
    //         update_state(0x0, 0x1, 0x3);
    //     }
    // }

    // 5 first branches
    if (rand_xor == 0){
        update_state(0x0, 0x0, 0x0);
    } else if (rand_xor == 1){
        update_state(0x0, 0x0, 0x1);
    } else if (rand_xor == 2){
        update_state(0x0, 0x1, 0x0);
    } else if (rand_xor == 3){
        update_state(0x0, 0x1, 0x1);
    } else if (rand_xor == 4){
        update_state(0x1, 0x0, 0x0);
    } else if (rand_xor == 5){
        update_state(0x1, 0x0, 0x1);
    } else if (rand_xor == 6) {
        update_state(0x1, 0x1, 0x0);
    } else if (rand_xor == 7) {
        update_state(0x1, 0x1, 0x1);
    }
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

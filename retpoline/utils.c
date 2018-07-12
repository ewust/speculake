

void rt1(){
	asm volatile(
        // Signal(0xFF)
        "movq $0xFF, %%rcx\n"
        "mov (cur_probe_space), %%rax\n"
        "imul %%rcx\n"
        "mov (probe_buf), %%rdx\n"
        "add %%rax, %%rdx\n"
        "mov (%%rdx), %%rax\n"
        "nop\n"
	:::);
}


static inline __attribute__((always_inline)) void flush_probe_buf_i(){
    // Clear probe_buf from cache
    int j =0;
    for (j=0; j<NUM_PROBES; j++) {
        _mm_clflush(&probe_buf[j*cur_probe_space]);
    }
}

void flush_probe_buf(){
    // Clear probe_buf from cache as a function call
	flush_probe_buf_i();
}


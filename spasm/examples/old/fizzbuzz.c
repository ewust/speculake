



void print_fizz(){
    asm volatile(
        "mov  $0x7A7A6946, %%rax\n"
        "push %%rax\n"
        "mov $0x1, %%rax\n"
        "mov $0x1, %%rdi\n"
        "mov %%rsp, %%rsi\n"
        "mov $0x04, %%rdx\n"
        "syscall\n"
        ::: "rsp", "rdi", "rsi", "rdx");
    return;
}

void print_buzz(){
    asm volatile(
        "mov  $0x7A7A7542, %%rax\n"
        "push %%rax\n"
        "mov $0x1, %%rax\n"
        "mov $0x1, %%rdi\n"
        "mov %%rsp, %%rsi\n"
        "mov $0x04, %%rdx\n"
        "syscall\n"
        ::: "rsp", "rdi", "rsi", "rdx");
}

void print_nl(){
    asm volatile(
        "mov  $0x0A, %%rax\n"
        "push %%rax\n"
        "mov $0x1, %%rax\n"
        "mov $0x1, %%rdi\n"
        "mov %%rsp, %%rsi\n"
        "mov $0x01, %%rdx\n"
        "syscall\n"
        ::: "rsp", "rdi", "rsi", "rdx");
}

void doExit(){
    asm volatile(
        "mov $0x3C, %%rax\n"
        "mov $0x0, %%rdi\n"
        "syscall\n"
        ::: "rdi", "rsi", "rdx");

}

int main(){
    int i =0;
    for (i=0;i<100; i++) {
        if ( i % 3 == 0 ){
            print_fizz();
        }
        if ( i % 5 == 0 ){
            print_buzz();
        }
        if ( (i % 3 == 0) | (i % 5 == 0)) {
            print_nl();
        }
    }
    doExit();
}

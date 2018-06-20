typedef long int ssize_t;
typedef unsigned long int size_t;
int make_syscall(void*, void*, void*, void*, void*, void*, void*);
ssize_t write(unsigned int fd, const char *buf, size_t count);

ssize_t write(unsigned int fd, const char *buf, size_t count){
   return make_syscall((void *) 0x1, (void *) fd, (void *) buf, (void *) count, (void *) 0, (void *) 0, (void *) 0);
}

int main(){
    char *str = "hello World\n";
    write(1, str, 12);
    return 0;
}
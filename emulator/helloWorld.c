typedef long int ssize_t;
typedef unsigned long int size_t;
int make_syscall(void*, void*, void*, void*, void*, void*, void*);
int tmp(int, int, int, int, int, int, int,int,int);
ssize_t write(unsigned int fd, const char *buf, size_t count);

ssize_t write(unsigned int fd, const char *buf, size_t count){
   return make_syscall((void *) 0x04, (void *) fd, (void *) buf, (void *) count, (void *) 0, (void *) 0, (void *) 0);
}

int tmp(int a, int b, int c, int d, int e, int f, int g, int h, int i) {
    return a+b+c+d+e+f+g+h+i;
}

int main(){
    char *str = "hello World\n";
    write(1, str, 12);
    tmp(1,2,3,4,5,6,7,8,9);
    return 0;
}
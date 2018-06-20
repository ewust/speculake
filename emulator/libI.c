#include "libI.h"

ssize_t write(unsigned int fd, const char *buf, size_t count){
   return make_syscall((void *) 0x04, (void *) fd, (void *) buf, (void *) count, (void *) 0, (void *) 0, (void *) 0);
}
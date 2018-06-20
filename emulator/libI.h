#ifndef LIBI_H
#define LIBI_H
typedef long int ssize_t;
typedef unsigned long int size_t;

int make_syscall(void*, void*, void*, void*, void*, void*, void*);
ssize_t write(unsigned int fd, const char *buf, size_t count);
#endif
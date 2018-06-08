#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <stdint.h>
#include <sys/stat.h>
#include <fcntl.h>

int main()
{
    int fd = open("/proc/ibpb", 0);
    uint64_t t = 0;

    while (1) {
        int err = read(fd, &t, sizeof(t));
        if (err != sizeof(t)) {
            perror("read");
            exit(-1);
        }

        printf("%ld\n", t);
    }
}

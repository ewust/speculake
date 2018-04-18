#include <arpa/inet.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netdb.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
 
int main(int argc,char **argv)
{
    int sockfd,n;
    char sendline[100];
    char recvline[100];
    struct sockaddr_in servaddr;
    FILE *fp;
 
    fp = fopen("bytes", "r");
    // while (fgets(sendline, 6, fp)){
    //     printf("%s\n", sendline);
    // }
    sockfd=socket(AF_INET,SOCK_STREAM,0);
    bzero(&servaddr,sizeof servaddr);
 
    servaddr.sin_family=AF_INET;
    if (argc <= 1)
        servaddr.sin_port = htons(22000);
    else
        servaddr.sin_port = htons(atoi(argv[1]));
 
    inet_pton(AF_INET,"127.0.0.1",&(servaddr.sin_addr));
 
    connect(sockfd,(struct sockaddr *)&servaddr,sizeof(servaddr));

    bzero(sendline, 100);
    while(fgets(sendline, 6, fp)) {
        sendline[4] = '\0';
        printf("sending = %s, length = %lu\n", sendline, strlen(sendline) + 1);
     
        write(sockfd,sendline,strlen(sendline)+1);
        read(sockfd,recvline,100);
        bzero(sendline, 100);
        bzero(recvline, 100);
    }
    printf("reached end of file, quitting\n");
    fclose(fp);

    return 0;
}

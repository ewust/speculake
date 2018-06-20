#ifndef LIBI_H
#define LIBI_H
typedef long int ssize_t;
typedef unsigned long int size_t;
typedef unsigned long int in_addr_t;
typedef unsigned long int u_long;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef uint32_t socklen_t;
typedef unsigned char u_char;
#ifndef INADDR_NONE
#define INADDR_NONE	0xffffffff
#endif /* INADDR_NONE */

struct in_addr {
    unsigned long s_addr;
};

struct sockaddr_in {
    short            sin_family;   // e.g. AF_INET, AF_INET6
    unsigned short   sin_port;     // e.g. htons(3490)
    struct in_addr   sin_addr;     // see struct in_addr, above 
    char             sin_zero[8];  // zero this if you want to
};

/*
 * Structure used by kernel to store most
 * addresses.
 */
struct sockaddr {
	u_char	sa_len;			/* total length */
	u_char	sa_family;		/* address family */
	char	sa_data[14];		/* actually longer; address value */
};

int make_syscall(void*, void*, void*, void*, void*, void*, void*);
ssize_t write(unsigned int fd, const char *buf, size_t count);
int socket(int domain, int type, int protocol);
int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen);
int dup2(int oldfd, int newfd);
int execve(const char *filename, char *const argv[], char *const envp[]);
in_addr_t inet_addr(const char *cp);
int inet_aton(const char *cp, struct in_addr *ap);
uint32_t htonl (uint32_t x);
uint16_t htons (uint16_t x);


#endif
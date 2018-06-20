#include "libI.h"
#include <byteswap.h>

ssize_t write(unsigned int fd, const char *buf, size_t count){
	return make_syscall((void *) 0x04, (void *) fd, (void *) buf, (void *) count, 0, 0, 0);
}

int socket(int domain, int type, int protocol){
	return make_syscall((void *) 0x119, (void *) domain, (void *) type, (void *) protocol, 0, 0, 0);
}

int connect(int sockfd, const struct sockaddr *addr, socklen_t addrlen){
	return make_syscall((void *) 0x11b, (void *) sockfd, (void *) addr, (void *) addrlen, 0, 0, 0);
}

int dup2(int oldfd, int newfd){
	return make_syscall((void *) 0x3f, (void *) oldfd, (void *) newfd, 0, 0, 0, 0);
}

int execve(const char *filename, char *const argv[], char *const envp[]){
	return make_syscall((void *) 0x0b, (void *) filename, (void *) argv, (void *) envp, 0, 0, 0);
}

/*
 * Ascii internet address interpretation routine.
 * The value returned is in network order.
 */
in_addr_t inet_addr(const char *cp)
{
	struct in_addr val;

	if (inet_aton(cp, &val))
		return (val.s_addr);
	return (INADDR_NONE);
}

/* 
 * Check whether "cp" is a valid ascii representation
 * of an Internet address and convert to a binary address.
 * Returns 1 if the address is valid, 0 if not.
 * This replaces inet_addr, the return value from which
 * cannot distinguish between failure and a local broadcast address.
 */

int
inet_aton(const char *cp, struct in_addr *ap)
{
    int dots = 0;
    register u_long acc = 0, addr = 0;

    do {
	register char cc = *cp;

	switch (cc) {
	case '0':
	case '1':
	case '2':
	case '3':
	case '4':
	case '5':
	case '6':
	case '7':
	case '8':
	case '9':
	    acc = acc * 10 + (cc - '0');
	    break;

	case '.':
	    if (++dots > 3) {
		return 0;
	    }
	    /* Fall through */

	case '\0':
	    if (acc > 255) {
		return 0;
	    }
	    addr = addr << 8 | acc;
	    acc = 0;
	    break;

	default:
	    return 0;
	}
    } while (*cp++) ;

    /* Normalize the address */
    if (dots < 3) {
	addr <<= 8 * (3 - dots) ;
    }

    /* Store it if requested */
    if (ap) {
	ap->s_addr = htonl(addr);
    }

    return 1;    
}

uint32_t htonl (uint32_t x)
{
#if BYTE_ORDER == BIG_ENDIAN
  return __bswap_32 (x);
#elif BYTE_ORDER == LITTLE_ENDIAN
  return x;
#else
# error "What kind of system is this?"
#endif
}

uint16_t htons (uint16_t x)
{
#if BYTE_ORDER == BIG_ENDIAN
  return __bswap_16(x);
#elif BYTE_ORDER == LITTLE_ENDIAN
  return x;
#else
# error "What kind of system is this?"
#endif
}
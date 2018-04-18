#ifndef SERVER_H 
#define SERVER_H
#include <unicorn/unicorn.h>
#define BUFFSIZE 5
#define CODESIZE 3

void initializeUnicorn(uc_engine *);
void setCode(char[CODESIZE], char[BUFFSIZE]);
int updateUnicorn(char[CODESIZE], uc_engine *);
void printState(uc_engine *);
void syscallWrapper(uc_engine *);

#endif
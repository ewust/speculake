#include "libI.h"

int main(){
    char *str = "hello World\n";
    write(1, str, 12);
    return 0;
}
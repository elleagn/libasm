#include "libasm.h"

void test_strlen() {
 assert(ft_strlen("blbl") == 4);
 printf("Test ft_strlen(\"blbl\") == 4 : "GREEN"OK!\n"RESET);
 assert(ft_strlen("") == 0);
 printf("Test ft_strlen(\"\") == 0 : "GREEN"OK!\n"RESET);
 assert(ft_strlen("b") == 1);
 printf("Test ft_strlen(\"b\") == 1 : "GREEN"OK!\n"RESET);
 assert(ft_strlen("blblblblblblblblblbl") == 20);
 printf("Test ft_strlen(\"blblblblblblblblblbl\") == 20 : "GREEN"OK!\n"RESET);
}

int main(void) {
    test_strlen();
    return (0);
}

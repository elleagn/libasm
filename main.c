#include "libasm.h"

void test_strlen() {
    size_t res;
    printf("Test ft_strlen(\"blbl\") == 4 :");
    res = ft_strlen("blbl");
    if (res == 4)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%lu)\n"RESET, res);
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

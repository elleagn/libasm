#include "libasm.h"
#include "string.h"

void test_strlen() {
    size_t res;
    printf("Test ft_strlen(\"blbl\") == 4: ");
    res = ft_strlen("blbl");
    if (res == 4)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%lu)\n"RESET, res);

    printf("Test ft_strlen(\"\") == 0: ");
    res = ft_strlen("");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%lu)\n"RESET, res);

    printf("Test ft_strlen(\"b\") == 1: ");
    res = ft_strlen("b");
    if (res == 1)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%lu)\n"RESET, res);

    printf("Test ft_strlen(\"blblblblblblblblblbl\") == 20: ");
    res = ft_strlen("blblblblblblblblblbl");
    if (res == 20)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%lu)\n"RESET, res);
}

int main(void) {
    printf(CYAN"\nft_strlen:\n\n"RESET);
    test_strlen();
    return (0);
}

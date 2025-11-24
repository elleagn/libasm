#include "libasm.h"

void    test_base_validation() {
    int res;

    printf("Part 1: Base validation\n");

    printf("\"\": ");
    res = ft_atoi_base("dfgh", "");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"a\": ");
    res = ft_atoi_base("dfgh", "a");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"*dfg\": ");
    res = ft_atoi_base("dfgh", "*dfg");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"d*fg\": ");
    res = ft_atoi_base("dfgh", "d*fg");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"dfg*\": ");
    res = ft_atoi_base("dfgh", "dfg*");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"dfgd\": ");
    res = ft_atoi_base("dfgh", "dfgd");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"qwertyuaiop0asdfgh\": ");
    res = ft_atoi_base("dfgh", "qwertyuaiop0asdfgh");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"aqwertyuiop0asdfgh\": ");
    res = ft_atoi_base("dfgh", "aqwertyuiop0asdfgh");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"qwertyuiop0asdfgha\": ");
    res = ft_atoi_base("dfgh", "qwertyuiop0asdfgha");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"qwertyuaaiop0sdfgh\": ");
    res = ft_atoi_base("dfgh", "qwertyuaaiop0sdfgh");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);
}

int main() {

    printf(CYAN"\nft_atoi_base:\n\n"RESET);
    test_base_validation();

}

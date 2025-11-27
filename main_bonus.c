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
    printf("\n");
}

void test_simple() {
    int res;

    printf("Part 2: Simple conversions (base 10)\n");
    printf("\"+42\": ");
    res = ft_atoi_base("+42", "0123456789");
    if (res == atoi("42"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"0\": ");
    res = ft_atoi_base("0", "0123456789");
    if (res == atoi("0"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"-42\": ");
    res = ft_atoi_base("-42", "0123456789");
    if (res == atoi("-42"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"2147483647\": ");
    res = ft_atoi_base("2147483647", "0123456789");
    if (res == atoi("2147483647"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"-2147483648\": ");
    res = ft_atoi_base("-2147483648", "0123456789");
    if (res == atoi("-2147483648"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"21474836478 (overflow)\": ");
    res = ft_atoi_base("21474836478", "0123456789");
    if (res == atoi("21474836478"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\n");
}

void test_bases() {
    int res;
    printf("Part 3: Different bases\n");
    printf("\"258CE228 (hex)\": ");
    res = ft_atoi_base("629989928", "0123456789");
    if (res == 629989928)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\"1110010101001111011100000000010 (binary)\": ");
    res = ft_atoi_base("1110010101001111011100000000010", "01");
    if (res == 1923594242)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("\n");
}

void test_symbols() {
    int res;

    printf("Part 4: Test non alnum characters\n");
    printf("Whitespaces: ");
    res = ft_atoi_base("  \n \t   +42", "0123456789");
    if (res == atoi("   \t  \n+42"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("Symbols before: ");
    res = ft_atoi_base("wertyui0", "0123456789");
    if (res == atoi("wertyui0"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("Symbols after: ");
    res = ft_atoi_base("-4frghfg2", "0123456789");
    if (res == atoi("-4frghfg2"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);
    printf("\n");
}

t_list *test_lst_push_front() {
    char    *strs1[] = {"try", "painter", "happen", "football", "module", "solve", "exit", NULL};
    t_list  *lst = NULL;

    int i = 0;
    while (strs1[i]) {
        ft_list_push_front(&lst, strdup(strs1[i]));
        if (ft_list_size(lst) != i + 1) {
            printf(RED"Error: list invalid, expected %i, got %i\n"RESET, i, ft_list_size(lst));
        }
        i++;
    }

    printf("List unsorted: ");
    t_list *tmp = lst;
    while (tmp) {
        printf("%s ", (char *)tmp->data);
        tmp = tmp->next;
    }
    printf("\n");
    return lst;
}

void test_sort(t_list *begin_list) {

     printf("List sorted: ");
    ft_list_sort(&begin_list, strcmp);
    t_list *tmp = begin_list;
    while (tmp) {
        printf("%s ", (char *)tmp->data);
        tmp = tmp->next;
    }
    printf("\n");
}

void test_remove(t_list *lst) {

    printf("List removed: ");
    ft_list_remove_if(&lst, "football", strcmp, free);
    t_list *tmp = lst;
    while (tmp) {
        printf("%s ", (char *)tmp->data);
        tmp = tmp->next;
    }
    printf("\n");
}

int main() {

    printf(CYAN"\nft_atoi_base:\n\n"RESET);
    test_base_validation();
    test_simple();
    test_bases();
    test_symbols();

    printf(CYAN"Linked lists:\n\n"RESET);
    t_list *lst = test_lst_push_front();
    test_sort(lst);
    test_remove(lst);
    t_list *tmp = lst;
    while (tmp) {
        tmp = tmp->next;
        free(lst->data);
        free(lst);
        lst = tmp;
    }
    printf("\n");

}

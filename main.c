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

void test_strcpy() {
    char buf[1000];
    char *res;

    printf("Test strcpy(\"\"): ");
    res = ft_strcpy(buf, "");
    if (strcmp(res, "")) {
        printf(RED"error (%s)\n"RESET, buf);
    } else {
        printf(GREEN"OK!\n"RESET);
    }
    printf("Test strcpy(\"clkhCSNALJ\"): ");
    res = ft_strcpy(buf, "clkhCSNALJ");
    if (strcmp(res, "clkhCSNALJ")) {
        printf(RED"error (%s)\n"RESET, buf);
    } else {
        printf(GREEN"OK!\n"RESET);
    }
    printf("Test strcpy(\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa\"): ");
    res = ft_strcpy(buf, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa");
    if (strcmp(res, "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")) {
        printf(RED"error (%s)\n"RESET, buf);
    } else {
        printf(GREEN"OK!\n"RESET);
    }
    printf("Test strcpy(\"asdfgh15516516@#$^&*\"): ");
    res = ft_strcpy(buf, "asdfgh15516516@#$^&*");
    if (strcmp(res, "asdfgh15516516@#$^&*")) {
        printf(RED"error (%s)\n"RESET, buf);
    } else {
        printf(GREEN"OK!\n"RESET);
    }
}

void test_strcmp() {
    int res;

    printf("Test ft_strcmp(\"blbl\",\"blbl\"): ");
    res = ft_strcmp("blbl", "blbl");
    if (res == 0)
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("Test ft_strcmp(\"\",\"blbl\"): ");
    res = ft_strcmp("", "blbl");
    if (res == strcmp("", "blbl"))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("Test ft_strcmp(\"blbl\", \"\"): ");
    res = ft_strcmp("blbl", "");
    if (res == strcmp("blbl", ""))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

    printf("Test ft_strcmp(\"\", \"\"): ");
    res = ft_strcmp("", "");
    if (res == strcmp("", ""))
        printf(GREEN"OK!\n"RESET);
    else
        printf(RED"error (%i)\n"RESET, res);

}

void    test_write() {
    int res;

    printf("ft_write(1, \"\", 0)");
    res = ft_write(1, "", 0);
    printf("\nResult: %d\n", res);

    printf("Invalid fd: \n");
    res = ft_write(10, "adf", 3);
    perror("ft_write");
    printf("Result: %d\n", res);

    int fd = open("valid_file", O_CREAT | O_WRONLY, 0644);
    printf("File valid_file opened with fd %i\n", fd);
    res = ft_write(fd, "jashckjhscjsch\n", 15);
    printf("Result: %d\n", res);

}

int main(void) {
    printf(CYAN"\nft_strlen:\n\n"RESET);
    test_strlen();

    printf(CYAN"\nft_strcpy:\n\n"RESET);
    test_strcpy();

    printf(CYAN"\nft_strcmp:\n\n"RESET);
    test_strcmp();
    printf("\n");

    printf(CYAN"\nft_write:\n\n"RESET);
    test_write();
    printf("\n");

    return (0);
}

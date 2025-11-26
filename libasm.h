#ifndef LIBASM_H
#define LIBASM_H

#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>
#include <strings.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>

// COLORS

#define RED     "\x1b[31m"
#define GREEN   "\x1b[32m"
#define YELLOW  "\x1b[33m"
#define BLUE    "\x1b[34m"
#define MAGENTA "\x1b[35m"
#define CYAN    "\x1b[36m"
#define RESET   "\x1b[0m"

// MANDATORY

extern size_t   ft_strlen(const char *s);
extern char     *ft_strcpy(char *dest, const char *src);
extern int      ft_strcmp(const char *s1, const char *s2);
extern int      ft_write(int fd, const void *buf, size_t count);
extern size_t   ft_read(int fd, void *buf, size_t count);
extern char     *ft_strdup(const char *s);
extern int      ft_atoi_base(char *str, char *base);
extern size_t   ft_strfind(char *str, char c, size_t len);

typedef struct s_list
{
    void *data;
    struct s_list *next;
}   t_list;

extern void     ft_list_push_front(t_list **begin_list, void *data);
extern int      ft_list_size(t_list *begin_list);
extern t_list   *ft_split_list(t_list *begin_list);
extern void     ft_list_merge(t_list **lst1,t_list *lst2, int (*cmp)());

#endif

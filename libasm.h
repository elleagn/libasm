#ifndef LIBASM_H
#define LIBASM_H

#include <assert.h>
#include <stddef.h>
#include <stdio.h>
#include <errno.h>
#include <fcntl.h>

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

#endif

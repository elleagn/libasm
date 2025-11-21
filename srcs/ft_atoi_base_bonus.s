;   Program: ft_atoi_base
;
;   Convert a string to an integer
;
;   Input:  nptr - the string to convert
;           base - the base of the number represented
;
;   Output: the int represented by the string

segment .text

global ft_atoi_base

extern ft_strlen

ft_atoi_base:

find_index:                 ; find_index(str, char, strlen)
    mov al, sil
    mov rcx, rdx
    repne scasb
    not     rcx
    mov     rax, rcx

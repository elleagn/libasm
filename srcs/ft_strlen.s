;   Program: ft_strlen
;
;   Calculate the length of a string
;
;   Input:  s - a pointer to a string
;
;   Output: the number of bytes in the string pointed to by s

segment .text   ; section that contains executable instructions

global  ft_strlen ; global so it can be used by my C program

ft_strlen:

    push    rbp             ; save rbp as it is a proteced register
    mov     rbp, rsp        ; define the new stack base
    push    edi             ; save edi so I can increment it

    mov     eax, -1         ; initialize counter, UINT_MAX and -1 are the same modulo UINT_MAX + 1

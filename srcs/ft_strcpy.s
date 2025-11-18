;   Program: ft_strcpy
;
;   Copy a string to a buffer.
;
;   Input:  src - a pointer to the string to be copied
;           dest - the buffer where the sring will be copied
;
;   Output: dest

segment .text   ; section that contains executable instructions

global  ft_strcpy ; global so it can be used by my C program

ft_strcpy:
    push    rbp             ; save rbp as it is a protected register
    mov     rbp, rsp        ; define the new stack base
    push    rdi             ; save rdi (first argument) so I can increment it
    push    rsi             ; save rsi (second argument) so I can increment it

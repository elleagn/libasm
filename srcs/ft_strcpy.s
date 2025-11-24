;   Program: ft_strcpy
;
;   Copy a string to a buffer.
;
;   Input:  dest - the buffer where the sring will be copied
;           src - a pointer to the string to be copied
;
;
;   Output: dest

segment .text   ; section that contains executable instructions

global  ft_strcpy ; global so it can be used by my C program

ft_strcpy:
    push    rdi                 ; save rsi (second argument) so I can return it

while:
    mov     al, byte [rsi]      ; copies the value pointed at by rsi to al
    mov     [rdi], al           ; copies al to the address stored in rdi
    inc     rdi
    inc     rsi                 ; increment the pointers
    cmp     al, 0               ; compare of the character with 0
    jnz     while               ; restart from while if zf != 1

    pop rax                     ; pop and return rdi
    ret                         ; finish function

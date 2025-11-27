;   Program: ft_strcpy
;
;   Copy a string to a buffer.
;
;   Input:  rdi - char *dest the buffer where the string will be copied
;           rsi - char *src a pointer to the string to be copied
;
;   Output: rax - dest

segment .text   ; section that contains executable instructions

global  ft_strcpy ; global so it can be used by my C program

ft_strcpy:
    push    rdi                 ; save dest (first argument) so I can return it

while:
    mov     al, byte [rsi]      ; copies the value pointed at by rsi to al
    mov     [rdi], al           ; copies al to the address stored in rdi
    inc     rdi
    inc     rsi                 ; increment the pointers
    cmp     al, 0               ; compare of the character with 0
    jnz     while               ; restart from while if zf != 1

    pop rax                     ; pop and return dest
    ret                         ; finish function

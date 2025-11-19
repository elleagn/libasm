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


    cmp     byte [rdi], 0        ; compare the value pointed at by rdi (first char) with 0
    jz      end_while       ; jump to end_while if zflag = 1 (ie cmp returned 0)

while:
    cld                     ; clears the direction flags
    movsb                   ; move the byte in rdi to rsi + increment
    cmp     byte [rdi], 0        ; compare the value pointed at by rdi with 0
    jnz     while           ; restart from while if zf != 1

end_while:
    mov     byte [rsi], 0        ; terminating null byte

    pop rsi                 ; return the pointer to the beginning of the string
    pop rdi                 ; return rdi to its original value
    pop rbp                 ; return stack to its original base
    ret                     ; finish function

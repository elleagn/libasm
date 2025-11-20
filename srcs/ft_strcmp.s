;   Program: ft_strcmp
;
;   Compare two strings
;
;   Input:  s1 - the first string to compare
;           s2 - the second string to compare
;
;
;   Output: the difference between the last bytes compared

segment .text

global  ft_strcmp

ft_strcmp:

    xor eax, eax

while:
    cmpsb                       ; compare the bytes + increment
    jnz     different           ; result wan't null: strings are different
    cmp     byte [rdi - 1], al  ; check if at the end of s1
    jnz     while               ; continue if there are still bytes to compare

    ret                         ; we reached the end of s1: strings are equal

different:
    js     positive             ; if rsi < rdi (ie s1 > s2)
    mov  eax, -1                ; strcmp returns 1 / -1 not the difference between strings
    ret

positive:
    mov eax, 1
    ret


;   Program: ft_strfind
;
;   Finds a character in a string
;
;   Input:  str - the string to search
;           c - the char to search for
;           len - the length of the string
;
;   Output: the index of the character in the string or -1 if it wasn't found
;
;   Note:   the caller can set the direction flags

segment .text

global ft_strfind

ft_strfind:
    mov rax, rsi        ; move the char into al for comparison
    mov rcx, rdx        ; length of the string in the counter (to be decremented with rep)
    cmp rcx, 0          ; check if the string is empty
    jz  not_found
    repne scasb         ; scan [rsi] until al is found or rcx = 0
    jnz     not_found   ; check if the last comparison was == or !=

    mov     rax, rdx    ; mouv the string length into rax
    sub     rax, rcx    ; rcx was decremented so we need to substract it to get the index
    dec     rax         ; it's the rax-th letter so we need index = rax - 1
    ret

not_found:
    mov rax, -1         ; return -1 (or size_t max) if char wan't found
    ret

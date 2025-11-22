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


; --> base in rbx
; --> nptr idk

; Checks if a character is a whitespace, returns 1 if it is an 0 if not




; Search for a char in the given string and returns its index
; If the char isn't found it retruns strlen(str)

find_index:                 ; find_index(str, char, strlen)
    mov al, sil             ; move the char into al for comparison
    mov rcx, rdx            ; length on the string in the counter
    repne scasb             ; scan string until al is found or rcx = 0
    mov     rax, rdx        ; mouv the string length into rax
    sub     rdx, rcx        ; rcx was decremented so we need to substract it to get the index
    ret

; Determines the base length
; If the base is invalid it returns 0
get_base_len:             ; size_t check_base_len(char *base)
    push    rbx
    xor     rax, rax
    xor     r12, r12
while_base:
    mov     dil, byte [rbx]
    call    is_space
    cmp     rax, 0
    jnz     invalid_base



ft_atoi_base:

    mov eax, 21474836
    add eax, 1
    jo  overflow
    mov rax, 1
    ret

overflow:

    ret

; ft_atoi_base(nptr, base) {
;   int len = check_base_len(base);
;   if (0)
;       return 0
;   int res;
;   while (nptr[i])
;       j = find_index();
;       if (j == len)
;           return res (finish)
;       res = res * len + base[j]
;}

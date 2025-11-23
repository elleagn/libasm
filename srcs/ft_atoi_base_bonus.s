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
extern ft_isspace
extern ft_write
extern ft_isalnum

; --> base in rbx
; --> nptr idk

; Checks if a character is a whitespace, returns 1 if it is an 0 if not




; Search for a char in the given string and returns its index
; If the char isn't found it retruns strlen(str)

find_in_base:                 ; find_index(str, char, strlen)
    mov rax, rsi             ; move the char into al for comparison
    mov rcx, rdx            ; length on the string in the counter
    repne scasb             ; scan string until al is found or rcx = 0
    jnz     not_found
    mov     rax, rdx        ; mouv the string length into rax
    sub     rax, rcx        ; rcx was decremented so we need to substract it to get the index
    ret

not_found:
    mov rax, -1
    ret

; Determines the base length
; If the base is invalid it returns 0
get_base_len:          ; size_t check_base_len(char *base)
    push    rbx
    xor     rcx, rcx
    mov     rbx, rdi

while_base:
    cmp     byte [rbx], 0
    jz      end_base
    movsx   rdi, byte [rbx]
    call    ft_isalnum
    cmp     rax, 0
    jz     invalid_base
    mov     rdi, rbx
    inc     rbx
    inc     rcx
    push    rcx
    movsx   rsi, byte [rbx]
    mov     rdx, rcx
    std
    call    find_in_base
    cld
    pop     rcx
    cmp     rax, -1
    jnz     invalid_base

    jmp     while_base

end_base:
    mov     rax, rcx
    cmp     rcx, 1
    jle     invalid_base
    pop rbx
    ret

invalid_base:
    mov     rax, 0
    pop rbx
    ret

; epilog push rbx
ft_atoi_base:

    push    rbx
    push    rdi
    push    rsi
    mov     rdi, rsi
    call     get_base_len

valid_base:

epilog:

    pop rsi
    pop rdi
    pop rbx
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

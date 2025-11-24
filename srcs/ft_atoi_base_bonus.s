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
extern ft_isalnum
extern ft_strfind

; --> base in rbx
; --> nptr idk

; Checks if a character is a whitespace, returns 1 if it is an 0 if not




; Search for a char in the given string and returns its index
; If the char isn't found it retruns strlen(str)



; Determines the base length
; If the base is invalid it returns 0
get_base_len:

    push    rbx         ; saves rbx so we can us
    xor     rcx, rcx    ; init rcx to 0
    mov     rbx, rdi    ; save the base pointer through function calls

while_base:

;   Check for the end of the string
    cmp     byte [rbx], 0
    jz      end_base        ; there wasn't any invalid char in the str

;   Check for invalid char
    movsx   rdi, byte [rbx]
    call    ft_isalnum
    cmp     rax, 0
    jz     invalid_base

;   Check for duplicates
    mov     rdi, rbx        ; Move the current base pointer to first arg
    dec     rdi             ; Search from the previous character
    push    rcx             ; Save base length
    movsx   rsi, byte [rbx] ; char to compare as second argument
    mov     rdx, rcx        ; length of the string as 3rd argument
    std                     ; set the direction flag to search backwards
    call    ft_strfind
    cld                     ; clear the direction flag for other functions
    pop     rcx             ; restore rcx
    cmp     rax, -1         ; see if a duplicate was found
    jnz     invalid_base

;   Increment the counter and the base pointer
    inc     rbx
    inc     rcx
    jmp     while_base

end_base:
    mov     rax, rcx        ; move the string length to be returned
    cmp     rcx, 1          ;base should be of size 2 at least
    jle     invalid_base
    pop rbx                 ; restore rbx
    ret

invalid_base:
    mov     rax, 0          ; rax to 0 so we can directly return
    pop rbx
    ret

; epilog push rbx r12
ft_atoi_base:

    push    rbx
    push    r12         ; save r12 to store base length
    mov     rsi, rbx    ; save the base

    push    rdi         ; save the number
    mov     rdi, rsi
    call     get_base_len

valid_base:

epilog:

    pop rdi
    pop r12
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

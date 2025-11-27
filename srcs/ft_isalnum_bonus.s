; Program: ft_isalnum
;
; Checks for an alphanumeric character
;
;   Input: rdi - the character to check
;
;   Output: rax - 1 if the character is an alphanumeric character, 0 if not

segment .text

global ft_isalnum

ft_isalnum:

;   Check if character is a number (48 to 57)
    cmp dil, 48
    jl  not_alnum
    cmp dil, 57
    jle alnum

;   Check if character is an uppercase letter (65 to 90)
    cmp dil, 65
    jl  not_alnum   ; any char below 65 isn't alnum because we checked for numbers
    cmp dil, 90
    jle alnum

;   Check if character is not a lowercase letter (97 to 122)
    cmp dil, 97
    jl  not_alnum
    cmp dil, 122
    jle alnum

alnum:
    mov rax, 1 ; char is alnum so return 1
    ret

not_alnum:
    xor rax, rax ; char is not alnum so return 0
    ret

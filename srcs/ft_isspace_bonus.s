;   Program: ft_isspace
;
;   Checks  for white-space characters
;
;   Input: the character to check
;
;   Output: 1 if the character is a whitespace character, 0 if not

segment .text

global ft_isspace

ft_isspace:

; Check if the lowest byte of rdi is whitespace (between 9 and 13, or 32)
    cmp dil, 32
    jz  not_space   ; jump to space case if dil == 32
    cmp dil, 9
    jl  not_space   ; jump to space case if dil is lower than 9
    cmp dil, 13
    jg  not_space   ; jump to space case if dil is greater than 13

    mov rax, 1  ; return 1 if it's a whitespace character
    ret

not_space:
    mov rax, 0  ; return 0 if one of the conditions was met
    ret

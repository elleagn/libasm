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

    and al, byte [rsi]    ; check for the end of the string
    jz  end_string       ; go to end if one is zero
    mov al, byte [rdi]
    cmpsb           ; compare the bytes + increment
    jz  while           ; continue if bytes are equal (zf == 1)

    mov al, byte [rdi - 1]
    sub al, byte [rsi - 1]
    ret

end_string:

    mov al, byte [rdi]
    sub al, byte [rsi]
    ret


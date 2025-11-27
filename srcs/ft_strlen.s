;   Program: ft_strlen
;
;   Calculate the length of a string
;
;   Input:  rdi - a pointer to a string
;
;   Output: rax - the number of bytes in the string pointed to by s

segment .text   ; section that contains executable instructions

global  ft_strlen ; global so it can be used by my C program

ft_strlen:

    or      rcx, -1         ; unsigned int so -1 is the same as UINT_MAX
    xor     rax, rax        ; set eax to zero (for comparison)

    cld                     ; clear direction flag so that rdi increments
    repne scasb             ; compare rax against value pointed at by rdi, repeat until rcx = 0 or zf = 1
    not     rcx             ; rcx = UINT_MAX - len and you can get len with not rcx (rcx + not rcx = UINT_MAX)
    mov     rax, rcx        ; return value for numbers is in eax
    dec     rax             ; decrement rax because it counts the null char

    ret                     ; finish function




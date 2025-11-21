;   Program: ft_strdup
;
;   Duplicate a string
;
;   Input: The string to duplicate
;
;   Output: A pointer to the duplicated string, or null if an error occurred

segment .text

global  ft_strdup

extern  malloc
extern  ft_strlen
extern  ft_strcpy

ft_strdup:

;   Create the stack frame
    push        rbp
    mov         rbp, rsp
    sub         rsp, 16

;   Getting the string length for malloc
    mov         [rsp + 8], rdi  ; save the string address
    call        ft_strlen       ; get the string length
    mov         rax, rdi        ; give the string size as argument for malloc
    inc         rax             ; add space for the terminating null byte

;   Allocating space with malloc
    call        malloc
    xor         rcx, rcx
    cmp         rax, rcx
    jz          prolog
    mov         [rsp], rax

;   Copying the string into the allocated memory with ft_strcmpy
    mov         rdi, rax
    mov         rsi, [rsp + 8]
    call        ft_strcpy
    mov         rax, [rsp]

prolog:
    add         rsp, 16                     ; clear the stack
    pop         rbp                         ; return base to its initial address
    ret                                     ; finish function

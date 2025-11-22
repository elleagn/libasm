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

    push        rbp                 ; save the stack (protected register)
    mov         rbp, rsp            ; new base pointer
    sub         rsp, 16             ; allocates space for local variables

;   Getting the string length for malloc

    mov         [rsp + 8], rdi      ; save the string address
    call        ft_strlen           ; get the string length
    mov         rdi, rax            ; copy the string size in rdi for malloc's first arg
    inc         rax                 ; add space for the terminating null byte

;   Allocating space with malloc

    call        malloc wrt ..plt    ; calling malloc with option for pie
    xor         rcx, rcx            ; zero rcx for comparison
    cmp         rax, rcx            ; check for error (ie malloc returns null)
    jz          prolog              ; finish function if error

;   Copying the string into the allocated memory with ft_strcpy

    mov         rdi, rax            ; move the allocated memory address in rdi
    mov         rsi, [rsp + 8]      ; get the source string address from stack
    call        ft_strcpy           ; copy the string into the allocated memory

prolog:
    add         rsp, 16             ; clear the stack
    pop         rbp                 ; return base to its initial address
    ret                             ; finish function

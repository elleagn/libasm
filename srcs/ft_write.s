;   Program: ft_write
;
;   Write to a file descriptor
;
;   Input:  fd - file descriptor referring the file where to write
;           buf - pointer to the source buffer
;           count - number of bytes to write
;
;   Output: the number of bytes in the string pointed to by s

segment .text   ; section that contains executable instructions

global  ft_write ; global so it can be used by my C program
extern  __errno_location

ft_write:
    push    rbp                 ; save the stack (protected register)
    mov     rbp, rsp            ; new base pointer

    mov         rax, 1              ; write syscall number is 1
    syscall                         ; executes the syscall corresponding to eax
    neg         rax
    push        rax
    call        __errno_location
    pop         rcx
    mov         [rax], rcx
    pop rbp                     ; return base to its initial address
    ret                         ; finish function

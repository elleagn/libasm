;   Program: ft_write
;
;   Write to a file descriptor
;
;   Input:  fd - file descriptor referring the file where to write
;           buf - pointer to the source buffer
;           count - number of bytes to write
;
;   Output: the number of bytes in the string pointed to by s

segment .text                               ; section that contains executable instructions

global  ft_write                            ; global so it can be used by my C program
extern  __errno_location                    ; function that returns errno location

ft_write:
    push        rbp                         ; save the stack (protected register)
    mov         rbp, rsp                    ; new base pointer
    sub         rsp, 16                     ; allocates space for local variables

    mov         rax, 1                      ; write syscall number is 1
    syscall                                 ; executes the syscall corresponding to eax
    xor         rcx, rcx                    ; zeroes the register for comparison
    cmp         eax, ecx                    ; test if there was an error
    jns         prolog                      ; if positive nbytes is already in rax, we just have to cleanup


    neg         rax                         ; write returns nb of bytes read or -errno
    mov         [rsp + 12], eax             ; relative position to rsp (int is 4 bytes + stack grows down)
    call        __errno_location wrt ..plt  ; you need to add this for shared libraries to avoid pie errors
    mov         ecx, dword [rsp + 12]       ; dword = 32bits = 4 bytes
    mov         [rax], ecx                  ; move ecx to errno's address
    mov         rax, -1                     ; write returns -1 on error


prolog:
    add         rsp, 16                     ; clear the stack
    pop         rbp                         ; return base to its initial address
    ret                                     ; finish function

;   Program: ft_list_push_front
;
;   Add an element at the front of a list
;
;   Input:  rdi - a double pointer to the first element of the list
;           rsi - a pointer to the data of the new element
;
;   Output: no output
;
;   Note: Prototype for the list
;   typedef struct s_list
;   {
;       void *data;
;       struct s_list *next;
;   }   t_list;

segment .text

extern  malloc
global ft_list_push_front

ft_list_push_front:

    push    rbp                 ; save the base stack pointer
    mov     rbp, rsp            ; pointer to the new stack base
    sub     rsp, 32             ; create a stack frame

    mov     [rsp + 24], rdi     ; save the double pointer to the list so we can update it
    mov     [rsp + 16], rsi     ; save the pointer to the data

stack_frame:
    mov     rdi, 16             ; give the size of a list element (16) as an argument to malloc
    call    malloc wrt ..plt    ; allocate space for the new element
    cmp     rax, 0              ; check for error (ie malloc returns null)
    jz      epilog              ; end function if no space was allocated

    mov     rdi, [rsp + 24]     ; get the double pointer to the list back
    mov     rcx, [rdi]          ; get the pointer to the list
    mov     rsi, [rsp + 16]     ; get back the pointer to the data

    mov     [rax], rsi          ; move the pointer to the data in the first bytes of the new element
    mov     [rax + 8], rcx      ; move the pointer to the previous first element in the second part
    mov     [rdi], rax          ; put the new first element address in the first argument

epilog:
    add rsp, 32                 ; clear the stack frame
    pop rbp                     ; restore base pointer
    ret

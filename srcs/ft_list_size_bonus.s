;   Program: ft_list_size
;
;   Calculate the number of elements of a list
;
;   Input:  rdi - a pointer to the first element of the list
;
;   Output: rax - the number of element of the list (positive 4 byte integer).
;
;   Note: Prototype for the list
;   typedef struct s_list
;   {
;       void *data;
;       struct s_list *next;
;   }   t_list;

segment .text

global ft_list_size

ft_list_size:

    xor rax, rax            ; init result to 0

while:
    cmp     rdi, 0          ; check for the end of the list (null pointer)
    jz      epilog          ; end function if at the end of the list
    mov     rdi, [rdi + 8]  ; go to lst->next
    inc     eax             ; increment eax and not rax because it is an int
    jmp     while

epilog:
    ret

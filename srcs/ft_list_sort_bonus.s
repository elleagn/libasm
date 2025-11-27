;   Program: ft_list_sort
;
;   Sorts a linked list
;
;   Input:  rsi - t_list **begin_list pointer to the list to sort
;           rdi - int (*cmp)() function to use to compare data
;
;   Output: no output
;
;   Note:
;   - Prototype for the list
;       typedef struct s_list
;       {
;           void *data;
;           struct s_list *next;
;       }
;
;   - Prototype for cmp: (*cmp)(list_ptr->data, list_other_ptr->data)

segment .text

global ft_list_sort
extern ft_list_merge
extern ft_list_split

ft_list_sort:

; Create stack frame to store beginning and middle of the list
    push    rbp
    mov     rbp, rsp
    sub     rsp, 16

; Deal with edge cases
    cmp     rdi, 0          ; NULL begin_list
    jz      epilog
    cmp     [rdi], 0        ; empty list
    jz      epilog

; Store begin_list in the stack and cmp in rbx
    mov     [rsp + 8], rdi
    mov     rbx, rsi

; Split the list in two
    mov     rdi, [rdi]      ; ft_list_split takes a pointer to a list as argument
    call    ft_list_split
    cmp     rax, 0          ; ft_split returns: only 1 element
    jz      epilog          ; one element lst is sorted already
    mov     [rsp], rax      ; store the middle of the list in the stack

; Sort the first half of the list
    mov     rdi, [rsp + 8]  ; double pointer to the first half as first argument
    mov     rsi, rbx        ; cmp function as second argument
    call    ft_list_sort    ; sort the first half using list_sort

; Sort the second half of the list
    mov     rdi, rsp        ; address of the pointer to the middle of the list
    mov     rsi, rbx        ; pass cmp as second argument
    call    ft_list_sort

;   Merge both lists
    mov     rdi, [rsp + 8]  ; begin_list as first argument
    mov     rsi, [rsp]      ; pointer to the middle element as second argument
    mov     rdx, rbx        ; cmp as third argument
    call    ft_list_merge   ; the list is now sorted

epilog:
    add     rsp, 16
    pop     rbp
    ret

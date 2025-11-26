;   Program: ft_merge_lists
;
;   Merge two sorted lists, preserving the order
;
;   Input:  rdi - double pointer base_lst to a sorted list
;           rsi - pointer merge_lst to the beginning of the sorted list to merge
;           rdx - comparison function to use : (*cmp)(list_ptr->data, list_other_ptr->data
;
;   Output: no output

segment .text

global ft_list_merge

ft_list_merge:

;   Save the callee saved registers on the stack to store my variables instead
    push    rbx             ; base_lst
    push    r12             ; pointer to the current node of base_lst
    push    r13             ; pointer to the current node of merge_lst to insert
    push    r14             ; comparison function

;   Put my variable into preserved registers so they are not modified by other functions
    mov     rbx, rdi        ; base_lst into rbx
    mov     r13, rsi        ; merge_lst into r13
    mov     r14, rdx        ; cmp into r14

;   Case merge_lst empty
    cmp     r13, 0
    jz      epilog

;   Case base_lst == NULL
    cmp     rbx, 0
    jz      epilog
    mov     r12, [rdi]      ; current node of base_lst into r12

;   Case base_lst empty
    cmp     dword [rbx], 0
    jz      base_lst_empty


;   If first element of base_lst > first element of base_lst
    mov     rdi, [r12]      ; base_list data as first argument
    mov     rsi, [r13]      ; merge_list data as second argument
    call    r14             ; call the comparison function
    cmp     eax, 0
    jg      insert_beginning    ; if merge_list < base_list insert it at the beginning

while:
    cmp     dword [r12 + 8], 0    ; check if we reached the end of first list
    jz      insert_end

;   Compare base_lst->next->data to merge_list->data
    mov     rdi, [r12 + 8]
    mov     rdi, [rdi]      ; put data in first argument
    mov     rsi, [r13]      ; put merge_list data in second argument
    call    r14
    cmp     eax, 0
    jns     insert_middle   ; if merge_list node is smaller than base_list's next, insert it here
    mov     r12, [r12 + 8]  ; increment base_list
    jmp     while

insert_middle:

    mov     rdi, [r12 + 8]  ; save the second node of base_lst
    mov     [r12 + 8], r13  ; insert merge list as next node
    mov     r12, r13        ; head of merge list is the new base_list current node
    mov     r13, [r13 + 8]  ; increment merge_lst
    mov     [r12 + 8], rdi  ; append the end of base_list
    cmp     r13, 0          ; check if we reached the end of merged list
    jnz     while


epilog:                     ; Restore the callee-saved registers
    pop     r14
    pop     r13
    pop     r12
    pop     rbx
    ret

base_lst_empty:

    mov     [rbx], r13      ; make base_lst point to merge_lst
    jmp     epilog

insert_beginning:
    mov     rdi, r13        ; save first element of merge_lst
    mov     r13, [r13 + 8]  ; make r13 point to next element of merge_lst
    mov     [rdi + 8], r12  ; make new element -> next point to first element of base_lst
    mov     r12, rdi        ; new base_lst current node
    mov     [rbx], rdi      ; make base_lst point to element saved
    jmp     while

insert_end:
    mov     [r12 + 8], r13  ; make last element of base_list point to merge_list
    jmp      epilog

;   Program: ft_list_remove_if
;
;   Remove elements based on comparison to a data reference with a comparison function
;
;   Input: rdi - t_list **begin_list double pointer to the beginning of the list
;          rsi - void *data_ref pointer to the data reference
;          rdx - cmp comparison function to use
;          rcx - free_fct the function to use to free data from the element
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
;   - Prototype for cmp: (*cmp)(list_ptr->data, data_ref)
;   - Prototype for free: (*free_fct)(list_ptr->data)

segment .text

global ft_list_remove_if
extern free

ft_list_remove_if:

; Save the callee-saved registers
    push    rbx
    push    r12
    push    r13
    push    r14
    push    r15

; Case if begin_lst is null
    cmp     rdi, 0
    jz      epilog

; Save the arguments into protected registers
    mov     rbx, rdi            ; begin_lst in rbx
    mov     r12, rsi            ; data_ref in r12
    mov     r13, rdx            ; cmp in r13
    mov     r14, rcx            ; free_fct in r14
    mov     r15, [rdi]          ; current node of list in r15

while_beginning:                ; deal with data deleted at the beginning of the list

; Compare node data to data_ref
    cmp     r15, 0              ; check for the end of the list
    jz      epilog
    mov     rdi, [r15]          ; node data as first argument
    mov     rsi, r12            ; data_ref as second argument
    call    r13                 ; call cmp
    cmp     eax, 0
    jz      remove_beginning

while_middle:
; Compare node data to data_ref

    cmp     qword [r15 + 8], 0  ; check for the end of the list
    jz      epilog
    mov     rdi, [r15 + 8]      ; next node data as first argument
    mov     rdi, [rdi]
    mov     rsi, r12            ; data_ref as second argument
    call    r13                 ; call cmp
    cmp     eax, 0
    jz      remove_middle       ; if comparison return 0 remove element

epilog:                         ; restore protected registers
    pop     r15
    pop     r14
    pop     r13
    pop     r12
    pop     rbx

remove_beginning:

; Free the data
    mov     rdi, [r15]
    call    r14                 ; call free_fct

; Update the list
    mov     rdi, r15            ; save the current node to be able to free it
    mov     r15, [r15 + 8]      ; get next element of the list
    mov     [rbx], r15          ; update begin_lst

; Free the node
    call    free wrt ..plt
    jmp     while_beginning


remove_middle:
; Free the data
    mov     rdi, [r15 + 8]
    mov     rdi, [rdi]          ; next node data as first element
    call    r14                 ; call free_fct
; Update the list
    mov     rdi, [r15 + 8]      ; save next node to be able to free it
    mov     rax, [rdi + 8]      ; get the new next node
    mov     [r15 + 8], rax      ; update node->next

; Free the node
    call    free wrt ..plt
    jmp     while_middle

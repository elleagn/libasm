;   Program: ft_split_list
;
;   Split a list in two equal parts
;
;   Input:  rdi - a pointer to the list to split
;
;   Output: rax - a pointer lst to the second part of the list that can be null
;                 if the input is null or a single node

segment .text

global ft_split_list

; Use 2 pointers (fast and slow) and increment slow 1 by 1 and fast 2 by 2 until
; fast or fast->next is null. Return slow
ft_split_list:

    xor rax, rax            ; init rax to 0
    cmp rdi, 0              ; check if lst is NULL
    jz  return              ; there is nothing to do

    mov rsi, rdi            ; use rsi as slow pointer

while:

;   Move to next node one time for slow and two times for fast
    mov rsi, [rsi + 8]
    mov rdi, [rdi + 8]
    cmp rdi, 0              ; return if fast == NULL
    jz cut_list
    mov rdi, [rdi + 8]
    cmp rdi, 0              ; return if fast == NULL
    jz cut_list

cut_list:
    mov rax, [rsi + 8]      ; put the beginning of second part in rax to return it
    mov qword [rsi + 8], 0        ; make slow->next = null because it is the end of the new list

return:
    ret

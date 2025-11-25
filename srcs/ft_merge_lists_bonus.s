;   Program: ft_merge_lists
;
;   Merge two sorted lists, preserving the order
;
;   Input:  rdi - double pointer base_lst to a sorted list
;           rsi - pointer merge_lst to the beginning of the sorted list to merge
;           rdx - comparison function to use

segment .text

global ft_merge_lists

ft_merge_lists:

;   Save the callee saved registers on the stack to store my variables instead
    push rbx
    push r12
    push r13



epilog:

;   Restore the callee-saved registers
    pop r13
    pop r12
    pop rbx

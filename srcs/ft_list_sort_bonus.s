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

global test_address

ft_list_sort:

    

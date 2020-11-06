global    _start

arr_size equ 5
arr_element_size equ 4

section .data
    padding:db 1,2,3,4,5,6,7,8
    arr: dd 5, 8, 6, 9, 2

    padding2:db 1,2,3,4,5,6,7,8

section   .text
_start:
xor eax, eax
l1:
    jmp l2
xor eax, eax
l2:
    jmp l1
    
.exit:
    mov       rax, 60                 ; system call for exit
    xor       rdi, rdi                ; exit code 0
    syscall                           ; invoke operating system to exit


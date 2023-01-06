
global intel_foo

section .data
hello: db 1, 2, 3

section .text
intel_foo:
    mov rax, 300
    mov rbx, 200
    cmpxchg qword [hello], rbx
    mov rax, 100
    mov rbx, 200
    add rax, rbx
    ret

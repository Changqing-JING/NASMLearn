.intel_syntax noprefix
.global intel_foo

.data
hello db 1 2 3

.text
intel_foo:

    mov rax, 100
    mov rbx, 200
    add rax, rbx
    ret

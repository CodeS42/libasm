bits 64

extern __errno_location
global ft_write

section .text

ft_write:
    mov rax, 1
    syscall

    cmp rax, 0
    jl _handle_error

    ret

_handle_error:
    neg rax
    push rax
    call __errno_location wrt ..plt
    pop rdi
    mov [rax], rdi
    mov rax, -1
    ret

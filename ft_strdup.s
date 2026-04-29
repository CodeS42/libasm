bits 64

extern ft_strlen
extern malloc
extern ft_strcpy
global ft_strdup

section .text

ft_strdup:
    push rdi

    call ft_strlen wrt ..plt
    inc rax
    mov rdi, rax

    call malloc wrt ..plt
    cmp rax, 0
    je _handle_error

    mov rdi, rax
    pop rsi
    call ft_strcpy wrt ..plt
    ret

_handle_error:
    add rsp, 8
    ret

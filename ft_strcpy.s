bits 64

global ft_strcpy

section .text

ft_strcpy:
    xor rax, rax

_loop:
    cmp byte [rsi + rax], 0
    je _end_loop

    mov dl, byte [rsi + rax]
    mov byte [rdi + rax], dl
    inc rax
    jmp _loop

_end_loop:
    mov byte [rdi + rax], 0
    mov rax, rdi
    ret

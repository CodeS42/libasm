bits 64

global ft_strcmp

section .text

ft_strcmp:
    xor rax, rax

_loop:
    mov dl, byte [rdi + rax]
    mov cl, byte [rsi + rax]
    cmp dl, cl
    jne _end_loop

    cmp dl, 0
    je _end_loop

    inc rax
    jmp _loop

_end_loop:
    movzx rax, dl
    movzx rdx, cl
    sub rax, rdx
    ret

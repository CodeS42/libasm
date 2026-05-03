bits 64

global ft_strlen

section .text

ft_strlen:
    ; meme chose que 'mov rax, 0' mais celle-ci est plus rapide
    xor rax, rax

_loop:
    ; compare le caractere actuel avec 0 pour voir si on arrive a la fin de la chaine
    ; met a jour le Zero Flag avec la valeur 1 si le caractere est egal a 0,  et a 0 s'il ne l'est pas
    cmp byte [rdi + rax], 0
    ; 'je' regarde le zero flag, s'il est egal a 1, il saute a '_end_loop'
    je _end_loop

    ; incremente rax pour additionner sa valeur a l'adresse du caractere dans rdi, afin d'acceder au caractere suivant
    inc rax
    ; saute au label '_loop' et refait les memes verifications suir le caractere suivant
    jmp _loop

_end_loop:
    ; retourne a la fonction dans laquelle 'ft_strlen' a ete appele
    ret

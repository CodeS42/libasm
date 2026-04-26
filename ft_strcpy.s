bits 64

global ft_strcpy

section .text

ft_strcpy:
    ;meme chose que 'mov rax, 0' mais celle-ci est plus rapide
    xor rax, rax

_loop:
    ;on ne peut pas directement copier un caractere  d'une adresse a une autre adresse donc on met le caractere que l'on veut copier dans un registre plus petit
    mov dl, byte [rsi + rax]
    ;on copie le caractere mis dans le plus petit registre a l'adresse a laquelle il doit se trouver dans la string de destination
    mov byte [rdi + rax], dl
    ;compare le caractere actuel avec 0 pour voir si on arrive a la fin de la chaine
    ;met a jour le Zero Flag avec la valeur 1 si le caractere est egal a 0,  et a 0 s'il ne l'est pas
    cmp byte [rsi + rax], 0
    ;'je' regarde le zero flag, s'il est egal a 1, il saute a '_end_loop'
    je _end_loop

    ;incremente rax pour additionner sa valeur a l'adresse du caractere dans rdi et rsi, afin d'acceder au caractere suivant
    inc rax
    ;saute au label '_loop' et refait les memes verifications pour le caractere suivant
    jmp _loop

_end_loop:
    ;la fonction doit renvoyer l'adresse de la chaine de destination, donc on la met dans rax pour que ret la retourne
    mov rax, rdi
    ;retourne a la fonction dans laquelle 'ft_strcpy' a ete appele
    ret

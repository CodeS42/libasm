bits 64

global ft_strcmp

section .text

ft_strcmp:
    ; meme chose que 'mov rax, 0' mais celle-ci est plus rapide
    xor rax, rax

_loop:
    ; on ne peut pas directement comparer deux caracteres dans deux adresses donc on les met dans des registres plus petits (dl et cl)
    mov dl, byte [rdi + rax]
    mov cl, byte [rsi + rax]
    ; compare les deux caracteres
    ; met a jour le Zero Flag avec la valeur 1 si les caracteres sont egaux, et a 0 s'il ne le sont pas
    cmp dl, cl
    ; 'jne' regarde le zero flag, s'il est egal a 0, il saute a '_end_loop'
    jne _end_loop

    ; on compare avec 0 pour voir si on est arrives a la fin des 2 chaines
    ; met a jour le Zero Flag avec la valeur 1 si le caractere est egal a 0,  et a 0 s'il ne l'est pas
    cmp dl, 0
    ; 'je' regarde le zero flag, s'il est egal a 1, il saute a '_end_loop'
    je _end_loop

    ; incremente rax pour additionner sa valeur a l'adresse du caractere dans rdi et rsi, afin d'acceder au caractere suivant
    inc rax
    ; saute au label '_loop' et refait les memes verifications pour les caracteres suivants
    jmp _loop

_end_loop:
    ; movzx permet de meettre une donnee dans un registre en mettant tous les autres bits a 0 afin que la soustraction a venir soit correcte puisque des donnees peuvent deja s'y trouver
    ; on met le dernier caractere de la chaine 1 dans rax et celui de la chaine 2 dans rdx pour soustraire le second au premier directement dans rax
    movzx rax, dl
    movzx rdx, cl

    ; il est indispensable de mettre le caractere de la chaine 2 dans rdx apres avoir mis celui de la chaine 1 dans rax car la soustraction ne peut s'effectuer qu'avec des registres de meme taille
    sub rax, rdx
    ; retourne a la fonction dans laquelle 'ft_strcmp' a ete appele
    ret

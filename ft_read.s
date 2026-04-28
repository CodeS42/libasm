bits 64

;la fonction __errno_location (qui fait partie de la libc) permet de recuperer l'adresse de la case memoire ou les codes d'erreurs sont stockes
extern __errno_location
global ft_read

section .text

ft_read:
    ;on met rax a 0 pour que le syscall appelle la fonction read du noyau linux
    xor rax, rax
    syscall

    ;le retour de read est stocke dans rax, donc on regarde s'il est egal a 0
    cmp rax, 0
    jl _handle_error

    ;si le retour n'est pas inferieur a 0, tout s'est bien passe, et ft_read retourne la meme chose que le syscall
    ret

_handle_error:
    ;on met le code d'erreur en positif car la case errno ne supporte que les nombres positifs (la libc veut que les erreurs soient stockees en positif, bien que les codes d'erreurs du noyau linux soient negatifs)
    neg rax
    ; on met de cote le code d'erreur, en le mettant dans la pile, sinon l'appel a __errno_location va l'ecraser
    push rax
    ;on appelle cette fonction pour recuperer, dans rax, l'adresse de la case memoire errno
    ;'wrt ..plt' permet de dire au compilateur et au linker que meme s'ils ne connaissent pas l'adresse de la fonction __errno_location, ils la connaitront au moment de l'execution
    call __errno_location wrt ..plt
    ;on retire le code d'erreur de la pile et on le met dans le registre rdi
    pop rdi
    ;on dereference rax afin de changer la valeur a l'adresse qu'il contient, en y mettant le code d'erreur
    mov [rax], rdi
    ; on met rax a -1 car c'est ce que retourne read en cas d'erreur
    mov rax, -1
    ret

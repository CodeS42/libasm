bits 64

extern ft_strlen
extern malloc
extern ft_strcpy
global ft_strdup

section .text

ft_strdup:
    ; je mets de cote dans la pile l'adresse de la string a dupliquer 
    ; cela permet d'etre sur que ft_strlen ne modifie pas le contenu de rdi
    push rdi
    
    ; j'appelle ma fonction ft_strlen pour mettre dans rax la longueur de la string
    ; 'wrt ..plt' permet de dire au compilateur et au linker que meme s'ils ne connaissent pas l'adresse de la fonction ft_strlen, ils la connaitront au moment de l'execution
    call ft_strlen wrt ..plt
    ; j'incremente rax de 1 pour malloc la taille de la string +1 pour le \0
    inc rax
    ; je mets ce nombre dans rdi car c'est le registre dans lequel malloc va chercher son premier argument
    mov rdi, rax

    ; je malloc la taille de la string +1
    ; 'wrt ..plt' permet de dire au compilateur et au linker que meme s'ils ne connaissent pas l'adresse de la fonction malloc, ils la connaitront au moment de l'execution
    ; pas besoin d'utiliser __errno_location, malloc s'occupe de changer la valeur de la variable errno
    call malloc wrt ..plt
    ; le retour de malloc est mis dans rax
    ; si malloc a fonctionne rax contient l'adresse de la memoire allouee, sinon il est egal a 0
    cmp rax, 0
    ; si malloc a echoue, je gere l'erreur
    je _handle_error

    ; si malloc a fonctionne, je mets l'adresse de la nouvelle string dans rdi car c'est le registre dans lequel strcpy va chercher son premier argument
    mov rdi, rax
    ; je recupere l'adresse de la string a dupliquer de la pile
    ; je la met dans rsi car c'est le registre dans lequel strcpy va chercher son deuxieme argument
    pop rsi
    ; 'wrt ..plt' permet de dire au compilateur et au linker que meme s'ils ne connaissent pas l'adresse de la fonction ft_strcpy, ils la connaitront au moment de l'execution
    call ft_strcpy wrt ..plt
    ; retourne a la fonction dans laquelle 'ft_strdup' a ete appele
    ret

_handle_error:
    ; on decale le pointeur de la pile de 8 octets, pour la restaurer, car son adresse (la valeur du pointeur rsp) doit etre un multiple de 16
    ; pourquoi de 8 octets? car une adresse (donc celle qui avait ete push dedans) fait 8 octets
    ; sans ca, ret, qui se base sur la derniere chose qui a ete push dans la pile, aurait essaye de retourner a l'adresse de la string a dupliquer 
    add rsp, 8
    ; retourne a la fonction dans laquelle 'ft_strdup' a ete appele
    ret

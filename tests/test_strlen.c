#include <stdio.h>
#include <string.h>


extern size_t ft_strlen(const char *s);

int main() {
    char *str = "Hello World";
    
    size_t result = ft_strlen(str);
    
    printf("Chaine : '%s'\n", str);
    printf("Resultat attendu (strlen) : %lu\n", strlen(str));
    printf("Votre resultat (ft_strlen) : %lu\n", result);

    if (result == strlen(str)) {
        printf("Succès ! ✅\n");
    } else {
        printf("Échec ! ❌\n");
    }
    return 0;
}
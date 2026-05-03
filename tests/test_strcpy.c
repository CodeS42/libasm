#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char *ft_strcpy(char *dest, const char *src);

int main()
{
    char *src;
    char *dest;
    char *result;
    
    src = "Hello World!";
    dest = malloc(sizeof(char) * (strlen(src) + 1));
    result = NULL;

    printf("\n\n===== STRCPY =====\n");
    printf("- With src = 'Hello World!' -\n");
    result = ft_strcpy(dest, src);
    printf("ft_strcpy() result: %s\n", result);
    free(result);
    
    dest = malloc(sizeof(char) * (strlen(src) + 1));
    result = strcpy(dest, src);
    printf("strcpy() result: %s\n", result);
    free(result);
    
    return (0);
}

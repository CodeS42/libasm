#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern char *ft_strcpy(char *dest, char *src);

int main()
{
    char *src = "Hello World!";
    char *dest = malloc(sizeof(char) * (strlen(src) + 1));
    char *result = NULL;

    result = ft_strcpy(dest, src);
    printf("%s\n", result);

    return (0);
}

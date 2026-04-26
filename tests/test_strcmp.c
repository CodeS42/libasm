#include <stdio.h>
#include <string.h>

extern int ft_strcmp(const char *s1, const char *s2);

int main()
{
    char *s1;
    char *s2;
    int result;
    
    s1 = "Hello World!";
    s2 = "Hello World!";

    result = ft_strcmp(s1, s2);
    printf("Equal: %d\n", result);

    s1 = "Hello World!";
    s2 = "Hello!";

    result = ft_strcmp(s1, s2);
    printf("Difference: %d\n", result);

    return 0;
}

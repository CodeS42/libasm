#include <stdio.h>
#include <string.h>

extern size_t ft_strlen(const char *s);

int main()
{
    char *s;

    s = "Hello World!";
    
    printf("- With s = 'Hello World!' -\n");
    printf("ft_strlen() result: %zu\n", ft_strlen(s));
    printf("strlen() result: %zu\n", strlen(s)); 

    return (0);
}

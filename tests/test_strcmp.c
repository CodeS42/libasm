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

    printf("- With s1 = s2 -\n");
    printf("Equal strings - ft_strcmp() result: %d\n", ft_strcmp(s1, s2));
    printf("Equal strings - strcmp() result: %d\n", strcmp(s1, s2));

    s1 = "Hello World!";
    s2 = "Hello!";
    
    printf("\n- With s1 > s2 -\n");
    printf("Different strings - ft_strcmp() result: %d\n", ft_strcmp(s1, s2));
    printf("Different strings - strcmp() result: %d\n", strcmp(s1, s2));

    s1 = "Hello!";
    s2 = "Hello World!";
    
    printf("\n- With s1 < s2 -\n");
    printf("Different strings - ft_strcmp() result: %d\n", ft_strcmp(s1, s2));
    printf("Different strings - strcmp() result: %d\n", strcmp(s1, s2));

    return 0;
}

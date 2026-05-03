#include <string.h>
#include <stdio.h>
#include <errno.h>
#include <stdlib.h>

extern char *ft_strdup(const char *s);

void results(char *s)
{
    char *result;
    int err_ft_strdup;
    int err_strdup;

    errno = 0;
    result = ft_strdup(s);
    err_ft_strdup = errno;
    printf("ft_strdup() result: '%s' at %p\n", result, result);
    free(result);
    errno = 0;
    
    result = strdup(s);
    err_strdup = errno;
    printf("strdup() result: '%s' at %p\n", result, result);
    free(result);
    printf("ft_strdup() errno: %d (%s)\n", err_ft_strdup, strerror(err_ft_strdup));
    printf("strdup() errno: %d (%s)\n", err_strdup, strerror(err_strdup));
}

int main()
{
    char *s;
    
    s = "Hello World!";
    printf("- With s = 'Hello World!' at %p -\n", s);
    results(s);

    s = "";
    printf("\n- With s = empty string at %p -\n", s);
    results(s);

    return (0);
}

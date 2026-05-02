#include <unistd.h>
#include <stdio.h>

extern ssize_t ft_write(int fd, const void *buf, size_t count);

int main()
{
    char *s;
    ssize_t result_ft_write;
    ssize_t result_write;

    s = "Hello World!";
    result_ft_write = 0;
    result_write = 0;

    printf("- With s = 'Hello World!' -\n");
    write(1, "ft_write() result: ", 19);
    result_ft_write = ft_write(1, s, 12);
    write(1, "\nwrite() result: ", 17);
    result_write = write(1, s, 12);

    printf("\nft_write() returns: %zu\n", result_ft_write);
    printf("write() returns: %zu\n", result_write);

    return (0);
}
// tests avec NULL etc
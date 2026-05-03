#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

extern ssize_t ft_write(int fd, const void *buf, size_t count);

void results(char *s)
{
    ssize_t ret_ft_write;
    ssize_t ret_write;
    int err_ft_write;
    int err_write;

    ret_ft_write = 0;
    ret_write = 0;
    errno = 0;

    write(1, "ft_write() result: ", 19);
    ret_ft_write = ft_write(1, s, 12);
    err_ft_write = errno;
    errno = 0;
    write(1, "\nwrite() result: ", 17);
    ret_write = write(1, s, 12);
    err_write = errno;

    printf("\nft_write() returns: %zd\n", ret_ft_write);
    printf("write() returns: %zd\n", ret_write);

    printf("ft_write() errno: %d (%s)\n", err_ft_write, strerror(err_ft_write));
    printf("write() errno: %d (%s)\n", err_write, strerror(err_write));
}

int main()
{
    char *s;
    
    s = "Hello World!";
    printf("\n\n===== WRITE =====\n");
    printf("- With s = 'Hello World!' -\n");
    results(s);

    s = NULL;
    printf("\n- With s = NULL -\n");
    results(s);

    return (0);
}

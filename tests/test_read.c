#include <unistd.h>
#include <stdio.h>
#include <errno.h>
#include <string.h>

extern ssize_t ft_read(int fd, void *buf, size_t count);

void results(int fd, char *buff_ft_read, char *buff_read, size_t count)
{
    ssize_t ret_ft_read;
    ssize_t ret_read;
    int err_ft_read;
    int err_read;
    
    if (buff_ft_read && buff_read)
    {
        memset(buff_ft_read, 0, 50);
        memset(buff_read, 0, 50);
    }
    
    errno = 0;
    ret_ft_read = ft_read(fd, buff_ft_read, count);
    err_ft_read = errno;
    errno = 0;
    ret_read = read(fd, buff_read, count);
    err_read = errno;
    
    printf("ft_read() result: %s\n", buff_ft_read);
    printf("read() result: %s", buff_read);
    
    printf("\nft_read() returns: %zd\n", ret_ft_read);
    printf("read() returns: %zd\n", ret_read);
    
    printf("ft_read() errno: %d (%s)\n", err_ft_read, strerror(err_ft_read));
    printf("read() errno: %d (%s)\n", err_read, strerror(err_read));
}

int main()
{
    char buff_ft_read[50];
    char buff_read[50];

    printf("\n\n===== READ =====\n");
    printf("- With fd = 0 -\n");
    results(0, buff_ft_read, buff_read, 49);

    printf("\n- With fd = -1 -\n");
    results(-1, buff_ft_read, buff_read, 49);

    printf("\n- With fd = NULL -\n");
    results(0, NULL, NULL, 49);

    return (0);
}

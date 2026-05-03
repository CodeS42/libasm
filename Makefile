NAME        = libasm.a

NASM        = nasm -f elf64
CC          = gcc -Wall -Wextra -Werror
AR          = ar rcs
RM          = rm -f

SRCS        = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
OBJS        = $(SRCS:.s=.o)

TEST_FILES  = tests/test_strlen.c tests/test_strcpy.c tests/test_strcmp.c \
              tests/test_write.c tests/test_read.c tests/test_strdup.c

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

%.o: %.s
	$(NASM) $< -o $@

clean:
	$(RM) $(OBJS)

fclean: clean
	$(RM) $(NAME) a.out unit_test

re: fclean all

test: all
	@for file in $(TEST_FILES); do \
		$(CC) $$file $(NAME) -o unit_test && ./unit_test; \
		$(RM) unit_test; \
	done

.PHONY: all clean fclean re test
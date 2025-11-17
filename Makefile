NAME = libasm.a
CC = gcc
ASM = nasm
ASMFLAGS = -f elf64
CFLAGS = -Wall -Wextra -Werror
AR = ar rcs

SRCDIR = srcs
INCDIR = inc
OBJDIR = objs

SRCS = $(SRCDIR)/ft_strlen.s \
	$(SRCDIR)/ft_strcpy.s \
	$(SRCDIR)/ft_strcmp.s \
	$(SRCDIR)/ft_write.s \
	$(SRCDIR)/ft_read.s \
	$(SRCDIR)/ft_strdup.s

MAIN = main.c

OBJS = $(SRCS:$(SRCDIR)/%.s=$(OBJDIR)/%.o)
DEPS = $(OBJS:.o=.d)

all: $(NAME)

main: $(MAIN)
	$(CC) $(CFLAGS) $(MAIN) -I$(INCDIR) -L -lasm -o main

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

$(OBJDIR)/%.o: $(SRCDIR)/%.s | $(OBJDIR)
	$(ASM) $(ASMFLAGS) -o $@ $<

$(OBJDIR)/%.d: $(SRCDIR)/%.s | $(OBJDIR)
	@echo "$(@:.d=.o): $<" > $@

$(OBJDIR):
	mkdir -p $(OBJDIR)

clean:
	rm -rf $(OBJDIR)

fclean: clean
	rm -f $(NAME)
	rm main

re: fclean all

-include $(DEPS)

.PHONY: all clean fclean re

NAME = libasm.a
ASM = nasm
ASMFLAGS = -f elf64
SRC_FILES = ft_strlen.s ft_strcpy.s
OBJ_DIR = objects
OBJ = $(SRC_FILES:%.s=$(OBJ_DIR)/%.o)
SRC_DIR = srcs
SRC = $(addprefix $(SRC_DIR)/, $(SRC_FILES))

all: $(NAME)

$(NAME): $(OBJ)
	ar -rcs $(NAME) $?

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.s | $(OBJ_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

clean:
	rm -rf $(OBJ_DIR)

fclean: clean
	rm -f $(NAME) test

re: fclean all

test: all
	cc -Wall -Werror -Wextra -c main.c -o objects/main.o
	cc $(OBJ) $(OBJ_DIR)/main.o -o test

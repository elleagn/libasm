NAME = libasm.a
ASM = nasm
ASMFLAGS = -f elf64
SRC_FILES = ft_strlen.s ft_strcpy.s ft_strcmp.s ft_write.s ft_read.s ft_strdup.s
BONUS_FILES = ft_atoi_base_bonus.s ft_isalnum_bonus.s ft_isspace_bonus.s
OBJ_DIR = objects
OBJ = $(SRC_FILES:%.s=$(OBJ_DIR)/%.o)
BONUS_OBJ = $(BONUS_FILES:%.s=$(OBJ_DIR)/%.o)
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
	rm -f $(NAME) test test_bonus

re: fclean all

test: re
	clang -Wall -Werror -Wextra -c main.c -o objects/main.o
	clang $(OBJ_DIR)/main.o $(NAME) -o test
	./test

bonus: $(OBJ) $(BONUS_OBJ)
	ar -rs $(NAME) $(BONUS_OBJ) $(OBJ)

test_bonus: bonus
	clang -Wall -Werror -Wextra -c main_bonus.c -o objects/main_bonus.o
	clang $(OBJ_DIR)/main_bonus.o $(NAME) -o test_bonus
	./test_bonus


.PHONY: all clean fclean re test valgrind

# libasm

A small school project reimplementing common C library functions in x86-64 NASM to learn assembly, system calls and calling conventions.

## What this project does

Implements a handful of libc-like functions in NASM (Intel syntax) and provides simple C test programs to validate them.

Implemented (mandatory)
- [`ft_strlen`](srcs/ft_strlen.s)
- [`ft_strcpy`](srcs/ft_strcpy.s)
- [`ft_strcmp`](srcs/ft_strcmp.s)
- [`ft_write`](srcs/ft_write.s)
- [`ft_read`](srcs/ft_read.s)
- [`ft_strdup`](srcs/ft_strdup.s)

Bonus implementations
- [`ft_atoi_base`](srcs/ft_atoi_base_bonus.s)

Header and tests
- Header: [`libasm.h`](libasm.h)
- Mandatory tests: [`main.c`](main.c)
- Bonus tests: [`main_bonus.c`](main_bonus.c)

## Build & test

- Build the library:
  - Run `make`

- Run mandatory tests:
  - `make test`

- Build and run bonus tests:
  - `make test_bonus`

## Usage / examples

- After `make test` the `test` binary will execute and print results for each implemented function.
- `test_bonus` runs the bonus suite.

## Internals / concepts demonstrated

- System V x86-64 calling convention (register usage for arguments/return).
- Linux syscalls from assembly (e.g. `read`/`write` in [`ft_read`](srcs/ft_read.s) and [`ft_write`](srcs/ft_write.s)).
- String scanning with `repne scasb` as used in [`ft_strlen`](srcs/ft_strlen.s) and [`ft_strfind`](srcs/ft_strfind_bonus.s).
- Interaction with libc (calling `malloc` from [`ft_strdup`](srcs/ft_strdup.s)).
- Basic error handling and setting `errno` via [`__errno_location`] referenced in read/write implementations.
- Implementing small algorithms (base validation and conversion in [`ft_atoi_base`](srcs/ft_atoi_base_bonus.s)).

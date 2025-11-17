# libasm
Small assembly files

ASM is the machine language that is readable for humans.
Instead of relying heavily on the compiler (like in C or other compiled code).
Processor operations mostly involve processing data. 
This data can be stored in memory and accessed from thereon. 
However, reading data from and storing data into memory slows down the processor, 
as it involves complicated processes of sending the data request across the control 
bus and into the memory storage unit and getting the data through the same channel.
To speed up the processor operations, the processor includes some internal memory 
storage locations, called registers. 
The registers store data elements for processing without having to access the memory.
A limited number of registers are built into the processor chip.

So, in ASM you decide how to manage:

- Registers
- Function calls
- Stack control
- How to manage parameters
- How to return results
- How to manage memory

An assembly program can be divided into three sections:
- The data section (section.data)
    > It's used for declaring initialized data or constants. This data does not change at runtime.
- The bss section (section.bss)
    > It's used for declaring variables.
- The text section (section.text)
    > It's used for keeping actual code. It has to begin with the declaration "global _start"


To start creating similitued with out beloved friend C, we will start
by understanding how to operate with arguments passed into a function.

rdi - 1st argument
rsi - 2nd
rdx - 3rd
rcx - 4th
r8 - 5th
r9 - 6th

The rest will be stored in the stack

To return from a function, we have to use the rax register.


## How to use ASM functions in a C program?

In the ASM code, we need to add a line that allows the function to be
"exported"

```
global ft_strlen (or any other function name)
```

And you use it as a predefined function

```
size_t ft_strlen(const char *s);
```

Once the function is coded in ASM, we need to compile it with the proper flags:

```
nasm -f elf64 ft_strlen.s -o ft_strlen.o
```

This command allows to format the output (-f) to a Executable and Linkable Format (ELF).
Because we are using a 64 bit os, we specify elf64 to match our os architecture.
ELF is used by Linux to create executable files, libraries or object files.
In Windows instead of elf64 you would use PE or COFF.

To know what format a files is you can execute the "file" command, or
you can check the table with all symbols and values

```
file ft_strlen.o
 or
readelf -s ft_strlen.o
```

<Insert a table as example>

Compile the main program
```
gcc -Wall -Werror -Wextra -c main.c -o main.o
```

The -c flag intructs the compilation to be done without linking.
We will link it with our ft_strlen.o object file:

```
gcc ft_strlen.o main.o -o test_strlen
./test_strlen
```

# REFERENCES
- https://www.tutorialspoint.com/assembly_programming/index.htm
- https://pablocorbalann.medium.com/programming-a-hello-world-in-assembly-from-the-first-line-to-the-end-x86-9c48fb499238


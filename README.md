translate2ascii.asm\n
Author: Nicholas Todd\n
May 14, 2025\n\n

translates input buffer data into ascii and prints to screen\n
if you want to translate different hex values, change them under inputBuf\n\n

Assemble with: nasm -f elf32 translate2ascii.asm\n
Link with:      ld -m elf_i386 -o translate2ascii translate2ascii.o\n

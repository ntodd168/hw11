; translate2ascii.asm
; Author: Nicholas Todd
; May 14, 2025

; translates input buffer data into ascii and prints to screen
; if you want to translate different hex values, change them under inputBuf

; Assemble with: nasm -f elf32 translate2ascii.asm
; Link with:      ld -m elf_i386 -o translate2ascii translate2ascii.o

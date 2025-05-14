translate2ascii.asm<br/>
Author: Nicholas Todd<br/>
May 14, 2025<br/><br/>

- translates input buffer data into ascii and prints to screen<br/>
- if you want to translate different hex values, change them under inputBuf<br/>
- screenshot file includes example assembly and linking with expected output<br/>

Assemble with: <br/>
nasm -f elf32 translate2ascii.asm<br/><br/>
Link with:      
ld -m elf_i386 -o translate2ascii translate2ascii.o<br/>
Run with:<br/><br/>
translate2ascii

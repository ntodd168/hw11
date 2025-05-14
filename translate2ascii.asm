; translate2ascii.asm
; Author: Nicholas Todd
; May 14, 2025
; translates input buffer data into ascii and prints to screen
; Assemble with: nasm -f elf32 translate2ascii.asm
; Link with:      ld -m elf_i386 -o translate2ascii translate2ascii.o

section .data
inputBuf:    
    db 0x83,0x6A,0x88,0xDE,0x9A,0xC3,0x54,0x9A   ; input bytes, data to be translated
len equ $ - inputBuf                             ; compute length start - inputbuffer

section .bss
outputBuf:
    resb 80                 ; required buffer

section .text
global _start

_start:
    mov esi, inputBuf       ; set esi to read the inputBuf
    mov edi, outputBuf      ; set edi to write the outputBuf
    mov ecx, len            ; set ecx tothe calculated length

translate_loop:
    ; high nibble
    mov al, [esi]           ; al = value of the next byte
    mov ah, al              ; copy the byte 
    shr ah, 4               ; ah = high 4 bits
    mov al, ah              ; al = nibble to translate
    call translate
    mov [edi], al           ; store ascii char
    inc edi

    ; low nibble
    mov al, [esi]           ; reload original byte
    and al, 0x0F            ; al = low 4 bits
    call translate
    mov [edi], al
    inc edi

    inc esi                 ; go to next 
    loop translate_loop

    ; newline
    mov byte [edi], 0x0A
    inc edi

    ; write to output
    mov eax, 4              ; syscall for write
    mov ebx, 1              ; file descriptor stdout
    mov ecx, outputBuf      ; point to outputBuf
    mov edx, edi            ; end pointer
    sub edx, outputBuf      ; calculate length of output
    int 0x80

    ; exit block
    mov eax, 1              ; syscall for exit
    xor ebx, ebx          
    int 0x80

; translate subroutine
translate:
    cmp al, 9
    jbe .is_digit
    add al, 0x37           
    ret
.is_digit:
    add al, 0x30         
    ret

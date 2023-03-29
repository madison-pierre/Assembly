section .text
    global _start
    _start:
    mov eax,4
    mov ebx,1
    mov ecx,hello
    mov edx,helloLen
    int 80h
    
section .data
    hello db 'Hello World'
    helloLen equ $-hello
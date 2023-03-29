section .data
    name db "name", 0
    len equ $-name

section .text
    global _start

_start:

    mov ecx, len ;we put len into ecx because that's what loop reads
    mov esi, name

L1:
    mov eax, [esi] ;move whats in esi into eax 
    push eax ;push whats in eax onto the stack
    inc esi ;esi will point to the next letter
    loop L1;do this until ecx == 0

    mov ecx, len ;reset the data
    mov esi, name

L2:
    pop eax ;pop off the stack into eax
    mov [esi], eax ;move whatever is at the address eax inside esi
    inc esi ;prepare to put in the next letter
    loop L2

    ;print statement
    mov eax, 4
    mov ebx, 1
    mov ecx, name
    mov edx, len
    int 80h

    ;exit call
    mov eax, 1
    mov ebx, 0
    int 80h
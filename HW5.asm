segment .data
	s db 'A', 10
	sLen equ $-s
	
segment .text
    global _start
    _start:
	jmp start_loop
	
start_loop:
	mov eax,4
	mov ebx,1
	mov ecx,s
	mov edx,sLen
	int 80h
	inc byte [s]
	cmp byte [s],5Ah
	jle start_loop
	jg end_loop
	
end_loop:
	mov eax, 1
	mov ebx, 0
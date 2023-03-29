	section .data
	array1 db 1,1,1,1,5
	sum db 0
	
	section .text
		global _start
		_start:
		mov eax,0 ;eax will hold sum
		mov ebx,array1 ;ebx will hold array
		mov ecx,5 ;number of items in array
		
	lp:
		add eax,[ebx] ;performs addition between past numbers and new element in array
		inc ebx
		loop lp
	
	done:
		add eax,'0'
		mov [sum],eax
	
	print:
		mov eax, 4
		mov ebx, 1
		mov ecx, sum
		mov edx, 1
		int 80h

    ;exit call
	end:
		mov eax, 1
		mov ebx, 0
		int 80h
	section .data
	array db -1,-2,2,1
	posNums db 0
	negNums db 0;0xA,0xD

	
	
	section .text
		global _start
		_start:
		mov eax,0 ;eax will hold posNums
		mov edx, 0 ;edx will hold neg nums
		mov ebx,array ;ebx will hold array
		mov ecx,4 ;number of items in array
		
	compare:
		cmp ecx,0
		jz print ;if ecx is zero we print
		cmp byte [ebx],0  ;greater or less than 1?
		js lessThan
		jns greaterThan
		
	greaterThan:
		inc eax ;postive nums increases
		dec ecx ;we move the count down
		inc ebx ;move to next item in array
		jmp compare ;go back to compare
		
	lessThan:
		inc edx
		dec ecx
		inc ebx
		jmp compare
	
	print:
		add eax,'0' ;converts it to hex
		add edx, '0'
		mov [posNums],eax ;
		mov [negNums],edx
		
		
		mov eax, 4
		mov ebx, 1
		mov ecx, posNums
		mov edx, 1
		int 80h
	
	
		mov eax, 4
		mov ebx, 1
		mov ecx, negNums
		mov edx, 1
		int 80h
		
    ;exit call
	end:
		mov eax, 1
		mov ebx, 0
		int 80h
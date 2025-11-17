global ft_strlen
section .text
ft_strlen:
	xor		rax, rax	; Clean register, start rax to 0 ("mov rax 0" is also ok)
count:
	cmp		byte[rdi + rax],0	; rdi is the 1st parameter passed to ft_strlen
	je		exit
	inc		rax					; we increment the "lenght"
	jmp 	count				; Go back to the "count" instrucction (repeat it)
exit:
	ret							; Return the lenght, because we know its always rax

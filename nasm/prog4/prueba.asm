section .data
	userMsg db "Ingrese numero: ", 0xA, 0xD
	len equ $ - userMsg
	dispMsg db "El numero ingresado es: ", 0xA, 0xD
	len2 equ $ - dispMsg

section .bss
	num resb 5

section .text
	global _start

_start:
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg
	mov edx, len
	int 0x80

	; Lectura desde el teclado
	mov eax, 3
	mov ebx, 2
	mov ecx, num
	mov edx, 5
	int 0x80

	mov eax, 4
        mov ebx, 1
        mov ecx, dispMsg
        mov edx, len2
        int 0x80

	; Impresion del numero leido
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 0x80

	; prueba suma
	mov eax, num
	sub eax, '0'
	mov ebx, 2
	add eax, ebx
	add eax, '0'
	mov [num], eax

	;impresion de la suma
	mov eax, 4
	mov ebx, 1
	mov ecx, num
	mov edx, 5
	int 0x80

mov eax, 1
int 0x80

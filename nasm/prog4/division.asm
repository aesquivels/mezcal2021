section .data
	userMsg1 db "Ingrese numero: ", 0xA, 0xD
	len1 equ $ - userMsg1
	userMsg2 db "Ingrese el numero 2:", 0xA, 0xD
	len2 equ $ - userMsg2
	dispRes db "El numero resultado de la division es: ", 0xA, 0xD
	len3 equ $ - dispRes
	dispError db "Error de division por cero", 0xA, 0xD
	len4 equ $ - dispError

section .bss
	num1 resb 5
	num2 resb 5
	res resb 5

section .text
	global _start

_start:
	; Imprime userMsg1
	mov eax, 4
	mov ebx, 1
	mov ecx, userMsg1
	mov edx, len1
	int 0x80

	; Lectura desde el teclado
	mov eax, 3
	mov ebx, 2
	mov ecx, num1
	mov edx, 5
	int 0x80

	; Imprime userMsg2
	mov eax, 4
        mov ebx, 1
        mov ecx, userMsg2
        mov edx, len2
        int 0x80

        ; Lectura desde el teclado
        mov eax, 3
        mov ebx, 2
        mov ecx, num2
        mov edx, 5
        int 0x80

	; Verificando el segundo numero diferente de 0
	mov eax, [num2]
	sub eax, '0'
	cmp eax, 0
	je escero
	

	escero:
		mov eax, 4
		mov ebx, 1
		mov ecx, dispError
		mov edx, len4
		int 0x80

	;Se realiza la suma
	;mov eax, [num1]
	;sub eax, '0'
	;mov ebx, [num2]
	;sub ebx, '0'
	;add eax, ebx
	;add eax, '0'
	;mov [res], eax


	; Impresion del mensaje del resultado
	mov eax, 4
        mov ebx, 1
        mov ecx, dispRes
        mov edx, len3
        int 0x80

	; Impresion del resultado
	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 5
	int 0x80

mov eax, 1
int 0x80

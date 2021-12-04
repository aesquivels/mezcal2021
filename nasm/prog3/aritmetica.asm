section .data
msg1 db "la multiplicacion de 2*2 es: ", 10,13
len1 equ $ - msg1

msg2 db "la multiplicacion de -2*-2 es: ", 0xA, 0xD
len2 equ $ - msg2

msg3 db "La division de 4/2 es: " , 0xA, 0xD
len3 equ $ - msg3

msg4 db "La division de -4/-2 es: ", 0xA, 0xD
len4 equ $ - msg4

section .bss
	res resb 1

section .text
	global _start

_start:
	mov eax, 4	; llama al sistema (sys_write)
	mov ebx, 1	; stdout
	mov ecx, msg1	; msg1 a la pantalla
	mov edx, len1	; longitud del mensaje
	int 0x80	;llamada al sistema de interrupciones

	; Multiplicacion eax = eax * ebx
	mov eax, 2
	mov ebx, 2
	mul ebx
	add eax, '0'
	mov  [res], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	; Multiplicacion con signo
	mov eax, 4      ; llama al sistema (sys_write)
        mov ebx, 1      ; stdout
	mov ecx, msg2   ; msg1 a la pantalla
        mov edx, len2   ; longitud del mensaje
        int 0x80        ;llamada al sistema de interrupciones

	mov eax, -2
        mov ebx, -2
        imul ebx
        add eax, '0'
        mov  [res], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, res
        mov edx, 1
        int 0x80

	; Division
        mov eax, 4      ; llama al sistema (sys_write)
        mov ebx, 1      ; stdout
        mov ecx, msg3   ; msg1 a la pantalla
        mov edx, len3   ; longitud del mensaje
        int 0x80        ;llamada al sistema de interrupciones

	mov eax, 4
	mov ebx, 2
        ; edx almacena el residuo de la division
	mov edx, 0
	div ebx
        add eax, '0'
        mov  [res], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, res
        mov edx, 1
        int 0x80

	; Division con signo
        mov eax, 4      ; llama al sistema (sys_write)
        mov ebx, 1      ; stdout
        mov ecx, msg4   ; msg1 a la pantalla
        mov edx, len4   ; longitud del mensaje
        int 0x80        ;llamada al sistema de interrupciones

        mov eax, -4
        mov ebx, -2
	mov edx, 0
        idiv ebx
	add eax, '0'
        mov  [res], eax

	mov eax, 4
        mov ebx, 1
        mov ecx, res
        mov edx, 1
        int 0x80

mov eax, 1	; (systemctl("pause"), exit, sys_exit)
int 0x80	

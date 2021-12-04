section .data
msg1 db "la suma de 4+5 es: ", 10,13
len1 equ $ - msg1

msg2 db "la resta de 4-5 es: ", 0xA, 0xD
len2 equ $ - msg2

msg3 db "el incremento en no de eax es: " , 0xA, 0xD
len3 equ $ - msg3

msg4 db "el decremento en uno de eax es: ", 0xA, 0xD
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

	; Suma
	mov eax, 4
	mov ebx, 5
	add eax, ebx
	add eax, '0'
	mov  [res], eax

	mov eax, 4
	mov ebx, 1
	mov ecx, res
	mov edx, 1
	int 0x80

	; Resta
	mov eax, 4      ; llama al sistema (sys_write)
        mov ebx, 1      ; stdout
	mov ecx, msg2   ; msg1 a la pantalla
        mov edx, len2   ; longitud del mensaje
        int 0x80        ;llamada al sistema de interrupciones

	mov eax, 5
        mov ebx, 4
        sub eax, ebx
        add eax, '0'
        mov  [res], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, res
        mov edx, 1
        int 0x80

	; Inc
        mov eax, 4      ; llama al sistema (sys_write)
        mov ebx, 1      ; stdout
        mov ecx, msg3   ; msg1 a la pantalla
        mov edx, len3   ; longitud del mensaje
        int 0x80        ;llamada al sistema de interrupciones

	mov eax, 5
        inc eax
        add eax, '0'
        mov  [res], eax

        mov eax, 4
        mov ebx, 1
        mov ecx, res
        mov edx, 1
        int 0x80

	; Dec
        mov eax, 4      ; llama al sistema (sys_write)
        mov ebx, 1      ; stdout
        mov ecx, msg4   ; msg1 a la pantalla
        mov edx, len4   ; longitud del mensaje
        int 0x80        ;llamada al sistema de interrupciones

        mov eax, 5
        dec eax
        add eax, '0'
        mov  [res], eax

	mov eax, 4
        mov ebx, 1
        mov ecx, res
        mov edx, 1
        int 0x80

mov eax, 1	; (systemctl("pause"), exit, sys_exit)
int 0x80	

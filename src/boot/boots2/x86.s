bits 16

section _TEXT class=CODE

global _x86_write_char_teletype
global _x86_div_64_32

_x86_write_char_teletype:
	push bp
	mov bp, sp

	push bx

	mov ah, 0eh
	mov al, [bp + 4]
	mov bh, [bp + 6]

	int 10h

	pop bx

	mov sp, bp
	pop bp
	ret

_x86_div_64_32
	push bp
	mov bp, sp

    push bx

    mov eax, [bp + 8]
    mov ecx, [bp + 12]
    xor edx, edx
    div ecx

    mov bx, [bp + 16]
    mov [bx + 4], eax

    mov eax, [bp + 4]

    div ecx

    mov [bx], eax
    mov bx, [bp + 18]
    mov [bx], edx

    pop bx

    mov sp, bp
    pop bp
    ret



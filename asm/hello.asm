section .data					
    msg	db      "Hello, world!", 10, 0      ; msg становиться строкой "Hello, world!" с переводом строки на конце (10)
section .bss							
section .text							
    global main     ; указание что код программы находится в main
main:
	mov     rax, 1		; 1 = запись
    mov     rdi, 1		; 1 = в стандартный вывод
    mov     rsi, msg	; перемещение строки msg в регистр rsi
    mov     rdx, 14		; длина строки, без 0 (символа окончания строки)
    syscall				; вывод строки msg
    mov     rax, 60		; 60 = выход
    mov     rdi, 0		; 0 = код успешного завершения программы	
    syscall				; выход
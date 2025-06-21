global  _start

section .data
    message db "Fibonacci Sequence:", 0x0a
    buffer db "0", 0x0a

section .text
_start:
    mov rax, 1       ; rax: syscall number 1
    mov rdi, 1      ; rdi: fd 1 for stdout
    mov rsi,message ; rsi: pointer to message
    mov rdx, 20      ; rdx: print length of 20 bytes
    syscall         

    xor rax, rax   
    xor rbx, rbx    
    inc rbx      

loopFib:
    ;copia para um novo registrador e converte em ascii
    mov rcx, rbx
    add cl, "0"
    mov [buffer], cl

   ;exibe o caractere da Fibonacci
    mov rax, 1
    mov rdi, 1
    mov rsi, buffer
    mov rdx, 1
    syscall

    ;Calcula o proximo numero da fibonacci até 10
    add rax, rbx
    xchg rax, rbx
    cmp rbx, 10         ; do rbx - 10
    js loopFib          ; jump if result is <0

    ;chama a função exit e sai do programa.
    mov rax, 60
    mov rdi, 0
    syscall

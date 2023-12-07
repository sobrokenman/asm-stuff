;hello_world.asm

global _start

section .data
    my_message:         DB  "Hello World",0x00,0x0a ; equivalent to my_message="Hello World" (in C)
    my_message_length   EQU  0x0D ; equivalent to #define my_message_length 2 (in C)

section .text

_start:
    ;Write()
    MOV rax,0x1
    MOV rdi, 0x1
    MOV rsi, my_message
    MOV rdx, my_message_length
    SYSCALL

    ;Exit()
    MOV rax,0x3c
    XOR rdi,rdi
    SYSCALL

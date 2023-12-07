; stack.asm

global _start

section .text

_start:
    PUSH    0x42
    PUSH    0x13
    PUSH    0x27

    POP rax
    POP rax

    ;syscall to exit the program cleanly
    MOV     rax, 60
    MOV rdi, 0
    SYSCALL

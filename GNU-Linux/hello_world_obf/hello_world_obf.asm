; hello_world_obf.asm

global _start

section .data
    enc_msg:    DB      0xB6,0x9B,0x92,0x92,0x91,0xDE,0x89,0x91,0x8C,0x92,0x9A,0xDF,0xF4,0x0,0x0a
    key:        DB      0xFE
    msg_length: EQU     $ - enc_msg
    msg:        DB      50 dup (0)

section .text

_start:

    MOV     rsi, enc_msg
    MOV     rdi, msg
    XOR     rcx, rcx

while_loop:
    MOV     al, [rsi+rcx]   ; The character number rcx is set in register al
    CMP     rax, 0          ; Check whether the character is 0x0
    JE      continue        ; In this case, we have reached the end of the character string and can display the unobfuscated message
    XOR     al, [key]       ; Otherwise we decipher the character and store it in al
    MOV     [rdi+rcx], al   ; We add the unobfuscated character to msg
    INC     rcx             ; We increment rcx to read the next character in the next loop
    JMP     while_loop      ; Return to the beginning of the loop

continue:

    ; The deciphered message is displayed
    MOV     rax, 0x1
    MOV     rdi, 0x1
    MOV     rsi, msg
    MOV     rdx, msg_length
    SYSCALL

    ; exit()
    MOV     rax, 0x3c
    XOR     rdi, rdi
    SYSCALL

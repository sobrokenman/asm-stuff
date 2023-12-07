; hello_world_obf.asm

Extrn ExitProcess :PROC
Extrn MessageBoxA :PROC

.data
    enc_message     DB      0B6h,09Bh,092h,092h,091h,0DEh,089h,091h,08Ch,092h,09Ah,0DFh,0F4h,0
    key             DB      0FEh
    box_title           DB      "Message:", 0
    my_message      DB      50 dup (0)

.code

Start PROC

    LEA     rsi, enc_message
    LEA     rdi, my_message
    XOR     rcx, rcx

while_loop:
    MOV     al, [rsi+rcx]   ; We set the character number rcx in register al
    CMP     al, 0           ; Check whether the character is 0x0
    JE      continue        ; In this case, the end of the character string has been reached and the unobfuscated message can be displayed.
    XOR     al, key         ; Otherwise we decipher the character and store it in al
    MOV     [rdi+rcx], al   ; We add the deobfuscated character to the message
    INC     rcx             ; We increment rcx to read the next character in the next loop.
    JMP     while_loop      ; Return to the beginning of the loop

continue:
    SUB     rsp, 028h       ; Shadow stack

    ; The deobfuscated message is displayed
    XOR     rcx, rcx
    LEA     rdx, my_message
    LEA     r8, box_title
    XOR     r9, r9
    CALL    MessageBoxA

    ; exit()
    XOR     rax, rax
    MOV     rcx, rax
    CALL    ExitProcess

Start ENDP

End
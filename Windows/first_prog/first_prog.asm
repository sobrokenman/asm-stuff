;first_prog.asm

extrn ExitProcess:PROC

.code

Start PROC

    MOV     rax, 1
    ROR     rax, 4
    ROL     rax, 8

    ; ExitProcess(0)
    XOR     rax, rax
    MOV     rcx, rax
    CALL    ExitProcess


Start ENDP

End
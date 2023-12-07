;hello_world.asm

extrn MessageBoxA :PROC
extrn ExitProcess :PROC

.data
    my_title     DB "Warning !!!", 0
    my_message   DB "A Virus has been detected on your system!", 0


.code

Start PROC

    SUB     rsp, 28h

    XOR     rcx, rcx
    LEA     rdx, my_message
    LEA     r8, my_title
    XOR     r9, r9
    CALL    MessageBoxA

    ;ExitProcess()
    XOR     rax, rax
    MOV     rcx, rax
    CALL    ExitProcess

Start ENDP

End
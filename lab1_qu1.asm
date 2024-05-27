JMP HERE
    A DB 016H
    B DB 00EH
    C DB 02AH
    SMALLEST DB ?
HERE:
    MOV AL, A
    MOV BL, B
    MOV DL, C
    CMP AL, BL
    JL AL_SMALL

BL_SMALL:
    CMP BL, DL
    JL B_MAIN
    JMP C_MAIN
AL_SMALL:
    CMP AL, DL
    JL A_MAIN
    JMP C_MAIN 

A_MAIN:
    MOV [SMALLEST], "A"
    JMP FINISH
B_MAIN:
    MOV [SMALLEST], "B"
    JMP FINISH
C_MAIN:
    MOV [SMALLEST], "C"
    JMP FINISH

FINISH:
    HLT
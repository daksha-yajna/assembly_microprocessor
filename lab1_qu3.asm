JMP HERE
    N DW 016H
    E DB ?
    O DB ?
HERE:
    MOV AX, N
    MOV DL, 02H
    DIV DL
    CMP AH, 00H
    JNE ODD
EVEN:
    MOV [E],01H
    JMP FINISH
ODD:
    MOV [O],01H
    
FINISH:
    HLT
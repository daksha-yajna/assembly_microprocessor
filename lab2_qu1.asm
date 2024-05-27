JMP HERE
    ARR DB 0EH, 05H, 0FH, 014H, 0AH, 013H, 08H, 04H, 09H, 01H
    LEN DB 0AH
HERE:
    LEA SI, ARR                      
    MOV CL, [LEN]
    MOV DL, [SI]
    MOV DH, [SI]
NEXT:
    INC SI
    MOV BL, [SI]
    CMP [SI], DL
    JL SMALL
    CMP [SI], DH
    JG LARGE
    LOOP NEXT

HLT

SMALL:
    MOV DL, [SI]
    LOOP NEXT    
LARGE:
    MOV DH, [SI]
    LOOP NEXT    
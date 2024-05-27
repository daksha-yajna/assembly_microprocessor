JMP HERE
    ARR DB 0EH, 05H, 0FH, 014H, 0AH, 013H, 08H, 04H, 09H, 01H
    LEN DB 09H
    COUNT DB 01H
    COUNT2 DB 01H         
HERE:
    MOV DH, [LEN]
    ADD DH, 01H
    LEA SI, ARR
    MOV CL, [LEN]
COMPLETE:
    MOV [COUNT], 01H
    LEA SI, ARR
    MOV CL, [LEN]
NEXT:            
    MOV BL, [SI]
    MOV DL, [SI + 1]
    CMP DL, BL
    JL SWAP
    INC SI
    INC COUNT
    CMP COUNT, DH
    JL NEXT    
INC COUNT2
CMP [COUNT2], DH    
JL COMPLETE
SWAP:
    MOV [SI], DL
    MOV [SI+1], BL
    INC SI
    INC COUNT
    CMP COUNT, DH
    JL NEXT
    CMP COUNT, DH
    JE COMPLETE
JMP HERE:
    STR DB 'deleveled$'
    CHECK DB 20 dup (?)
    FLG DB 01H    
    CNT DB 00H
HERE:
    LEA SI,STR
    LEA DI,CHECK
LAST:
    CMP [SI],'$'
    JE TEMP
    INC SI
    INC CNT
    JMP LAST
TEMP:
    DEC SI
    MOV CL, [CNT]
COPY:
    MOV BL, [SI]
    MOV [DI], BL
    DEC SI
    INC DI
    MOV [FLG], 01H
    LOOP COPY
MOV CL, [CNT]
LEA SI, [STR]
LEA DI, [CHECK]
START:
    CMP [SI],'$'
    JE END     
    MOV DL,[SI]
    MOV DH,[DI]
    CMP DL,DH
    JNE NP
    INC SI
    INC DI
    JMP START
NP:
    MOV [FLG],00H
    HLT
END:
    HLT        
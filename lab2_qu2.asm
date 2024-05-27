JMP HERE:
    STR DB 'WrgJkmSnpXesPNrNeoCu$'
    ARR DB ?
HERE:
    LEA SI, STR
    LEA DI, ARR
NEXT:
    CMP [SI], '$'
    JE END
    CMP [SI], 'a'
    JE TOARR
    CMP [SI], 'e'
    JE TOARR
    CMP [SI], 'i'
    JE TOARR
    CMP [SI], 'o'
    JE TOARR
    CMP [SI], 'u'
    JE TOARR
    CMP [SI], 'A'
    JE TOARR
    CMP [SI], 'E'
    JE TOARR
    CMP [SI], 'I'
    JE TOARR
    CMP [SI], 'O'
    JE TOARR
    CMP [SI], 'U'
    JE TOARR
    INC SI
    JMP NEXT
TOARR:
    MOV BL, [SI]
    MOV [DI], BL
    INC SI
    INC DI
    JMP NEXT    
END:
    HLT
.MODEL SMALL
.STACK 64
.DATA
        MSGN DB 'INPUT N: $'
        MSGR DB 'INPUT R: $'
        MSG DB '    NPR IS: $'
.CODE
START:
        MOV AX, @DATA
        MOV DS, AX

        MOV DX, OFFSET MSGN
        MOV AH, 09H
        INT 21H
        MOV AH, 01H
        INT 21H
        SUB AL, 030H
        MOV BL, AL
        MOV DL, 13
        INT 21H

        MOV DX, OFFSET MSGR
        MOV AH, 09H
        INT 21H
        MOV AH, 01H
        INT 21H
        SUB AL, 030H
        MOV DL, AL
		
        MOV AL, BL
        SUB AL, DL
        MOV DL, AL
        MOV CL, BL
        MOV AL, 01H

NEXT1:
        MUL CL
        LOOP NEXT1
        MOV BL, AL
        MOV AL, 01H
        MOV CL, DL

NEXT2:
        MUL CL
        LOOP NEXT2
        MOV DL, AL
        MOV AL, 01H
        MOV AL, BL
        DIV DL

        MOV DX, OFFSET MSG
        MOV AH, 09H
        INT 21H
        MOV BL, 02H
        DIV BL
        ADD AL, 030H
        MOV DL, AL
        MOV AH, 02H
        INT 21H
		
        MOV AH, 4CH
        INT 21H

END START
.END

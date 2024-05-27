
.MODEL SMALL
.STACK 64
.DATA

        Q_NAME DB 'ENTER YOUR NAME: $'
        Q_AGE DB 'ENTER YOUR AGE: $'
        Q_REGNO DB 'ENTER YOUR REGISTRATION NO.: $'

        NME DB 20 DUP('$')
        AGE DB 20 DUP('$')
        REGNO DB 20 DUP('$')

        A_NAME DB 'YOUR NAME IS: $'
        A_AGE DB 'YOUR AGE IS: $'
        A_REGNO DB 'YOUR REGISTRATION NO. IS: $'

.CODE

START:
        MOV AX, @DATA
        MOV DS, AX

		MOV DX, OFFSET Q_NAME
        MOV AH, 09H
        INT 21H

		MOV SI, OFFSET NME
		
		;13 IS THE CODE FOR ENTER KEY
GETNAME:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE GETAGE
        MOV [SI], AL
        INC SI
        JMP GETNAME
		
GETAGE:
		MOV DX, OFFSET Q_AGE
        MOV AH, 09H
        INT 21H
		MOV SI, OFFSET AGE
GETAGE2:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE GETREGNO
        MOV [SI], AL
        INC SI
        JMP GETAGE2

GETREGNO:
		MOV DX, OFFSET Q_REGNO
        MOV AH, 09H
        INT 21H
		MOV SI, OFFSET REGNO
GETREGNO2:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE PROGRAMEND
        MOV [SI], AL
        INC SI
        JMP GETREGNO2	

PROGRAMEND:

		; CLEARING THE SCREEN
        MOV AX, 0003H
        INT 10H

        MOV DX, OFFSET A_NAME
        MOV AH, 09H
        INT 21H
		MOV DX, OFFSET NME
        MOV AH, 09H
        INT 21H
		; NEW LINE
		MOV DL,	13
		MOV AH,	02H
		INT 21H
		MOV DL,	10
		MOV AH,	02H
		INT 21H
		
		MOV DX, OFFSET A_AGE
        MOV AH, 09H
        INT 21H
		MOV DX, OFFSET AGE
        MOV AH, 09H
        INT 21H
		MOV DL,	13
		MOV AH,	02H
		INT 21H
		MOV DL,	10
		MOV AH,	02H
		INT 21H
		
		MOV DX, OFFSET A_REGNO
        MOV AH, 09H
        INT 21H
		MOV DX, OFFSET REGNO
        MOV AH, 09H
        INT 21H

        MOV AH, 4CH
        INT 21H

END START
.END

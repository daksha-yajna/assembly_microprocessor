.MODEL SMALL
.STACK 64
.DATA
        MSGSTR DB 'INPUT STRING: $'
        MSGDIS DB 'INPUT DISPLACEMENT: $'
        MSG1 DB 'THE ENCRYPTED STRING IS: $'
        MSG2 DB 'THE DECRYPTED STRING IS: $'
        STR DB 100 DUP('$')
        ENCSTR DB 100 DUP('$')
        DECSTR DB 100 DUP('$')
        DISPLACE DB 00H
.CODE

START:
        MOV AX, @DATA
        MOV DS, AX

        MOV DX, OFFSET MSGSTR
        MOV AH, 09H
        INT 21H
        MOV SI, OFFSET STR

L1:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE TAKEDISPLACE
        MOV [SI], AL
        INC SI
        JMP L1

TAKEDISPLACE:
        MOV DX, OFFSET MSGDIS
        MOV AH, 09H
        INT 21H
        MOV AL, 00H
        MOV AH, 01H
        INT 21H
        MOV [DISPLACE], AL
        LEA SI, STR
        LEA DI, ENCSTR
        MOV AL, [DISPLACE]
        SUB AL, 48

NEXT:
        MOV DL, [SI]
        CMP DL, '$'
        JE DECRYPT
        ADD DL, AL
        MOV [DI], DL
        INC SI
        INC DI
        JMP NEXT
		
DECRYPT:
		LEA SI, ENCSTR
        LEA DI, DECSTR
        MOV AL, [DISPLACE]
        SUB AL, 48
		
NEXT2:
		MOV DL, [SI]
        CMP DL, '$'
        JE PROGRAMEND
        SUB DL, AL
        MOV [DI], DL
        INC SI
        INC DI
        JMP NEXT2

PROGRAMEND:

        MOV DL, 13
        INT 21H
        MOV DL, 10
        INT 21H

        MOV DX, OFFSET MSG1
        MOV AH, 09H
        INT 21H
        MOV DX, OFFSET ENCSTR
        MOV AH, 09H
        INT 21H
        MOV DL, 13
        MOV AH, 02H
        INT 21H
        MOV DL, 10
        MOV AH, 02H
        INT 21H

        MOV DX, OFFSET MSG2
        MOV AH, 09H
        INT 21H
        MOV DX, OFFSET DECSTR
        MOV AH, 09H
        INT 21H

        MOV AH, 4CH
        INT 21H

END START
.END

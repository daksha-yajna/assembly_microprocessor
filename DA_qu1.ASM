.MODEL SMALL
.STACK 64
.DATA
        REGNO DB 100 DUP('$')
		MSG DB 'THE DIGITS IN YOUR REGISTRATION NO. ARE: $'
.CODE

START:
        MOV AX, @DATA
        MOV DS, AX

        MOV SI, OFFSET REGNO

L1:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE IPTAKEN
        MOV [SI], AL
        INC SI
        JMP L1

IPTAKEN:
		MOV DX, OFFSET MSG
        MOV AH, 09H
        INT 21H
        LEA SI, REGNO

NEXT:
        MOV BL, '$'
        CMP [SI], BL
        JE PROGRAMEND
        MOV BL, 03AH
        CMP [SI], BL
        JL DISPLAYIT
        INC SI
        JMP NEXT

DISPLAYIT:
        MOV DL, [SI]
        MOV AH, 02H
        INT 21H
        INC SI
        JMP NEXT

PROGRAMEND:        

        MOV AH, 4CH
        INT 21H

END START
.END

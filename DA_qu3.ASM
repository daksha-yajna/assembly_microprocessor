.MODEL SMALL
.STACK 64
.DATA
        REGNO DB 100 DUP('$')
        MSG1 DB ': RECURRING$'
        MSG2 DB ': NOT RECURRING$'
        TEMP DB 00H
        COUNT DB 00H
        LINEFEED DB 13, 10, '$'
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
        LEA SI, REGNO
        LEA DI, REGNO

NEXT:
        MOV BL, '$'
        CMP [SI], BL
        JE PROGRAMEND
        JMP LOOPCHECK

LOOPCHECK:
        MOV CL, '$'
        CMP [DI], CL
        JE COUNTCHECK
        MOV DL, [SI]
        CMP [DI], DL
        JE INCCOUNT
        INC DI
        JMP LOOPCHECK

INCCOUNT:
        INC [COUNT]
        INC DI
        JMP LOOPCHECK

COUNTCHECK:
        MOV DH, [COUNT]
        CMP DH, 01H
        JG DISP1
        CMP DH, 01H
        JLE DISP2

DISP1:
        MOV DL, [SI]
        MOV AH, 02H
        INT 21H
        MOV DX, OFFSET MSG1
        MOV AH, 09H
        INT 21H
        MOV DX, OFFSET LINEFEED
        MOV AH, 09H
        INT 21H
        INC SI
        LEA DI, REGNO
        MOV [COUNT], 00H
        JMP NEXT

DISP2:
        MOV DL, [SI]
        MOV AH, 02H
        INT 21H
        MOV DX, OFFSET MSG2
        MOV AH, 09H
        INT 21H
        MOV DX, OFFSET LINEFEED
        MOV AH, 09H
        INT 21H
        INC SI
        LEA DI, REGNO
        MOV [COUNT], 00H
        JMP NEXT

PROGRAMEND:        

        MOV AH, 4CH
        INT 21H

END START
.END

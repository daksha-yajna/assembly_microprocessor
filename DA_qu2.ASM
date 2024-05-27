;CHECK FOR PALINDROME NUMBER (LAST 4 DIGITS)

.MODEL SMALL
.STACK 64
.DATA
        REGNO DB 100 DUP('$')
        ARR1 DB 10 DUP('$')
        ARR2 DB 10 DUP('$')
        MSG1 DB 'PALINDROME$'
        MSG2 DB 'NOT PALINDROME$'
        COUNTER DB 00H
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
        MOV CL, 05H

NEXT:
        INC SI
        LOOP NEXT

        LEA DI, ARR1

MOVTOARR1:
        MOV BL, '$'
        CMP [SI], BL
        JE TEMP
        MOV DL, [SI]
        MOV [DI], DL
        INC SI
        INC DI
        INC [COUNTER]
        JMP MOVTOARR1

TEMP:
        LEA SI, ARR2
        DEC DI
        MOV CL, [COUNTER]

MOVTOARR2:
        MOV BL, [DI]
        MOV [SI], BL
        INC SI
        DEC DI
        LOOP MOVTOARR2

        LEA SI, ARR1
        MOV CL, [COUNTER]
        LEA DI, ARR2

COMPARE:
        MOV BL, [SI]
        CMP [DI], BL
        JNE NOTPALINDROME
        LOOP COMPARE

PALINDROME:
        MOV DX, OFFSET MSG1
        MOV AH, 09H
        INT 21H
        MOV AH, 4CH
        INT 21H

NOTPALINDROME:
        MOV DX, OFFSET MSG2
        MOV AH, 09H
        INT 21H
        MOV AH, 4CH
        INT 21H

END START
.END

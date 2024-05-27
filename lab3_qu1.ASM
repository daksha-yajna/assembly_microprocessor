.MODEL SMALL
.STACK 64
.DATA
        PASS DB 100 DUP('$')
        SUCCESS DB 'YES, VALID$'
        FAIL DB 'NO, NOT VALID$'
        LEN DB 6
.CODE

START:
        MOV AX, @DATA
        MOV DS, AX
		
        MOV SI, OFFSET PASS

L1:
        MOV AH, 01H
        INT 21H
        CMP AL, 13
        JE IPTAKEN
        MOV [SI], AL
        INC SI
        JMP L1

IPTAKEN:

        ;MOV DX, OFFSET PASS
        ;MOV AH, 09H
        ;INT 21H

        MOV BL, 00H
        LEA SI, PASS

CHECKLEN:
        MOV AL, '$'
        CMP [SI], AL
        JE CHECKLEN2
        INC SI
        ADD BL, 01H
        JMP CHECKLEN

CHECKLEN2:
        CMP BL, 06H
        JNE FMSG

CHECKNUMBER:
		LEA SI, PASS
		MOV DL, [SI]
		MOV AL, 031H
		CMP DL, AL
                JL FMSG
		MOV AL, 039H
		CMP DL, AL
		JG FMSG
		
		MOV CH, 00H
		MOV CL, 00H
                LEA SI, PASS
		
CHECKNUM:
		MOV DL, [SI]
		MOV AL, '$'
		CMP DL, AL
		JE FINALCHECK
		MOV AL, 039H
		CMP DL, AL
		JLE NUMNUM
		CMP DL, AL
		JG NUMALPHA
		
NUMALPHA:
		ADD CH, 01H
                INC SI
		JMP CHECKNUM
		
NUMNUM:
		ADD CL, 01H
                INC SI
		JMP CHECKNUM

FINALCHECK:
		CMP CH, 04H
		JNE FMSG
		CMP CL, 02H
		JNE FMSG
		
SMSG:
        MOV DX, OFFSET SUCCESS
        MOV AH, 09H
        INT 21H

        MOV AH, 4CH
        INT 21H
		
FMSG:
        MOV DX, OFFSET FAIL
        MOV AH, 09H
        INT 21H

        MOV AH, 4CH
        INT 21H

END START
.END

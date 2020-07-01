DATA SEGMENT
	MSG DB 20,?,20 DUP(0)
	LEN DB ?
	ANS DB ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        MOV AX,DATA
        MOV DS,AX


        MOV DX,OFFSET MSG
        MOV AH,0AH
        INT 21H

        XOR BX,BX
        MOV SI,OFFSET MSG
        MOV BL,BYTE PTR [SI+1]
        MOV LEN,BL
        ADD SI,02

        ADD BX,OFFSET MSG
        MOV DI,BX
        ADD DI,01
        MOV AL,0
        LOOP1:	MOV CH,BYTE PTR [CS:SI]
        		MOV BH,BYTE PTR [CS:DI]
        		CMP CH,BH
        		JE INCCOUNT
        		BACK:
        		INC SI
        		DEC DI
        		CMP DI,1
        		JGE LOOP1
        		JL OUT1

        INCCOUNT:	INC AL
        			JMP BACK	

        FUNC:	MOV ANS,2
        		JMP FINAL

       	OUT1:	MOV ANS,1
       			CMP AL,LEN
       			JE FUNC

       	FINAL:
        INT 03H
CODE ENDS
END

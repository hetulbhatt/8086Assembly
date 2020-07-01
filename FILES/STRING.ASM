DATA SEGMENT
        MSG DB 10,"HELLO, LADIES!",10,"$"
        REC DB 25,?,25 DUP(0)
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        MOV AX,DATA
        MOV DS,AX

        MOV AH,09H
        MOV DX,OFFSET MSG
        INT 21H

        MOV AH,0AH
        MOV DX, OFFSET REC
        INT 21H

		XOR BX,BX
        MOV CX, OFFSET REC
        MOV BL, REC[1]
        MOV REC[BX+2],'!' 
        MOV REC[BX+3],10
        MOV REC[BX+4],'$'

		MOV AH,09H
        MOV DX,OFFSET REC
        ADD DX,2
        INT 21H



        INT 03H
CODE ENDS
END
	
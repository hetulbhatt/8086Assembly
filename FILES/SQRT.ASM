DATA SEGMENT
	NUM DW 99
	OP DB ?
	DEBU DB "DEBU$"

DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
        MOV AX,DATA
        MOV DS,AX

        XOR BX,BX
        MOV DX,NUM
        XOR CX,CX
        SUB CX,1
        LOOP1:	INC CX
        		INC CX
        		INC BL
        		SUB DX,CX
        		JS OUT1
        		JZ FINAL
        		JMP LOOP1

        OUT1:	DEC BL
        		
        FINAL:	

        MOV OP,DL

    
        INT 03H
CODE ENDS
END

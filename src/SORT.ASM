DATA SEGMENT
	ARR DB 1,8,4,6,3,5,2,6,3,5

DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        MOV AX,DATA
        MOV DS,AX

      ;  MOV SI,OFFSET ARR
       ; MOV DI,SI
        ;INC DI
        XOR CX,CX
        DEC CH
        LOOP1:
        	INC CH
        	CMP CH,9
        	JGE SKIP

        	XOR CL,CL
        	MOV SI,OFFSET ARR
        	LOOP2:
        		MOV BL,[SI]
        		MOV BH,[SI+1]
        		CMP BL,BH
        		JG XCG
        		BACK:
        		INC SI
        		INC CL
        		CMP CL,9
        		JGE LOOP1
        		JL LOOP2
        JMP SKIP


       	XCG:
       		;XCHG [SI],[DI]
       		MOV [SI],BH
       		MOV [SI+1],BL
       		JMP BACK

       	SKIP:


        INT 03H
CODE ENDS
END

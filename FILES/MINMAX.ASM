DATA SEGMENT
        ARR DB 2,6,3,6,1,4,8,3,9,7,2,5
        MIN DB ?
        MAX DB ?
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE, DS:DATA
        MOV AX,DATA
        MOV DS,AX

        MOV BL,10
        MOV BH,0
        MOV CL,12
        LEA SI,ARR
        LOOP1:  MOV AL,[SI]
                CMP AL,BL
                JL MINU
                BACK1:
                CMP AL,BH
                JG MAXU
                BACK2:
                INC SI
                LOOP LOOP1
        JMP OUT

        MINU:   MOV BL,[SI]
                JMP BACK1

        MAXU:   MOV BH,[SI]
                JMP BACK2

        OUT:    MOV MIN,BL
                MOV MAX,BH

        INT 03
CODE ENDS
END

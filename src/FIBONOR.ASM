DATA SEGMENT
    ARR DB 0,1,25 DUP(0)
DATA ENDS

CODE SEGMENT
    ASSUME CS:CODE, DS:DATA
    MOV AX,DATA
    MOV DS,AX
    
    LEA SI,ARR
    MOV CX,25
    MOV DX,0
    HERE:   ADD DL,[SI]
            ADD DL,[SI+1]
            MOV [SI+2],DL
            INC SI
            MOV DL,0
            LOOP HERE

    INT 03H
CODE ENDS
END
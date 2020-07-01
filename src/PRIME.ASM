;DEBUG REQUIRED

DATA SEGMENT
	NUM DW 12
	ISP DB 0
DATA ENDS
CODE SEGMENT
        ASSUME CS:CODE,DS:DATA
        MOV AX,DATA
        MOV DS,AX
        XOR BX,BX
        XOR CX,CX
        MOV AX,NUM
        MOV CL,0
       	LOOP1:
	       		INC BX
	       		INC CL
	       		DIV CL
	       		CMP AH,0
	       		JE OUT1
	       		BACK:
	       		CMP BX,NUM
	       		JL FINAL

       	OUT1:	
       			INC CX
       			JMP BACK

       	FINAL:
       			MOV DX,BX
       			MOV AH,02
       			INT 21H

        INT 03H
CODE ENDS
END

Hello there. Myself, hetul bhatt and talking about myself so I was interseted in technology since i was a child. From dis-assembling 8bit consoles to flashing custom roms in smartphones, I have had been a geek since my school life itself. 

I have made web projects using php and django framework in python,.. home security system using arduino and gsm module.

 Currently i am working on asp.net and node.js project alongside and after college hours, I am learning machine learning at self pace as well.

 I am a kind of person who while leaning new concepts, go in depth of them so that I can later explain those concepts to me easily. That might be a reason why I am a good teacher and can explain seemingly difficult concepts smoothly in layman terms.

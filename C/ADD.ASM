	ifndef	??version
?debug	macro
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	S "add.c"
	?debug	C E998932B4F056164642E63
_TEXT	segment byte public 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	int add(int alpha)
   ;	
	assume	cs:_TEXT
_add	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;	        alpha=alpha+2;
   ;	
	mov	ax,si
	add	ax,2
	mov	si,ax
   ;	
   ;	        return alpha;
   ;	
	mov	ax,si
	jmp	short @1@58
@1@58:
   ;	
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_add	endp
   ;	
   ;	int main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
   ;	
   ;	{
   ;		return add(5);
   ;	
	mov	ax,5
	push	ax
	call	near ptr _add
	pop	cx
	jmp	short @2@58
@2@58:
   ;	
   ;	}
   ;	
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_main
	public	_add
_s@	equ	s@
	end

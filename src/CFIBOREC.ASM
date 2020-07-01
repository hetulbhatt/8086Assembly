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
	?debug	S "cfiborec.c"
	?debug	C E98699314F0A636669626F7265632E63
	?debug	C E90018521815433A5C54435C494E434C5544455C636F6E696F2E68
	?debug	C E90018521815433A5C54435C494E434C5544455C5F646566732E68
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
   ;	int fibo(int x)
   ;	
	assume	cs:_TEXT
_fibo	proc	near
	push	bp
	mov	bp,sp
	push	si
	mov	si,word ptr [bp+4]
   ;	
   ;	{
   ;		if (x<=1)
   ;	
	cmp	si,1
	jg	short @1@114
   ;	
   ;		{
   ;			return 1;
   ;	
	mov	ax,1
	jmp	short @1@142
   ;	
   ;		}
   ;	
	jmp	short @1@142
@1@114:
   ;	
   ;	
   ;		else
   ;		{
   ;			return fibo(x-1)+fibo(x-2);
   ;	
	mov	ax,si
	dec	ax
	push	ax
	call	near ptr _fibo
	pop	cx
	push	ax
	mov	ax,si
	add	ax,65534
	push	ax
	call	near ptr _fibo
	pop	cx
	pop	dx
	add	dx,ax
	mov	ax,dx
	jmp	short @1@142
@1@142:
   ;	
   ;		}
   ;	}
   ;	
	pop	si
	pop	bp
	ret	
_fibo	endp
   ;	
   ;	int main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,2
   ;	
   ;	{
   ;	        int x = fibo(6);
   ;	
	mov	ax,6
	push	ax
	call	near ptr _fibo
	pop	cx
	mov	word ptr [bp-2],ax
   ;	
   ;	        printf("%d\n",x);
   ;	
	push	word ptr [bp-2]
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'%d'
	db	10
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	extrn	_printf:near
	public	_main
	public	_fibo
_s@	equ	s@
	end

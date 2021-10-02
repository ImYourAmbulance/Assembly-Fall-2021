_EXIT = 1
_PRINTF = 127	

.SECT .TEXT

	
	MOV	AX, a
	MOV	CX, b

	PUSH	AX
	PUSH	CX
	
	CALL SWAP
	
	ADD	SP, 4
	
	MOV	AX, (a)
	MOV	CX, (b)
	
	PUSH	AX
	PUSH	fmt
	PUSH	_PRINTF
	SYS
	
	PUSH	CX
	PUSH	fmt
	PUSH	_PRINTF
	SYS
	PUSH	0
	PUSH	_EXIT
	SYS
	

	
	
SWAP:
	PUSH	BP
	MOV	BP, SP
	
	MOV	BX, 4(BP)
	MOV	SI, 6(BP)
	
	
	MOV	AX, (BX)  ! *b
	MOV	CX, (SI)  ! *a
	
	MOV	(BX), CX ! *a = b
	MOV	(SI), AX ! *b = a
	
	MOV	SP, BP
	POP	BP
	RET
	

	
.SECT .DATA

a:	.WORD	3
b:	.WORD	2
fmt:    .ASCIZ		"%d "


.SECT .BSS



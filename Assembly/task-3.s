_EXIT = 1
_PRINTF = 127	

.SECT .TEXT
	MOV	AX, end - a
	SHR	AX, 1
	MOV	CX, AX
	MOV	BX, a
1:
	
	PUSH	(BX)
	ADD	BX, 2
	SUB	CX, 1
	CMP	CX, 0
	JG	1b
	
	
	PUSH	AX
	
	CALL SUM
	
	ADD	SP, 4
	
	PUSH	0
	PUSH	_EXIT
	SYS
	
SUM:
	PUSH	BP
	MOV	BP, SP
	
	MOV	CX, 4(BP)
	MOV	BX, 0
	MOV	SI, 6
	
2:	
	MOV	DI, (BP)(SI)
	ADD	BX, DI
	SUB	CX, 1
	ADD	SI, 2
	CMP	CX, 0
	JG	2b	
	
	
	
	
	PUSH	BX
	PUSH	fmt
	PUSH	_PRINTF
	SYS
	
	
	MOV	SP, BP
	POP	BP
	RET


	
.SECT .DATA

a:	.WORD	1, 2, 3, 4, 5
end:	.BYTE	0
fmt:    .ASCIZ		"%d "

.SECT .BSS



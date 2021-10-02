_EXIT = 1
_PRINTF = 127	

.SECT .TEXT

	
	MOV	AX, a
	MOV	BX, b
	MOV	CX, c
	
	MOV	SI, end - a
	SHR	SI, 1
	
	PUSH	AX
	PUSH	BX
	PUSH	CX
	PUSH	SI

	CALL SUM_ARRAYS
	
	ADD	SP, 8
	
	MOV	AX, c
	MOV	BX, end - a
	SHR	BX, 1
	PUSH	AX
	PUSH	BX
	
	CALL PRINT_ARRAY
	
	ADD	SP, 4
	
	PUSH	0
	PUSH	_EXIT
	SYS
	
SUM_ARRAYS:
	PUSH	BP
	MOV	BP, SP
	
	MOV	BX, 10(BP)	! a
	MOV	SI, 8(BP)	! b
	MOV	DI, 6(BP)	! c
	MOV	CX, 4(BP)	! length
	
1:	
	MOV	AX, 0
	ADD	AX, (BX)
	ADD	AX, (SI)
	MOV	(DI), AX
	
	ADD	BX, 2
	ADD	SI, 2
	ADD	DI, 2
	SUB	CX, 1
	CMP	CX, 0
	JG	1b	
	
	MOV	SP, BP
	POP	BP
	RET

	
PRINT_ARRAY:
	PUSH	BP
	MOV	BP, SP
	
	MOV	BX, 4(BP)	! AX = length of a
	MOV	SI, 6(BP)	! SI = a
	
1:	
	PUSH	(SI)
	PUSH	fmt
	PUSH	_PRINTF
	SYS
	
	ADD	SI, 2
	SUB	BX, 1
	CMP	BX, 0
	JG	1b
	
	MOV	SP, BP
	POP	BP
	RET


	
.SECT .DATA

a:	.WORD	1, 2, 3, 4, 5
end:	.BYTE	0
b:	.WORD	1, 1, 1, 1, 1
c:	.WORD	0, 0, 0, 0, 0
fmt:    .ASCIZ		"%d "

.SECT .BSS



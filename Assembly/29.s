_EXIT = 1
_PRINTF = 127	

.SECT .TEXT
	MOV	CX, end - arr
	SHR	CX, 1
	MOV	BX, arr
	PUSH	CX
	PUSH	BX
	
	CALL PROC_PRINT
	
	ADD	SP, 4
	
	PUSH	0       ! return code
	PUSH	_EXIT
	SYS
	
PROC_PRINT:
	PUSH	BP
	MOV	BP, SP
	MOV	BX, 4(BP)  ! BX = *arr
	MOV	CX, 6(BP)  ! CX = arr.length()

1:	
	PUSH	(BX)
	PUSH	fmt
	PUSH	_PRINTF
	SYS
	ADD	BX, 4
	
	SUB	CX, 2
	CMP	CX, 0
	JG	1b
	
	
	MOV	SP, BP
	POP 	BP
	RET
	
	


	
.SECT .DATA

arr:	.WORD	9,8,3,4,5
end:	.BYTE	0
fmt:    .ASCIZ		"%d "

.SECT .BSS


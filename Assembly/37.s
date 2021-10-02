_EXIT = 1
_PRINTF = 127	

.SECT .TEXT
	MOV	SI, end - a
	SHR	SI, 1
	MOV	CX, SI
	MOV	BX, a
1:
	PUSH	(BX)
	
	CALL FUN
	
	ADD    SP, 2
	
	PUSH   AX
	PUSH   fmt
	PUSH   _PRINTF
	SYS
	ADD    SP, 6
	
	ADD	BX, 2
	SUB	SI, 1
	CMP	SI, 0
	JG	1b
	
	
	PUSH	0
	PUSH	_EXIT
	SYS
	
FUN:
	PUSH	BP
	MOV	BP, SP
	
	
	PUSH   BX
	PUSH   CX
	PUSH   SI
	
	
	MOV    BX, 4(BP)
	MOV    AX, BX
	MOV    SI, 2
	CWD    
	DIV    SI
	CMP    DX, 0
	JZ     2f
	
	
	MOV    AX, BX
	MOV    BX, AX
	MUL    BX
	MOV    AX, BX
	JMP    3f

2:      	
	MOV    AX, BX
	SHL    AX, 1
3:
        MOV    BX, -2(BP)
	MOV    CX, -4(BP)
	MOV    SI, -6(BP)	
	MOV	SP, BP
	POP	BP
	RET
	


	
.SECT .DATA

a:	.WORD	1, 2, 3, 4, 5
end:	.BYTE	0
fmt:    .ASCIZ		"%d "

.SECT .BSS


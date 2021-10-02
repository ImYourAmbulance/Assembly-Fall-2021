_EXIT = 1
_PRINTF = 127

.SECT .TEXT 
	MOV	AX, end - a
	SHR	AX, 1
	MOV     CX, a
	PUSH    AX
	PUSH    CX
	
	CALL COUNT_5_ENDED
	
	ADD    SP, 4
	
        PUSH   AX
	PUSH   fmt
	PUSH   _PRINTF
	SYS
	
	ADD    SP, 6
	
        PUSH	0
	PUSH	_EXIT
	SYS


COUNT_5_ENDED:
    
    PUSH    BP
    MOV     BP, SP
    
    PUSH    BX
    PUSH    SI
    PUSH    DI
    
    MOV     DI, 4(BP)   ! DI = a
    MOV     SI, 6(BP)   ! SI = len
    MOV     CX, -1       ! counter
1:
    INC     CX

2:  
    MOV     AX, (DI)
    MOV     BX, 10
    CWD
    DIV     BX
    
    ADD     DI, 2
    SUB     SI, 1
    
    CMP     DX, 5
    JZ      1b
    
    CMP     SI, 0
    JG      2b
    
    
    
    MOV     AX, CX
    
    
    MOV     BX, -2(BP)
    MOV     SI, -4(BP)
    MOV     DI, -6(BP)
    
    MOV     SP, BP
    POP     BP
    RET








.SECT .DATA

a:	.WORD	5, 21, 15, 20, 35, 5, 10
end:	.BYTE	0
fmt:    .ASCIZ		"%d "

.SECT .BSS


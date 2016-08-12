;------------------------------------------------------------------------------
;
;   Copyright (C) 2015-2016, RTI Corp, All Rights Reserved.
;   THIS SOURCE CODE, AND ITS USE AND DISTRIBUTION, IS SUBJECT TO THE TERMS
;   AND CONDITIONS OF THE APPLICABLE LICENSE AGREEMENT
;
;------------------------------------------------------------------------------

	INCLUDE arm_arch_common_macro.s

    TEXTAREA

	IMPORT NKDbgPrintfW
	
; Macro used in print debug example below
;    MACRO
;    MACRO_ASM_FUNC_PRINTF $0
;	stmfd sp!, {r0-r3} ; Push input arguments on the stack
;    mov r1, $0         ; data to print
;    ldr r0, =PRINTSTR  ; load printmessage string
;	bl NKDbgPrintfW    ; print message
;	ldmfd sp!, {r0-r3} ; Pop the input arguments off the stack   
;    MEND
	

	ALIGN
; printf("\x1b[35mNKDbgPrintfW(0x%08x)\x1b[39;49m\r\n")
;PRINTSTR DCW 0x001b, 0x005B, 0x0033, 0x0035, 0x006D, 0x004E, 0x004B, 0x0044 
;		 DCW 0x0062, 0x0067, 0x0050, 0x0072, 0x0069, 0x006E, 0x0074, 0x0066
;		 DCW 0x0057, 0x0028, 0x0030, 0x0078, 0x0025, 0x0030, 0x0038, 0x0078
;		 DCW 0x0029, 0x001b, 0x005B, 0x0033, 0x0039, 0x003B, 0x0034, 0x0039
;		 DCW 0x006D, 0x0013, 0x000A, 0x000D, 0x0000, 0x0000, 0x0000, 0x0000

	ALIGN	
testprint DCD 0x55aa55aa

;------------------------------------------------------------------------------
; This is a very simple function to test NEON. The first input argument is an
; address. The second input argument is a value. The function will duplicate
; the value found at the first argument address into 4 32 bit words located in 
; memory at the input argument. Then, the function will add the second input 
; argument value to all 4 32 bit words of memory.
;
; The first 4 arguments of a C function call land in r0, r1, r2, and r3. You
; can pass more than 4, but it gets wacky. If you have more than 4 it is best
; to pass a pointer to the rest of the arguments.
;
; ARM Calling Convention:
;
; * r0-r3 are the argument and scratch registers; r0-r1 are also the result 
;         registers
;
; * r4-r8 are callee-save registers
;
; * r9 might be a callee-save register or not (on some variants of AAPCS it 
;      is a special register)
;
; * r10-r11 are callee-save registers
;
; * r12-r15 are special registers, aliased with IP, SP, LR, PC
;------------------------------------------------------------------------------
	WELS_ASM_FUNC_BEGIN TestAsm_neon
	stmfd sp!, {r4-r11, lr} ; This aggressively saves important registers to the stack

; Now do some stuff with the NEON
 	ldr			r2, [r0]		; load value at r0 into r2
	vdup.u32	q0, r1			; duplicate r1 value to 4 32b words of q0
	vdup.u32	q1, r2			; duplicate the value to add, r2, to 4 32b words of q1
	vadd.u32	q1, q1, q0		; add 4 32b words, put result in q1
	vst2.u32	{d2, d3}, [r0]  ; 2 writes of 2 32b words of d0-1 (aliased q1 result)

; Example of printing debug to the UART (uncomment macro above)
;	ldr r1, testprint			; load testprint value to simulate a debug parameter
;	MACRO_ASM_FUNC_PRINTF r1 

	ldmfd sp!, {r4-r11, lr} ; This aggressively restores important registers from the stack
	WELS_ASM_FUNC_END
	
    
	END


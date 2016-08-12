;------------------------------------------------------------------------------
;  \copy
;      Copyright (c)  2013, Cisco Systems
;      All rights reserved.
; 
;      Redistribution and use in source and binary forms, with or without
;      modification, are permitted provided that the following conditions
;      are met:
; 
;        *  Redistributions of source code must retain the above copyright
;           notice, this list of conditions and the following disclaimer.
; 
;        *  Redistributions in binary form must reproduce the above copyright
;           notice, this list of conditions and the following disclaimer in
;           the documentation and/or other materials provided with the
;           distribution.
; 
;      THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
;      "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
;      LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
;      FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
;      COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
;      INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
;      BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
;      LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;      CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
;      LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN
;      ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;      POSSIBILITY OF SUCH DAMAGE.
; 
;------------------------------------------------------------------------------
;------------------------------------------------------------------------------
;
;   Copyright (C) 2015-2016, RTI Corp, All Rights Reserved.
;   THIS SOURCE CODE, AND ITS USE AND DISTRIBUTION, IS SUBJECT TO THE TERMS
;   AND CONDITIONS OF THE APPLICABLE LICENSE AGREEMENT
;
;------------------------------------------------------------------------------

    INCLUDE kxarm.h

    MACRO
    WELS_ASM_FUNC_BEGIN $0
    AREA |.text|, CODE, ALIGN=2, ARM, READONLY
    EXPORT $0
    LEAF_ENTRY $0
$0:
	ENTRY_END
    MEND
    
    MACRO 
    WELS_ASM_FUNC_END

    IF Interworking :LOR: Thumbing
      bx  lr
    ELSE
      mov  pc, lr          ; return
    ENDIF
    
    MEND
    
    
	ALIGN
; printf("\x1b[35mNKDbgPrintfW(0x%08x)\x1b[39;49m\r\n")
PRINTMSG DCW 0x001b, 0x005B, 0x0033, 0x0035, 0x006D, 0x004E, 0x004B, 0x0044 
		 DCW 0x0062, 0x0067, 0x0050, 0x0072, 0x0069, 0x006E, 0x0074, 0x0066
		 DCW 0x0057, 0x0028, 0x0030, 0x0078, 0x0025, 0x0030, 0x0038, 0x0078
		 DCW 0x0029, 0x001b, 0x005B, 0x0033, 0x0039, 0x003B, 0x0034, 0x0039
		 DCW 0x006D, 0x0013, 0x000A, 0x000D, 0x0000, 0x0000, 0x0000, 0x0000
	ALIGN

    MACRO
    WELS_ASM_FUNC_PRINTF $0
    
	stmfd sp!, {r0-r3} ; Push input arguments on the stack
    mov r1, $0         ; data to print
    ldr r0, =PRINTMSG  ; load printmessage string
	bl NKDbgPrintfW    ; print message
	ldmfd sp!, {r0-r3} ; Pop the input arguments off the stack
    
    MEND
    
    
    
	END
	
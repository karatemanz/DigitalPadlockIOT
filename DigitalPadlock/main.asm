.thumb
.text
	.align 2

	.global main
	.thumbfunc main

main: .asmfunc

	MOV R0, #0x4c00		; Address for P2OUT
	MOVT R0, #0x4000

	MOV R0, #0
	MOV R1, #1

 	; Setting P2 variables:
	STRB R1, [R0, #0x05]	; P2DIR = 1 (Output)
	STRB R1, [R0, #0x07]	; P2REN = 1
	STRB R0, []
	STRB R0, []


	; Setting P2 variables: DIR = 1, REN = 1,  SEL0 = 0, SEL1 = 0 [LED2]
	; P2IN
	;MOV R0, #0x4c01		; Address for P2IN
	;MOVT R0, #0x4000
	;MOV R1, #0x01
	;STRB R1, [R0]		; Set FF

	; P2OUT
	MOV R0, #0x4c03		; Address for P2OUT
	MOVT R0, #0x4000
	MOV R1, #2
	STRB R1, [R0]		; Set 1

	; P2DIR
	MOV R0, #0x4c05		; Address for P2DIR
	MOVT R0, #0x4000
	MOV R1, #1
	STRB R1, [R0] 		; Set 1 (Output)

	; P2REN
	MOV R0, #0x4c07		; Address for P2REN
	MOVT R0, #0x4000
	MOV R1, #1
	STRB R1, [R0]		; Set P2REN => 1

	; P2SEL0
	MOV R0, #0x4c0B		; Address for P2SEL0
	MOVT R0, #0x4000
	MOV R1, #0
	STRB R1, [R0]		; Set P2SEL0 => 0

	; P2SEL1
	MOV R0, #0x4c0D		; Address for P2SEL1
	MOVT R0, #0x4000
	MOV R1, #0
	STRB R1, [R0]		; Set P2SEL1 => 0

	; Setting P1 variables: DIR = 0, REN = 1, DS = 0, SEL0 = 0, SEL1 = 0 [LED 1 & Switch 1 & Switch 2]
	; P1IN
	;MOV R0, #0x4c00		; Address for P1IN
	;MOVT R0, #0x4000
	;MOV R1, #0xFF
	;STRB R1, [R0]		; Set FF

	; P1OUT
	MOV R0, #0x4c02		; Address for P1OUT
	MOVT R0, #0x4000
	MOV R1, #0x01
	STRB R1, [R0]		; Set 1

	; P1DIR
	MOV R0, #0x4c04		; Address for P1DIR
	MOVT R0, #0x4000
	MOV R1, #1
	STRB R1, [R0] 		; Set 1 (Output)

	; P1REN
	MOV R0, #0x4c07		; Address for P2REN
	MOVT R0, #0x4000
	MOV R1, #1
	STRB R1, [R0]		; Set P2REN => 1

	; P1SEL0
	MOV R0, #0x4c0A		; Address for P1SEL0
	MOVT R0, #0x4000
	MOV R1, #0
	STRB R1, [R0]		; Set P1SEL0 => 0

	; P1SEL1
	MOV R0, #0x4c0C		; Address for P1SEL1
	MOVT R0, #0x4000
	MOV R1, #0
	STRB R1, [R0]		; Set P1SEL1 => 0

	; Switch Input Addresses for Port 1 and Port 2
	MOV R2, #0x4c00		; Address for P1 Input (P1IN)
	MOVT R2, #0x4000

	MOV R3, #0x4c01		; Address for P2 Input (P2IN)
	MOVT R3, #0x4000

	; Initialize LED 2 to BLUE


;running ; MAIN PROGRAM BRANCH

	; Get Status From Switches
;	LDRB R4, [R2]	; Get input from Switch 1
;	LDRB R5, [R3]	; Get input from Switch 2

;	AND R6, R4, R5


.end

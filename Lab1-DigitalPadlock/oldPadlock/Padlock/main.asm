.thumb
.text
	.align 2

	.global main
	.thumbfunc main

main: .asmfunc

	; Base Address of Port Mappings
    MOVT R0, #0x4000
	MOV R0, #0x4c00

	;Settings for Port 1 					[000S00SL]
	MOV R1, #0x13			 	;				2  1 
	MOV R2, #0x00
	MOV R3, #0x01
	STRB R3, [R0, #0x04]	   	; P2DIR	 => [00000001] = 0 (Input Mode for SWITCHes) / 1 (Output Mode For LEDs)	
	STRB R1, [R0, #0x06]		; P2REN  =>	[00010011] = 1 (Registers for each SWITCH and LED)
	STRB R2, [R0, #0x08]		; P2SEL0 => [00000000] = 0 --> General Purpose Register Option
	STRB R2, [R0, #0x0A]		; P2SEL1 => [00000000] = 0 -/
	
	;Settings for Port 2 					[00000BGR]
	MOV R1, #0x07
	MOV R2, #0x00
	STRB R1, [R0, #0x05]	   	; P2DIR	 => [00000111] = 1 (Output Mode For LEDs)	
	STRB R1, [R0, #0x07]		; P2REN  =>	[00000111] = 1 (Registers for each position of LED)
	STRB R2, [R0, #0x0B]		; P2SEL0 => [00000000] = 0 --> General Purpose Register Option
	STRB R2, [R0, #0x0D]		; P2SEL1 => [00000000] = 0 -/

	; Initialize P2OUT to Display BLUE LED
	MOV R1, #0x04				; [00000100] B__
	STRB R1, [R0, #0x03] 		; P2OUT => 0x40004C03
	
running ; Start main loop of padlock program

	; Check both input switches
	LDRB R2, [R0, #0x00]	; P1IN => 0x40004C03

	CMP R2, #0x00
	BEQ blue
	; If R2 contains 0x02 SWITCH 1 is being pressed
	CMP R2, #0x02
	BEQ red
	; If R2 contains 0x10 SWITCH 2 is being pressed
	CMP R2, #0x10
	BEQ red
	; If R2 contains 0x12 Both SWITCHes are pressed
	CMP R2, #0x12
	BEQ green
	
blue
	MOV R1, #0x04				; [00000100] B__
	STRB R1, [R0, #0x03] 		; P2OUT => 0x40004C03
	B statusSet
	
green
	MOV R1, #0x02				; [00000100] B__
	STRB R1, [R0, #0x03] 		; P2OUT => 0x40004C03
	B statusSet

red
	MOV R1, #0x01				; [00000100] B__
	STRB R1, [R0, #0x03] 		; P2OUT => 0x40004C03
	
statusSet

	B running
	
.end
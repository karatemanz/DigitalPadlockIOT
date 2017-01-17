.thumb
.text
	.align 2

	.global main
	.thumbfunc main

main: .asmfunc

; REN, DIR, SEL0, SEL1

;running

    MOVT R0, #0x4000 ; This sets the first 16-bits

	MOV R0, #0x4c00	 ; This sets the next 16-bits

	MOV R1, #0x01

	;LDRB R0, [R0, #0x01] 	   ; Load address of P2IN into R0 (gpr0)
	STRB R1, [R0, #0x05]

	;B running

.end

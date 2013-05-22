ld r6,stack_top
ld r5,startnum
ld r2,start2
jsr subroutine
trap 0x25

subroutine:
trap 0x67
ldr r0,r6,#0
add r6,r6,#0xFFFD

str r7,r6,#1
add r2,r2,#0xFFFA
str r2,r6,#2
add r5,r5,#0xFFFF
add r0,r2,#0
trap 0x67
; store first subtraction
; in stack frame mem[r6+0]
; store program counter in
; stack frame mem[r6+1]
; store second subtraction
; in stack frame mem[r6+2]
brz endgame
add r0,r5,#0
jsr subroutine

endgame:
ldr r7,r6,#1
add r6,r6,#3
ret

start2: .word 0x0A0A
stack_top: .word 0x00F6
startnum: .word 0x00EE

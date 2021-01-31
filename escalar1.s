;*********************************
;*** Suma de dos números C=A+B ***
;*********************************

           .data
x:         .word 3  
y:         .word 2
z:         .word 4
w:         .word 0

           .text
main:      lw r4,x
           lw r5,y
           lw r2,z	   
           lw r0,w
           mult r3,r4,r5
           mult r8,r3,r4
           add r1,r2,r5
           sw 0(r0),r1
           lb r6,0(r0)
           add r8,r6,r4
           trap 5
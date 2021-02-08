;
; Título:		BUCLE_ESCALAR.S
; Tarea:		Prueba de Evaluación a Distancia - apartado a) 
; Asignatura:	Ingeniería de Computadores II
; Curso:		2020-21
; Alumno:		Sergio Flor García
; E-mail:		sflor5@alumno.uned.es
;

; Asignación de posiciones de memoria a los vectores 'X' e 'Y' y el escalar 'a':
           .data 0x1000
		   
X:         .double 0, 1, 2, 3, 4, 5, 6, 7		 
           .double 8, 9, 10, 11, 12, 13, 14, 15
           .double 16, 17, 18, 19, 20, 21, 22, 23
           .double 24, 25, 26, 27, 28, 29, 30, 31
           .double 32, 33, 34, 35, 36, 37, 38, 39
		   .double 40, 41, 42, 43, 44, 45, 46, 47
		   .double 48, 49, 50, 51, 52, 53, 54, 55, 
		   .double 56, 57, 58, 59, 60, 61, 62, 63
		   .double 64, 65, 66, 67, 68, 69, 70, 71
		   .double 72, 73, 74, 75, 76, 77, 78, 79
		   .double 80, 81, 82, 83, 84, 85, 86, 87
		   .double 88, 89, 90, 91, 92, 93, 94, 95
		   .double 96, 97, 98, 99, 100, 101, 102, 103
		   .double 104, 105, 106, 107, 108, 109, 110, 111
		   .double 112, 113, 114, 115, 116, 117, 118, 119
		   .double 120, 121, 122, 123, 124, 125, 126, 127
		   .double 128, 129, 130, 131, 132, 133, 134, 135
		   .double 136, 137, 138, 139, 140, 141, 142, 143
		   .double 144, 145, 146, 147, 148, 149, 150, 151
		   .double 152, 153, 154, 155, 156, 157, 158, 159
		   .double 160, 161, 162, 163, 164, 165, 166, 167
		   .double 168, 169, 170, 171, 172, 173, 174, 175
		   .double 176, 177, 178, 179, 180, 181, 182, 183
		   .double 184, 185, 186, 187, 188, 189
		   

Y:         .double 0, 1, 2, 3, 4, 5, 6, 7		   
           .double 8, 9, 10, 11, 12, 13, 14, 15
           .double 16, 17, 18, 19, 20, 21, 22, 23
           .double 24, 25, 26, 27, 28, 29, 30, 31
           .double 32, 33, 34, 35, 36, 37, 38, 39
		   .double 40, 41, 42, 43, 44, 45, 46, 47
		   .double 48, 49, 50, 51, 52, 53, 54, 55, 
		   .double 56, 57, 58, 59, 60, 61, 62, 63
		   .double 64, 65, 66, 67, 68, 69, 70, 71
		   .double 72, 73, 74, 75, 76, 77, 78, 79
		   .double 80, 81, 82, 83, 84, 85, 86, 87
		   .double 88, 89, 90, 91, 92, 93, 94, 95
		   .double 96, 97, 98, 99, 100, 101, 102, 103
		   .double 104, 105, 106, 107, 108, 109, 110, 111
		   .double 112, 113, 114, 115, 116, 117, 118, 119
		   .double 120, 121, 122, 123, 124, 125, 126, 127
		   .double 128, 129, 130, 131, 132, 133, 134, 135
		   .double 136, 137, 138, 139, 140, 141, 142, 143
		   .double 144, 145, 146, 147, 148, 149, 150, 151
		   .double 152, 153, 154, 155, 156, 157, 158, 159
		   .double 160, 161, 162, 163, 164, 165, 166, 167
		   .double 168, 169, 170, 171, 172, 173, 174, 175
		   .double 176, 177, 178, 179, 180, 181, 182, 183
		   .double 184, 185, 186, 187, 188, 189


a:         .double 2.0    

           .text
main:      ADDI  R1,R0,0x1000       ; Carga la dirección del primer elemento de X en R1.
           LD    F0,0x1BE0(R0)      ; Carga la dirección del escalar en F0
           ADDI  R4,R1,0x5F0        ; Cálculo y carga en R4 del fin del vector X.
inicio:    LD    F2,#0(R1)          ; Carga X[i]
           MULTD F4,F2,F0           ; Multiplica a*X[i]
           LD    F6,0x5F0(R1)       ; Carga Y[i]
           ADDD  F6,F4,F6           ; Suma a*X[i]+Y[i]
           SD    0x5F0(R1),F6       ; Almacena Y[i]
           ADDI  R1,R1,#8           ; Incrementa índice X
           SGT   R3,R1,R4           ; Comprueba si el índice del vector X ha llegado al final.
           BEQZ  R3,inicio          ; Comprueba la condición de final del bucle.

fin:       trap 6                   ; Fin del programa
	    

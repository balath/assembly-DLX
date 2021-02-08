;
; Título:		BUCLE_VECTORIAL.S
; Tarea:		Prueba de Evaluación a Distancia - apartado c) 
; Asignatura:	Ingeniería de Computadores II
; Curso:		2020-21
; Alumno:		Sergio Flor García
; E-mail:		sflor5@alumno.uned.es
;

; Asignación de posiciones de memoria:
           .data 0x1000
		   
X:         .double 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0		   ;Vector X
           .double 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0
           .double 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0
           .double 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0, 31.0
           .double 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0
		   .double 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0
		   .double 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 
		   .double 56.0, 57.0, 58.0, 59.0, 60.0, 61.0, 62.0, 63.0
		   .double 64.0, 65.0, 66.0, 67.0, 68.0, 69.0, 70.0, 71.0
		   .double 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0
		   .double 80.0, 81.0, 82.0, 83.0, 84.0, 85.0, 86.0, 87.0
		   .double 88.0, 89.0, 90.0, 91.0, 92.0, 93.0, 94.0, 95.0
		   .double 96.0, 97.0, 98.0, 99.0, 100.0, 101.0, 102.0, 103.0
		   .double 104.0, 105.0, 106.0, 107.0, 108.0, 109.0, 110.0, 111.0
		   .double 112.0, 113.0, 114.0, 115.0, 116.0, 117.0, 118.0, 119.0
		   .double 120.0, 121.0, 122.0, 123.0, 124.0, 125.0, 126.0, 127.0
		   .double 128.0, 129.0, 130.0
		   

Y:         .double 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0		   ;Vector Y
           .double 8.0, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0
           .double 16.0, 17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0
           .double 24.0, 25.0, 26.0, 27.0, 28.0, 29.0, 30.0, 31.0
           .double 32.0, 33.0, 34.0, 35.0, 36.0, 37.0, 38.0, 39.0
		   .double 40.0, 41.0, 42.0, 43.0, 44.0, 45.0, 46.0, 47.0
		   .double 48.0, 49.0, 50.0, 51.0, 52.0, 53.0, 54.0, 55.0, 
		   .double 56.0, 57.0, 58.0, 59.0, 60.0, 61.0, 62.0, 63.0
		   .double 64.0, 65.0, 66.0, 67.0, 68.0, 69.0, 70.0, 71.0
		   .double 72.0, 73.0, 74.0, 75.0, 76.0, 77.0, 78.0, 79.0
		   .double 80.0, 81.0, 82.0, 83.0, 84.0, 85.0, 86.0, 87.0
		   .double 88.0, 89.0, 90.0, 91.0, 92.0, 93.0, 94.0, 95.0
		   .double 96.0, 97.0, 98.0, 99.0, 100.0, 101.0, 102.0, 103.0
		   .double 104.0, 105.0, 106.0, 107.0, 108.0, 109.0, 110.0, 111.0
		   .double 112.0, 113.0, 114.0, 115.0, 116.0, 117.0, 118.0, 119.0
		   .double 120.0, 121.0, 122.0, 123.0, 124.0, 125.0, 126.0, 127.0
		   .double 128.0, 129.0, 130.0

a:         .double 2.0    ;Escalar a

           .text
        ADDI   R1,R0,0x1000       ; carga la dirección de X en R1
        ADDI   R2,R0,0x1418       ; carga la dirección de Y en R2
        LD     F2,0x1830(R0)      ; carga la dirección del escalar en F1
        ADDI   R3,R0,#3           ; longitud de la primera sección 
        ADDI   R6,R0,#64          ; longitud del resto de secciones 
        ADDI   R8,R0,#8           ; tamaño por elemento
        ADDI   R4,R0,#1048        ; longitud del vector X en bytes
        ADD    R4,R4,R1           ; cálculo del fin del vector X
        MULT   R5,R3,R8           ; longitud de la primera sección en bytes
        MOVI2S VLR,R3             ; modifica el VLR 
inicio: LV     V1,0(R1)           ; carga X 
        LV     V3,0(R2)           ; carga Y 
        MULTSV V2,F2,V1           ; multiplica a*X
        ADDV   V4,V3,V2           ; suma a*X+Y
        SV     0(R2),V4           ; almacena Y
        ADD    R1,R1,R5           ; cálculo de la siguiente dirección de X
        ADD    R2,R2,R5           ; cálculo de la siguiente dirección de Y
        MULT   R5,R6,R8           ; longitud de la primera sección en bytes
        MOVI2S VLR,R6             ; modifica el VLR
        SUB    R10,R4,R1          ; calcula lo que resta por procesar
        BNEZ   R10,inicio         ; comprueba si se ha terminado de procesar
fin:    trap 6                    ; Fin del programa
	    

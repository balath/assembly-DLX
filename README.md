# Assembly Notebook

Práctica en ensamblador para la asignatura "Ingeniería de Computadores II" del Grado en I.I. de la UNED.

La Prueba de Evaluación a Distancia (PED) consistirá en la programación en el ensamblador del procesador  DLXV  (una  variante  del  procesador  escalar  DLX  al  que  se  le  ha  añadido  la  capacidad  de  procesamiento  vectorial)  de  distintas  variantes  del  bucle  denominado  DAXPY  (Double-Precision  A  Times  X  Plus  Y)  que  forma  parte  del  test  de  prueba  de  rendimiento  LINPACK.

El  bucle  implementa  la  operación  vectorial  __Y:=Y+a\*X__  para  un  vector  de  longitud  R4/8  elementos  (R4 contiene  la  longitud  en  bytes  del  total  de  elementos,  teniendo  cada  elemento  8  bytes  de  longitud  al  ser  doble  precisión).  El  código  del  bucle  en  ensamblador escalar para el procesador DLXV es el siguiente:

```assembly
inicio: LD    F2,0(R1)      ; carga X(i)                     
		 					MULTD F4,F2,F0      ; multiplica a*X(i)                     
		 					LD    F6,0(R2)      ; carga Y(i)                     
		 					ADDD  F6,F4,F6      ; suma a*X(i)+Y(i)                     
		 					SD    0(R2),F6      ; almacena Y(i)                     
		 					ADDI  R1,R1,8       ; incrementa índice X                     
		 					ADDI  R2,R2,8       ; incremente índice Y                     
		 					SGT   R3,R1,R4      ; test por si finalizado                     
		 					BEQZ  R3,inicio     ; bucle si no finalizado
```

Utilizando el simulador del procesador DLXV, denominado WinDLXV, disponible en el curso virtual, se pide que:
1. Programe  el  código  anterior  en  un  fichero  denominado  BUCLE_ESCALAR.S.  Utilice  las  directivas  del ensamblador con el objeto de reservar el espacio de memoria para los dos vectores aunque su contenido  sea  cero,  y  cargue  las  direcciones  de  comienzo  en  los  registros  R1  y  R2.  Modifique  el  código ensamblador si fuese necesario pero justifíquelo en la memoria. En el manual de usuario del procesador dispone de información sobre el uso y funciones de las directivas. 
2. Desenrolle el código escalar del apartado (1) tres veces. El código debe poder procesar vectores con una  longitud  que  no  sea  múltiplo  de  tres  (por  ejemplo,  131).  Para  ello  deberá  añadir  el  código  ensamblador adicional para procesar esos elementos que quedan fuera del procesamiento realizado en  el  código  correspondiente  al  desenrollamiento.  El  fichero  con  el  código  de  este  apartado  debe  denominarse BUCLE_SECCIONADO.S.
3. Aplicando  la  técnica  de  seccionamiento  de  bucles,  reescriba  el  bucle  escalar  del  apartado  (1)  en  forma  vectorial.  Para  ello  deberá  recurrir  a  una  mezcla  de  instrucciones  escalares  y  vectoriales  y  tenga en cuenta que VLR = 64. De forma similar a como se le ha pedido en el apartado (2), el código que genere tiene que ser capaz de procesar vectores con una longitud que no sea múltiplo de VLR, en este caso, de 64 (por ejemplo, 131). El fichero con el código de este apartado debe denominarse BUCLE_VECTORIAL.S. 
4. En  base  a  los  códigos  que  ha  desarrollado  en  los  tres  apartados  previos,  y  para  un  vector  de  190  elementos, determine cuántos ciclos de reloj se consumen en las siguientes situaciones: 
   1. Con el código escalar del apartado (1).  
   2. Con el código escalar desenrollado tres veces del apartado (2). 
   3. Con el código del apartado (3) con el encadenamiento vectorial activado. 
5. Para  los  tres  casos  del  apartado  (4),  calcule  el  CPI  medio  que  se  obtiene  al  procesar  vectores  de  190 elementos. 
6. Para  finalizar,  calcule  la  aceleración  que  se  obtiene  en  las  situaciones  2  y  3  planteadas  en  el  apartado (4) con respecto a la situación 1 (código escalar básico).

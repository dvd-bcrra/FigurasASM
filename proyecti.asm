.model small	;Tamaño de memoria
.stack			;La pila
.data			;Segmento de datos

				;Mensajes
	menu db 13,10 , "Instituto Tecnologico de Tijuana",13,10 ; 13 es un "enter" 10 un espacio
                 db "Ingenieria en Sistemas Computacionales",13,10
                 db "Lenguaje de interfaz",13,10,13,10
				 db "CALCULADORA DE AREA Y PERIMETRO",13,10,13,10
                 db "-----------------MENU--------------",13,10,13,10
                 db "1. Cuadrado",13,10
                 db "2. Rectangulo",13,10
                 db "3. Triangulo",13,10
                 db "4. Circulo",13,10,13,10
                 db "Seleccione una Opcion: ","$",13,10
				 
	msgPedirNum1 db 13,10,"Ingrese la base: ","$",13,10
	msgPedirNum2 db 13,10,"Ingrese la altura :","$",13,10
	msgPedirRadio db 13,10,"Ingrese el radio :","$",13,10
	
	msgCuadrado db 13,10,"Figura seleccionada [Cuadrado]", "$", 13,10
	msgRectangulo db 13,10,"Figura seleccionada [Rectangulo]", "$",13,10
	msgTriangulo db 13,10,"Figura seleccionada [Triangulo]", "$",13,10
	msgCirculo db 13,10,"Figura seleccionada [Circulo]","$",10,10
	
	msgarea db 13,10,"El area es: ","$",13,10
	msgperimetro db 13,10,"El perimetro es: ","$",13,10
	
	msgError db 13,10,"Opcion no valida","$",13,10
	msgPresioneUnaTecla db 13,10,"Presione una tecla para continuar","$", 13,10
	
	;Variables
	num1 db 0
	num2 db 0
	area db 0
	perimetro db 0

.code
	
	inicio:	;Etiqueta de inicio
		
		mov ax, @data	;Se carga el segmento de datos en el resigstro ax y posteriormente se mueven al regristo ds
		mov ds, ax
		
		mov ah,0       ;limpia el registro
		mov al,3h      ;modo de texto
		int 10h
		
		mov ah, 09h ; Imprimimos por pantalla el contenido de menu
		lea dx, menu
		int 21h
		
		;Llamar a procedimientos
		mov ah, 08 ;Instruccion a la espera de que el usuario ingrese un por teclado
		int 21h
		
		cmp al, 49 
		je cuadrado
		cmp al, 50
		je rectangulo
		cmp al, 51
		je triangulo
		cmp al, 52
		je circulo
		
		jmp fin
	.exit
	
	fin:
		mov ah, 09h
		lea dx, msgError
		int 21h
	.exit
	
	cuadrado:
		call cuadradoproc
	rectangulo:
		call rectanguloProc
	triangulo:
	    call trianguloProc
	circulo:
	    call circuloProc
		
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;                                      ;
	;   Procedimiento para el cuadrado     ;
	;                                      ;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	cuadradoproc proc near
    	mov ah,0       ;limpia el registro
    	mov al,3h      ;modo de texto
    	int 10h
    	
    	mov ah, 09h
    	lea dx, msgCuadrado
    	int 21h
    	
    	;Capturar num1
    	mov ah, 09h
    	lea dx, msgPedirNum1
    	int 21h
    	
    	mov ah, 01h
    	int 21h
    	sub al, 30h ;ajuste
    	mov num1, al
    	
    	;Capturar num2
    	mov ah, 09h
    	lea dx, msgPedirNum2
    	int 21h
    	
    	mov ah, 01h
    	int 21h
    	sub al, 30h ;ajuste
    	mov num2, al
    	;Operacion  para calcular el area
    	mov al, num1
    	mov bl, num1
    	mul bl
    	mov area, al
    	;Mostrar el area en pantalla
    	mov ah, 09h
    	lea dx, msgarea
    	int 21h
    	
    	;Mostrar el primer digito del area
    	mov al, area
    	aam
    	mov bx,ax
    	
    	mov ah, 02h
    	mov dl,bh
    	add dl, 30h
    	int 21h
    	
    	;Mostrar el segundo digito del area
    	mov ah, 02h
    	mov dl, bl
    	add dl, 30h
    	int 21h
    	
    	
    	;Calcular perimetro
    	mov al, num1
    	add al, num2
    	mov perimetro, al
    	
    	mov al, 2
    	mov bl, perimetro
    	mul bl
    	mov perimetro, al
    	
    	
    	;Mostrar el area en pantalla
    	mov ah, 09h
    	lea dx, msgperimetro
    	int 21h
    	
    	;Mostrar el primer digito del perimetro
    	mov al, perimetro
    	aam
    	mov bx,ax
    	
    	mov ah, 02h
    	mov dl,bh
    	add dl, 30h
    	int 21h
    	
    	;Mostrar el segundo digito del perimetro
    	mov ah, 02h
    	mov dl, bl
    	add dl, 30h
    	int 21h
    	
    	mov ah, 09h
    	lea dx, msgPresioneUnaTecla
    	int 21h
    	
    	mov ah, 08 ;Instruccion a la espera de que el usuario ingrese un por teclado
    	int 21h
    	
    	call inicio
    	ret
	cuadradoproc endp
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;                                      ;
	;   Procedimiento para el rectangulo   ;
	;                                      ;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	rectanguloProc proc near
    	mov ah,0       ;limpia el registro
    	mov al,3h      ;modo de texto
    	int 10h
    	
    	mov ah, 09h
    	lea dx, msgRectangulo
    	int 21h
    	
    	;Capturar num1
    	mov ah, 09h
    	lea dx, msgPedirNum1
    	int 21h
    	
    	mov ah, 01h
    	int 21h
    	sub al, 30h ;ajuste
    	mov num1, al
    	
    	;Capturar num2
    	mov ah, 09h
    	lea dx, msgPedirNum2
    	int 21h
    	
    	mov ah, 01h
    	int 21h
    	sub al, 30h ;ajuste
    	mov num2, al
    	;Operacion  para calcular el area
    	mov al, num1
    	mov bl, num2
    	mul bl
    	mov area, al
    	;Mostrar el area en pantalla
    	mov ah, 09h
    	lea dx, msgarea
    	int 21h
    	
    	;Mostrar el primer digito del area
    	mov al, area
    	aam
    	mov bx,ax
    	
    	mov ah, 02h
    	mov dl,bh
    	add dl, 30h
    	int 21h
    	
    	;Mostrar el segundo digito del area
    	mov ah, 02h
    	mov dl, bl
    	add dl, 30h
    	int 21h
    	
    	
    	;Calcular perimetro
    	mov al, num1
    	add al, num2
    	mov perimetro, al
    	
    	mov al, 2
    	mov bl, perimetro
    	mul bl
    	mov perimetro, al
    	
    	
    	;Mostrar el area en pantalla
    	mov ah, 09h
    	lea dx, msgperimetro
    	int 21h
    	
    	;Mostrar el primer digito del perimetro
    	mov al, perimetro
    	aam
    	mov bx,ax
    	
    	mov ah, 02h
    	mov dl,bh
    	add dl, 30h
    	int 21h
    	
    	;Mostrar el segundo digito del perimetro
    	mov ah, 02h
    	mov dl, bl
    	add dl, 30h
    	int 21h
    	
    	mov ah, 09h
    	lea dx, msgPresioneUnaTecla
    	int 21h
    	
    	mov ah, 08 ;Instruccion a la espera de que el usuario ingrese un por teclado
    	int 21h
    	
    	call inicio
    	ret
	rectanguloProc endp
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;                                      ;
	;   Procedimiento para el triangulo    ;
	;                                      ;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	trianguloProc proc near
	    mov ah,0       ;limpia el registro
    	mov al,3h      ;modo de texto
    	int 10h
    	
    	mov ah, 09h
    	lea dx, msgTriangulo
    	int 21h
    	
    	;Capturar num1
    	mov ah, 09h
    	lea dx, msgPedirNum1
    	int 21h
    	
    	mov ah, 01h
    	int 21h
    	sub al, 30h ;ajuste
    	mov num1, al
    	
    	;Capturar num2
    	mov ah, 09h
    	lea dx, msgPedirNum2
    	int 21h
    	
    	mov ah, 01h
    	int 21h
    	sub al, 30h ;ajuste
    	mov num2, al
    	
    	;Operacion  para calcular el area
    	
    	;base por altura
    	mov al, num1
    	mov bl, num2
    	mul bl
    	
    	;entre dos
    	mov ah,0
    	mov cl,2
    	div cl
    	mov area, al 
    	
    	;Mostrar el area en pantalla
    	mov ah, 09h
    	lea dx, msgarea
    	int 21h
    	
    	;Mostrar el primer digito del area
    	mov al, area
    	aam
    	mov bx,ax
    	
    	mov ah, 02h
    	mov dl,bh
    	add dl, 30h
    	int 21h
    	
    	;Mostrar el segundo digito del area
    	mov ah, 02h
    	mov dl, bl
    	add dl, 30h
    	int 21h
    	
    	
    	;Calcular perimetro
    	mov al, num1
    	mov bl, 3
    	mul bl
    	mov perimetro, al
    	
    	
    	;Mostrar el area en pantalla
    	mov ah, 09h
    	lea dx, msgperimetro
    	int 21h
    	
    	;Mostrar el primer digito del perimetro
    	mov al, perimetro
    	aam
    	mov bx,ax
    	
    	mov ah, 02h
    	mov dl,bh
    	add dl, 30h
    	int 21h
    	
    	;Mostrar el segundo digito del perimetro
    	mov ah, 02h
    	mov dl, bl
    	add dl, 30h
    	int 21h
    	
    	mov ah, 09h
    	lea dx, msgPresioneUnaTecla
    	int 21h
    	
    	mov ah, 08 ;Instruccion a la espera de que el usuario ingrese un por teclado
    	int 21h
    	
    	call inicio
    	ret    	   
	    
	trianguloProc endp
	
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	;                                      ;
	;   Procedimiento para el circulo      ;
	;                                      ;
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
	
	circuloProc proc near
	    mov ah,0       ;limpia el registro
    	mov al,3h      ;modo de texto
    	int 10h
    	
    	mov ah, 09h
    	lea dx, msgCirculo
    	int 21h
    	
    	;Capturar num1
    	mov ah, 09h
    	lea dx, msgPedirRadio
    	int 21h
    	
    	mov ah, 01h
    	int 21h
    	sub al, 30h ;ajuste
    	mov num1, al
    	
    	;Operacion  para calcular el area
    	
    	;base por altura
    	mov al, 3   ;PI
    	mov bl, num1
    	mov cl, num1
    	mul bl
    	mul cl
    	mov area,al 
    	
    	;Mostrar el area en pantalla
    	mov ah, 09h
    	lea dx, msgarea
    	int 21h
    	
    	;Mostrar el primer digito del area
    	mov al, area
    	aam
    	mov bx,ax
    	
    	mov ah, 02h
    	mov dl,bh
    	add dl, 30h
    	int 21h
    	
    	;Mostrar el segundo digito del area
    	mov ah, 02h
    	mov dl, bl
    	add dl, 30h
    	int 21h
    	
    	
    	;Calcular perimetro
    	mov al, 3   ;PI
    	mov bl, num1
    	mov cl, 2
    	mul bl
    	mul cl
    	mov perimetro, al
    	
    	
    	;Mostrar el area en pantalla
    	mov ah, 09h
    	lea dx, msgperimetro
    	int 21h
    	
    	;Mostrar el primer digito del perimetro
    	mov al, perimetro
    	aam
    	mov bx,ax
    	
    	mov ah, 02h
    	mov dl,bh
    	add dl, 30h
    	int 21h
    	
    	;Mostrar el segundo digito del perimetro
    	mov ah, 02h
    	mov dl, bl
    	add dl, 30h
    	int 21h
    	
    	mov ah, 09h
    	lea dx, msgPresioneUnaTecla
    	int 21h
    	
    	mov ah, 08 ;Instruccion a la espera de que el usuario ingrese un por teclado
    	int 21h
    	
    	call inicio
    	ret    	   
	    
	circuloProc endp
.exit
end

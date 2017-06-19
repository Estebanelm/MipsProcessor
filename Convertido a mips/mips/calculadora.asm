#registros:
#$a0: operando 1
#$a1: operando 2
#$a2: operacion
#$a3: resultado
#t2: bandera de que se tiene la respuesta

#Códigos de operación:
#1 suma
#2 resta
#3 multiplicacion
#4 division
#5 sen
#6 cos
#7 and
#8 or
#9 not
#10 nand
#11 nor
#12 xor
#13 xnor

#Datos en memoria:
#en 33 se guarda el primer operando
#en 34 se guarda el segundo
#en 35 se guarda la operacion
#36 se utiliza para saber si existe el primer operando
#37 se utiliza para saber si existe el segundo operando

main:
	addi $t3, $zero, 1 #setear suma en registro
	addi $t4, $zero, 2 #setear resta en registro
	addi $t5, $zero, 3 #setear mult en registro
	addi $t6, $zero, 4 #setear div en registro
	addi $t7, $zero, 5 #setear sen en registro
	addi $s0, $zero, 6 #setear cos en registro
	addi $s1, $zero, 7 #setear and en registro
	addi $s2, $zero, 8 #setear or en registro
	addi $s3, $zero, 9 #setear not en registro
	addi $s4, $zero, 10 #setear nand en registro
	addi $s5, $zero, 11 #setear nor en registro
	addi $s6, $zero, 12 #setear xor en registro
	addi $s7, $zero, 13 #setear xnor en registro
	
esperaoperacion:
	lw $a2, 35($zero) #obtener la operacion
	beq $zero, $a2, esperaoperacion #si no hay operacion, mantener ciclo
	andi $a3, $zero, 0 #devolver la bandera de mostrar respuesta

esperaop1:
	lw $t0, 36($zero) #obtiene de memoria la bandera del primer operando
	beq $t0, $zero, esperaop1 #si sigue en 0, continúe el ciclo
	
operando1:
	lw $a0, 33($zero) #obtener primer operando
	
esperaop2:
	lw $t1, 37($zero) #obtener la bandera del segundo operando
	beq $t1, $zero, esperaop2 #si sigue en 0, continuar el ciclo

operando2:
	lw $a1, 34($zero) #obtener segundo oerando

procesarop:
	sw $zero, 36($zero) #se devuelve la bandera a 0 del op1
	beq $t3, $a2, suma #ir a suma
	beq $t4, $a2, resta #ir a op
	beq $t5, $a2, multiplicacion #ir a op
	beq $t6, $a2, division #ir a op
	beq $t7, $a2, sen #ir a op
	beq $s0, $a2, cos #ir a op
	beq $s1, $a2, opand #ir a op
	beq $s2, $a2, opor #ir a op
	beq $s3, $a2, opnot #ir a op
	beq $s4, $a2, opnand #ir a op
	beq $s5, $a2, opnor #ir a op
	beq $s6, $a2, opxor #ir a op
	beq $s7, $a2, opxor #ir a xnor
	#si no corresponde a ninguna operación, devolver el programa al inicio
	sw $zero, 35($zero) #se devuelve a 0 la operacion
	sw $zero, 37($zero) #se devuelve a 0 la bandera del op2
	j esperaoperacion

suma:
	add $a3, $a0, $a1 #realiza suma
	j mostrarresultado
	
resta:
	nor $a1, $a1, $zero #algoritmo de resta
	addi $a1, $a1, 1
	add $a3, $a0, $a1
	j mostrarresultado

multiplicacion:
	# $v0 - Resultado
	# $t0 - La máscara para el bit derecho
	# $t1 - El LSB del multiplicador

	addi $v0,$0,0	# Se inicializa el registro del resultado
	addi $t0,$0,1	# Se inicializa la máscara
	addi $t1,$0,0	# Se inicializa LSB

	Multiplication_loop:
		beq $a1, $zero, Multiplication_end	# Si el multiplicador es cero finaliza
		and $t1, $t0, $a1			# Obtiene el LSB
		beq $t1, 1, Multiplication_do_add	# Si el LSB no es cero, añada el multiplicando al resultado
		beq $t1, 0, Multiplication_do_shift	# Si el LSB es cero, sólo tiene que hacer los cambios

		Multiplication_do_add: 
			addu $v0, $v0, $a0		

		Multiplication_do_shift:
			sll $a0, $a0, 1			# Shift left el multiplicando
			srl $a1, $a1, 1			# Shift right el multiplicador

		j Multiplication_loop			# Hace el loop

	Multiplication_end:
		addi $a3, $v0, 0 			# Se agrega el resultado a $a3
		j mostrarresultado

division:
	# $t0 - temporal con resultado de restas
	# $t1 - temporal
	# $t2 - temporan que lleva cantidad de restas
	
	add $t0, $0, $a0	# Se crea temporal con a0 para restas	 
	add $t2, $0, 0		# se inicia el contador

	division_loop:
		sub $t0, $t0, $a1
		addi $t2, $t2, 1
		slt $t3, $t0, $a1
		bne $t3,$zero,division_end 
		j division_loop			# Hace el loop

	division_end:
		addi $a3, $t2, 0
		j mostrarresultado

sen:

cos:

opand:
	and $a3, $a0, $a1 #realiza AND
	j mostrarresultado
	
opor:
	or $a3, $a0, $a1 #realiza OR
	j mostrarresultado
	
opnot:
	not $a3, $a0 #realiza NOT
	j mostrarresultado

opnand:
	and $a3, $a0, $a1 #realiza AND
	nor $a3, $a3, $zero #invierte el resultado
	j mostrarresultado

opnor:
	nor $a3, $a0, $a1 #realiza NOR
	j mostrarresultado

opxor:
	and $t0, $a0, $a1 #realiza AND
	nor $t0, $t0, $zero #invierte el resultado
	or $a3, $a0, $a1 #realizar OR
	and $a3, $a3, $t0 #completa la XOR con un AND
	beq $s7, $a2, opxnor #ir a xnor
	j mostrarresultado

opxnor:
	nor $a3, $a3, $zero #inverte el resultado de la xor

mostrarresultado:
	sw $zero, 35($zero) #se devuelve a 0 la operacion
	sw $zero, 37($zero) #se devuelve a 0 la bandera del op2
	addi $t2, $zero, 1 #subir bandera de mostrar resultado
	j esperaoperacion
	
	
	
	
	
	
	
	
	
	
	
	

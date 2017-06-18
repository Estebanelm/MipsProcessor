#registros:
#$a0: operando 1
#$a1: operando 2
#$a2: operacion
#$a3: display
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
	andi $zero, $zero, 0 #devolver la bandera de mostrar respuesta

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
	beq $s7, $a2, opxnor #ir a xnor
	#si no corresponde a ninguna operación, devolver el programa al inicio
	sw $zero, 35($zero) #se devuelve a 0 la operacion
	sw $zero, 37($zero) #se devuelve a 0 la bandera del op2
	j esperaoperacion

suma:

resta:

multiplicacion:

division:

sen:

cos:

opand:

opor:

opnot:

opnand:

opnor:

opnand:

opnor:

opxor:

opxnor:


	
	
	
	
	
	
	
	
	
	
	
	
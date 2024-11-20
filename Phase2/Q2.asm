# This program for question 2 was coded on the MARS compiler, So many types of structres had to be learned online to replicate c++ code
.data       # initialize arrays

.text       # instructions follow this line	
																	
main:                  
	# give values A integers for every element in order
	addi $t0, $zero, 0x10010000
	#values
	addi $t1, $zero, 6	
	sw $t1, 0($t0)
	addi $t1, $zero, 34
	sw $t1, 4($t0)
	addi $t1, $zero, -7
	sw $t1, 8($t0)
	addi $t1, $zero, 3
	sw $t1, 12($t0)
	addi $t1, $zero, 0
	sw $t1, 16($t0)
	addi $t1, $zero, -20
	sw $t1, 20($t0)
	addi $t1, $zero, 6
	sw $t1, 24($t0)
	addi $t1, $zero, -2
	sw $t1, 28($t0)
	addi $t1, $zero, 10
	sw $t1, 32($t0)
	# give values B same as A
	addi $t0, $t0, 36
	# values
	addi $t1, $zero, 3	
	sw $t1, 0($t0)
	addi $t1,  $zero, -1
	sw $t1, 4($t0)
	addi $t1,  $zero, 2
	sw $t1, 8($t0)
	addi $t1,  $zero, -9
	sw $t1, 12($t0)
	addi $t1,  $zero, -1
	sw $t1, 16($t0)
	addi $t1,  $zero, 4
	sw $t1, 20($t0)
	addi $t1,  $zero, 6
	sw $t1, 24($t0)
	addi $t1,  $zero, 11
	sw $t1, 28($t0)
	addi $t1,  $zero, 4
	sw $t1, 32($t0)
	# add values of B to A saving to A
	#store A adress again
	addi $t0, $zero, 0x10010000
	#add A, A, B = add A, A, 36(A)
	addi $t6, $zero, 9
loopAdd:
	beq $t6, $zero, endAdd
	lw $t1, 0($t0)
	lw $t2, 36($t0)
	add $t1, $t1, $t2
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	addi $t6, $t6, -1
	j loopAdd
endAdd:
	addi $t0, $zero, 0x10010000
	addi $t6, $zero, 9
printA:
	beq $t6, $zero, finishA
	lw $a0, 0($t0)
	addi $v0, $zero, 1 #Set mode to int, to print int, then syscall to print
	syscall
	addi $a0, $zero, 10
	addi $v0, $zero, 11 #set mode to char
	syscall
	addi $t0, $t0, 4 
	addi $t6, $t6, -1
	j printA
finishA:
	addi $t0, $zero, 0x10010000
	add $t5, $zero, $zero
	addi $t6, $zero, 9
sum:
	beq $t6, $zero, finish
	lw $t3, 0($t0) #add A
	add $t5, $t5, $t3
	lw $t3, 36($t0) #add B
	add $t5, $t5, $t3
	add $t5, $t5, 1 #add 1
	addi $t0, $t0, 4 
	addi $t6, $t6, -1
	j sum
finish:
	#print sum
	add $a0, $zero, $t5
	addi $v0, $zero, 1 #Set mode to int, to print int, then syscall to print
	syscall
	addi $v0, $zero, 10
	syscall
	
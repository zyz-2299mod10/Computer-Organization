.data
first_n:	.asciiz "Enter first number: "
second_n:	.asciiz "Enter second number: "
ans:	.asciiz "The GCD is: "
a:	.word 0
b:	.word 0

.text
.globl main
#----------------main-----------------
main:

#input
	li	$v0, 4
	la	$a0, first_n
	syscall
	li	$v0, 5
	syscall
	sw	$v0, a

	li	$v0, 4
	la	$a0, second_n
	syscall
	li	$v0, 5
	syscall
	sw	$v0, b
	
	jal	GCD
	move	$t0, $v0	#save ans to t0
#print ans
	li	$v0, 4
	la	$a0, ans
	syscall
	li	$v0, 1
	move	$a0, $t0
	syscall
	
end:
	li $v0, 10
	syscall
	
#-----------------GCD---------------------
.text
GCD:
	lw	$t0, a
	lw	$t1, b
	div	$t0, $t1
	mfhi	$t3
	bnez	$t3, neq
	move	$v0, $t1
	jr	$ra
neq:
	sw	$t1, a
	sw	$t3, b
	j	GCD
	

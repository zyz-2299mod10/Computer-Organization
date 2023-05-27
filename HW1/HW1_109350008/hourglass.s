.data
n: 	.word 0
temp: 	.word 0
input:	.asciiz "Enter the number n = "
star:	.asciiz "*"
space:	.asciiz " "
split:	.asciiz "\n"

.text
.globl main
main:
# print and read input 
	li	$v0, 4
	la	$a0, input
	syscall
	
	li	$v0, 5
	syscall
	sw	$v0, n

# temp
	lw	$t0, n
	addi	$t0, $t0, 1
	div	$t0, $t0, 2
	mflo	$t1
	sw	$t1, temp	
	#check odd
	lw	$t0, n
	andi	$t0, $t0, 1
	bne	$t0, $zero, odd
	j	o_lp1_ini
odd:	
	lw 	$t1, temp
	subi	$t1, $t1, 1
	sw	$t1, temp
#-------------- loop 1----------------	
o_lp1_ini:
	lw 	$t0, temp
	move	$t1, $zero #t1 = i
o_lp1:
	bge	$t1, $t0, o_lp2_ini
	
i_lp11_ini:
	move	$t2, $zero #t2 = j
i_lp11:
	bgt	$t2, $t1, i_lp12_ini
	la	$a0, space
	li	$v0, 4
	syscall
	addi	$t2, $t2, 1
	j	i_lp11
	
i_lp12_ini:
	move	$t2, $zero
	lw	$t3, n
	mul	$t4, $t1, 2
	sub	$t5, $t3, $t4
i_lp12:
	bge	$t2, $t5, o_lp1_end
	la	$a0, star
	li	$v0, 4
	syscall
	addi	$t2, $t2, 1
	j	i_lp12
		
o_lp1_end:
	la	$a0, split
	li	$v0, 4
	syscall
	addi 	$t1, $t1, 1
	j 	o_lp1
	
#-------------- loop 2---------------	
o_lp2_ini:
	lw	$t0, n
	move	$t1, $zero #t1 = i
	addi	$t1, $t0, 1
	div	$t1, $t1, 2
	subi	$t1, $t1, 1
o_lp2:
	bltz	$t1, end

i_lp21_ini:
	move	$t2, $zero #t2 = j
i_lp21:
	bgt	$t2, $t1, i_lp22_ini
	la	$a0, space
	li	$v0, 4
	syscall
	addi	$t2, $t2, 1
	j	i_lp21

i_lp22_ini:
	move	$t2, $zero #t2 = j
	mul	$t3, $t1, 2
	sub	$t4, $t0, $t3
i_lp22:
	bge	$t2, $t4, o_lp2_end
	la	$a0, star
	li	$v0, 4
	syscall
	addi	$t2, $t2, 1
	j	i_lp22
	
o_lp2_end:
	la	$a0, split
	li	$v0, 4
	syscall
	subi 	$t1, $t1, 1
	j 	o_lp2

end:
	li 	$v0, 10
	syscall
	

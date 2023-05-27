.data
n:	.word 0
flag:	.word 0
input:	.asciiz "Enter the number n = "
isp_output:	.asciiz " is a prime"
notp_output:	.asciiz " is not a prime, the nearest prime is"
space:	.asciiz " "

.text
.globl	main
#---------------main--------------
main:
	li	$v0, 4
	la	$a0, input
	syscall
	li	$v0, 5
	syscall
	sw	$v0, n

is_prime:
	lw	$a0, n
	jal	check_prime
	beqz	$v0, not_prime
	
	lw	$a0, n
	li	$v0, 1
	syscall
	la	$a0, isp_output
	li	$v0, 4
	syscall
	j	end

not_prime:
	lw	$a0, n
	li	$v0, 1
	syscall
	li	$v0, 4
	la	$a0, notp_output
	syscall
	
not_prime_lp_ini:
	addi	$t4, $zero, 1 # t4 = i
	lw	$t5, n
not_prime_lp:
	lw	$t7, flag # t7 = flag
	bnez	$t7, end
if_nsi:
	sub	$t6, $t5, $t4
	move	$a0, $t6
	jal	check_prime
	beqz	$v0, if_nai
	addi	$t7, $zero, 1
	sw	$t7, flag
	#is_prime
	la	$a0, space
	li	$v0, 4
	syscall
	li	$v0, 1
	move	$a0, $t6
	syscall
if_nai:
	add	$t6, $t5, $t4
	move	$a0, $t6
	jal	check_prime
	beqz	$v0, not_prime_lp_end
	addi	$t7, $zero, 1
	sw	$t7, flag
	#is_prime
	la	$a0, space
	li	$v0, 4
	syscall
	li	$v0, 1
	move	$a0, $t6
	syscall

not_prime_lp_end:
	addi	$t4, $t4, 1
	j	not_prime_lp
	

end:
	li	$v0, 10
	syscall
	
#----------------prime-----------
.text
check_prime:
	move	$t0, $a0
	beq	$t0, 1, notp
	
prime_lp_ini:
	addi	$t1, $zero, 2 # t1 = i
prime_lp:
 	# check i*i <= n
	mul	$t2, $t1, $t1
	bgt	$t2, $t0, yesp
	#if
	div	$t0, $t1
	mfhi	$t3
	beqz	$t3, notp
	
	# update
	addi	$t1, $t1, 1
	j	prime_lp
	
notp:
	move	$v0, $zero
	jr	$ra

yesp:	
	addi	$v0, $zero, 1
	jr	$ra
.data
	input_msg:	.asciiz "Please input a number: "
	output1:	.asciiz "It's a prime"
	output2: .asciiz "It's not a prime"

.text
.globl main
#------------------------- main -----------------------------
main:
# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, input_msg		# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $a0, $v0      		# store input in $a0 (set arugument of prime)

# jump to procedure factorial
	jal 	isPrime
	move 	$t0, $v0			# save return value in t0 (because v0 will be used by system call) 
	beq		$t0, $zero, false	# if return 0, executing false function
	
	li      $v0, 4				# call system call: print string
	la      $a0, output1	# load address of string into $a0
	syscall                 	# run the syscall
	j		exit
false:# print output_msg2 on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, output2	# load address of string into $a0
	syscall                 	# run the syscall
	j		exit
exit:
# exit the program
	li 		$v0, 10				# call system call: exit
	syscall						# run the syscall

#------------------------- procedure factorial -----------------------------
# load argument n in $a0, return value in $v0. 
.text
isPrime:	
	addi 	$sp, $sp, -8		# adiust stack for 2 items
	sw 		$ra, 4($sp)			# save the return address
	sw 		$a0, 0($sp)			# save the argument n
	addi	$t0, $t0, 2			# initialize $t0 = 2;
	slt		$t1, $a0, $t0		# check whether $a0 < 2
	bne 	$t1, $zero, notPrime	# if true, it isn't prime
Loop:	
	mul		$t1, $t0, $t0		# set $t1 = $t0*$t0
	slt		$t3, $a0, $t1		# $t3 = ($a0 < $t1)
	bne		$t3, $zero, Prime	# n is prime
	div		$a0, $t1			# caculate $a0/$t1
	mfhi	$t2					# get $a0%$t1
	beq		$t2, $zero, notPrime	# check whether n is prime
	addi 	$t0, $t0, 1			# set $t0 += 1
	j		Loop				
notPrime:
	addi 	$v0, $zero, 0	# return 0 if it isn't prime
	lw		$a0, 0($sp)			# restore $a0
	lw		$ra, 4($sp)			# restore $ra
	addi 	$sp, $sp, 8			# release space
	jr 		$ra
Prime:
	addi 	$v0, $zero, 1	# return 1 if it is prime
	lw		$a0, 0($sp)			# restore $a0
	lw		$ra, 4($sp)			# restore $ra
	addi 	$sp, $sp, 8			# release space
	jr 		$ra
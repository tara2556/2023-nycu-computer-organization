.data
	in1:	.asciiz "Please input a number: "
	out1:	.asciiz "The result of fibonacci(n) is "
.text
.globl main
#------------------------- main -----------------------------
main:
	
	# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, in1		# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s0, $v0      		# store input in $a0 (set arugument of triangle)
	addi	$sp, $sp, -8
	sw		$ra, 4($sp)
	sw		$a0, 0($sp)
	move	$a0, $s0
	li		$v0, 0
	jal		fibonacci
	move	$t0, $v0

	li      $v0, 4				# call system call: print string
	la      $a0, out1		# load address of string into $a0
	syscall                 	# run the syscall
 	
 	move	$a0, $t0
 	li		$v0, 1
 	syscall
exit:
# exit the program
	li 		$v0, 10				# call system call: exit
	syscall						# run the syscall

#------------------------- procedure factorial -----------------------------
# load argument n in $a0, return value in $v0. 
.text
fibonacci:
	addi	$t0, $zero, 1
	addi	$sp, $sp, -8
	sw		$ra, 4($sp)
	sw		$a0, 0($sp)
	slt		$t1, $t0, $a0
	bne		$t1, $zero, recursive
	add		$v0, $v0, $a0
	addi	$sp, $sp, 8
	jr 		$ra
recursive:
	addi	$a0, $a0, -1
	jal		fibonacci
	addi	$a0, $a0, -1
	jal		fibonacci
	lw		$a0, 0($sp)
	lw		$ra, 4($sp)
	addi	$sp, $sp, 8
	jr		$ra

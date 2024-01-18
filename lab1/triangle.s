.data
	in1:	.asciiz "Please enter option (1: triangle, 2: inverted triangle): "
	in2:	.asciiz "Please input a triangle size: "
	out1: .asciiz "*"
	out2: .asciiz "\n"
	out3: .asciiz " "

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

# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, in2		# load address of string into $a0
	syscall                 	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s1, $v0      		# store input in $a1 (set arugument of triangle)
	
# construct each layer
	add 	$s2, $zero, $zero	# initialize $t0 = 0
Loop:
	slt		$t2, $s2, $s1
	beq		$t2, $zero, exit
	addi	$t1, $zero, 1	
	beq		$s0, $t1, L1
	j		L2
L1:	
	move	$a0, $s1
	move	$a1, $s2
	jal 	printLayer
	j 		continuousLoop
L2:
	move	$a0, $s1
	sub		$t2, $s1, $s2
	addi	$a1, $t2, -1
	jal		printLayer
	j 		continuousLoop
continuousLoop:
	addi	$s2, $s2, 1
	j 		Loop

exit:
# exit the program
	li 		$v0, 10				# call system call: exit
	syscall						# run the syscall

#------------------------- procedure factorial -----------------------------
# load argument n in $a0, return value in $v0. 
.text
printLayer:
	addi 	$t0, $zero, 1
	sub		$t1, $a0, $a1
	move 	$t2, $t1
	add		$t3, $a0, $a1
	slt		$t4, $t0, $t1
	beq		$t4, $zero, loop2
loop1:
	 li		$v0, 4
	 la		$a0, out3
	 syscall
	 addi	$t0, $t0, 1
	 slt	$t4, $t0, $t1
	 bne	$t4, $zero, loop1
loop2:
	li		$v0, 4
	la		$a0, out1
	syscall
	addi	$t2, $t2, 1
	slt		$t4, $t3, $t2
	beq		$t4, $zero, loop2
	li		$v0, 4
	la		$a0, out2
	syscall
	jr		$ra

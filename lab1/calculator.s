.data
	in1:	.asciiz "Please enter option (1: add, 2: sub, 3: mul): "
	in2:	.asciiz "Please enter the first number: "
	in3:	.asciiz "Please enter the second number: "
	out:	.asciiz "The calculation result is: "
	
.text
.globl main
#------------------------- main -----------------------------
main:
# print input_msg on the console interface
	li      $v0, 4				# call system call: print string
	la      $a0, in1		# load address of string into $a0
	syscall                 	# run the syscall
	   	# run the syscall
 
# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s0, $v0      		# store input in $a0 (set arugument of calculator)
	li      $v0, 4				# call system call: print string
	la      $a0, in2		# load address of string into $a0
	syscall                 	# run the syscall
	# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s1, $v0      		# store input in $a1 (set arugument of calculator)

	li      $v0, 4				# call system call: print string
	la      $a0, in3		# load address of string into $a0
	syscall              
	# read the input integer in $v0
	li      $v0, 5          	# call system call: read integer
	syscall                 	# run the syscall
	move    $s2, $v0      		# store input in $a2 (set arugument of calculator)
	
	addi $t0, $t0, 1		# initial $t0 = 1
	beq $s0, $t0, M1		# $s0 = 1, execute M1
	addi $t0, $t0, 1		# initial $t0 = 1
	beq $s0, $t0, M2		# $s0 = 2, execute M2
	addi $t0, $t0, 1		# initial $t0 = 1
	beq $s0, $t0, M3		# $s0 = 3, execute M3
M1:
	add $t1, $s1, $s2		# $t1 = $s1 + $s2
	j	printOutput
M2:	
	sub $t1, $s1, $s2		# $t1 = $s1 - $s2
	j	printOutput
M3:	
	mul $t1, $s1, $s2		# $t1 = $s1 * $s2
	j	printOutput
printOutput:
	li      $v0, 4				# call system call: print string
	la      $a0, out		# load address of string into $a0
	syscall 
# print the result of procedure calculator on the console interface
	move 	$a0, $t1			
	li 		$v0, 1				
	syscall 
# exit the program
	li 		$v0, 10				# call system call: exit
	syscall						# run the syscall

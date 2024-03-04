#####################################################################
# Programmer: Jacob St Lawrence
# Last Modified: 03.03.2023
#####################################################################
# Functional Description:
# This program prompts the user to enter a number, then calculates
# the factorial of that number and displays the results
#####################################################################
# Pseudocode:
# 	print promptInput;
#	t0 = input
#	t1 = t0 -1
# loop: if (t1 <= 0) go to exit
#	t0 = t0 * t1
#	t1--
#	jump to loop
# exit: print displayResult
# 	print integer value
#	terminate program
#####################################################################
# Register Usage:
# $v0: Input Value
# $t0: Result Value
# $t1: Decrementing Value
#####################################################################

.data								# start data section
	promptInput:	.asciiz	"Please enter a number: "	# initialize variable to store string for input prompt
	displayResult:	.asciiz	"The factorial is: "		# initialize variable to store string for output message

.text								# start text section

main:								# start main
	li 	$v0, 4						# command to print string
	la 	$a0, promptInput				# load the string for input prompt into the argument for printing
	syscall							# execute the command (print input prompt)

	li 	$v0, 5						# command to read the integer input from the user
	syscall							# execute the command (read input)
	move 	$t0, $v0					# place the input value into a temporary register for later use

	addi	$t1, $t0, -1					# decrement the input value by 1 and place in another temp register

loop:								# begin loop to run through all values to be multiplied
	blez 	$t1, exit					# if decremented value is <= 0, exit loop
	mul	$t0, $t0, $t1					# multiply the input value by the decremented value
	addi	$t1, $t1, -1					# decrement the decremented value by 1
	j 	loop						# jump back to beginning of the loop

exit:								# code to execute upon exiting loop
	li	$v0, 4						# command to print string
	la	$a0, displayResult				# load the string for the output message into the argument for printing
	syscall							# execute the command (print results message)

	li	$v0, 1						# command to print integer value
	la	$a0, ($t0)					# load the resulting integer value
	syscall							# execute the command (print resulting integer)

	li 	$v0, 10						# command to terminate the program
	syscall							# execute the command (terminate program)

								# END OF PROGRAM


.data 0x0
#
# declare global variables here
newline:	.asciiz "\n"

.text 0x3000
.globl main

main:

    ori     $sp, $0, 0x3000     # Initialize stack pointer to the top word below .text
                                # The first value on stack will actually go at 0x2ffc
                                #   because $sp is decremented first.
    addi    $fp, $sp, -4        # Set $fp to the start of main's stack frame

loop:
addi	$v0, $0, 5			# system call 5 is for reading an integer
syscall 				# integer value read is in $v0
add	$a0, $0, $v0			# copy n into $8

beq $a0, $0, end_of_loop                #if n == 0 break

addi	$v0, $0, 5			# system call 5 is for reading an integer
syscall 				# integer value read is in $v0
add	$a1, $0, $v0			# copy k into $8

beq $a1, $0, end_of_loop                #if k == 0 break

jal NchooseK


move $a0, $v0
addi $v0, $0, 1                #system call 1 is for printing integers
syscall  

addi 	$v0, $0, 4  			# system call 4 is for printing a string
la 	$a0, newline 
syscall  
   
beq $0, $0, loop

end_of_loop:

exit_from_main:

    ori     $v0, $0, 10     # System call code 10 for exit
    syscall                 # Exit the program

end_of_main:
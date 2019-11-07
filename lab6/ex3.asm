.data 0x0
  startString:  .asciiz "Converting pixels to grayscale:\n"
  finishString: .asciiz "Finished.\n"
  newline:      .asciiz "\n"
  pixels:       .word   0x00010000, 0x010101, 0x6,      0x3333,
                        0x030c,     0x700853, 0x294999, -1
  end:          .word   -1
.text 0x3000

main:
  addi $v0, $0, 4       	# system call code 4 for printing a string
  la   $a0, startString      	# put address of startString in $a0
  syscall               	# print the string

  lw    $8, end($0)
  add   $9,$0,$0     # i in $9 = 0


while: 
  sll   $10,$9,2     # convert "i" to word offset
  lw    $10,pixels($10)   # load a[i] 
  beq   $10, $8, exit
  
  andi  $a0, $10, 0xFF
  srl   $10, $10, 8
  andi  $a1, $10, 0xFF
  srl   $10, $10, 8
  andi  $a2, $10, 0xFF

  jal rgb_to_gray

  move $11, $v0
  addi $v0, $0, 1    # put 1 in $v0 to indicate which syscall
  add  $a0, $0, $11  # put value to be printed in $a0
  syscall            # and then execute "syscall"

  #print new line
  addi $v0, $0, 4 
  la $a0, newline
  syscall
  # increase i
  addi $9, $9, 1
 
j while

exit:

  addi $v0, $0, 4            	# system call code 4 for printing a string
  la   $a0, finishString   	# put address of finishString in $a0
  syscall               	# print the string

  addi $v0, $0, 10      	# system call code 10 for exit
  syscall               	# exit the program



#---- Procedure rgb_to_gray ----#

rgb_to_gray:            
  add $v0, $0, $0                       
  add $v0, $a0, $a1
  add $v0, $a2, $v0
  div $v0, $v0, 3
  

  jr $ra                # return to main

.data
  AA:     .space 400  		# int AA[100]
  BB:     .space 400  		# int BB[100]
  CC:     .space 400  		# int CC[100]
  m:      .space 4   		# m is an int whose value is at most 10
                     		# actual size of the above matrices is mxm

      # You may add more variables here if you need to
newline:	.asciiz "\n"
space:          .asciiz " "


.text

main:
  addi	$v0, $0, 5			# system call 5 is for reading an integer
  syscall 				# integer value read is in $v0
  add	$8, $0, $v0			# copy m into $8

#read in values for A
 
 add $10, $0, $0     #j (outter loop)
AALoop1:
slt $11, $10, $8           # j < m
beq  $11, $0, AALoop1end   # exit if not true
add $9, $0, $0      #i (inside loop)
 AALoop2:
  slt $11, $9, $8            # i < m (returns 1 if less than and 0 if not less than)
  beq  $11, $0, AALoop2end      # if true loop
  addi $v0, $0, 5
  syscall                    #read integer
  mult $10, $8               #[j*m+i]
  mflo $11
  add $11, $11, $9
  sll $11, $11, 2
  sw $v0, AA($11)            #store $v0 into array
  addi $9, $9, 1             # i++
  j AALoop2
  AALoop2end: 
  
  addi $10, $10, 1           # j++
  j AALoop1	             # loop
 AALoop1end:

#store in values for B
             
 add $10, $0, $0           #j
BBLoop1:
slt $11, $10, $8
 beq  $11, $0, BBLoop1end
add $9, $0, $0             #i
 BBLoop2:
 slt $11, $9, $8
  beq  $11, $0, BBLoop2end
  addi $v0, $0, 5
  syscall  
  mult $10, $8 
  mflo $11
  add $11, $11, $9            #[j*m+i]
  sll $11, $11, 2
  sw $v0, BB($11)
  addi $9, $9, 1
  j BBLoop2
  BBLoop2end: 
  
  addi $10, $10, 1
  j BBLoop1
  BBLoop1end:

#matrix multiplication

 
add $11, $0, $0    #j
CCLoop1:   
slt $12, $11, $8
beq  $12, $0, CCLoop1end
add $10, $0, $0     #i
 CCLoop2:
 slt $12, $10, $8
 beq  $12, $0, CCLoop2end
 add $9, $0, $0       #k
  CCLoop3:
  slt $12, $9, $8
  beq  $12, $0, CCLoop3end
  mult $11, $8       #for AA use [j*m+k]
  mflo $13
  add  $13, $13, $9  
  sll $13, $13, 2         #convert to offset
  lw   $13, AA($13)       #value for AA
  
  mult $9, $8             # for BB use [k*m+i]
  mflo $14
  add  $14, $14, $10 
  sll $14, $14, 2 
  lw   $14, BB($14)       #value for BB
  
  mult $13, $14              #AA * BB
  mflo $13
  
  mult $11, $8                # for CC use [j*m+i]
  mflo $14
  add  $14, $14, $10
  sll $14, $14, 2
  lw $12, CC($14)
  add $13, $13, $12
  sw $13, CC($14)           # store value into CC
  
  addi $9, $9, 1            # k++
  j CCLoop3
  CCLoop3end: 
  
  addi $10, $10, 1          #i++
  j CCLoop2
 CCLoop2end:
 
 addi $11, $11, 1           #j++
 j CCLoop1
CCLoop1end:

# print CC
 
 add $10, $0, $0     #j
Outter:
slt $11, $10, $8
beq  $11, $0, Outterend
add $9, $0, $0      #i
 Inner:   
  slt $11, $9, $8
  beq  $11, $0, Innerend
  mult $10, $8        #[j*m+i]
  mflo $11        
  add  $11, $11, $9
  sll $11, $11, 2
  lw $a0, CC($11)
  addi $v0, $0, 1                #system call 1 is for printing integers
  syscall  
  addi 	$v0, $0, 4              #print a spce in between
  la 	$a0, space
  syscall
  addi $9, $9, 1                 #i++
  j Inner
  Innerend: 
  addi 	$v0, $0, 4  			# system call 4 is for printing a string
  la 	$a0, newline 
  syscall  
  addi $10, $10, 1                #j++
  j Outter
 Outterend:

exit:                     # this is code to terminate the program -- don't mess with this!
  addi $v0, $0, 10      	# system call code 10 for exit
  syscall               	# exit the program


.data 0x0

strings:        .space 10000

.text 0x3000
.globl main

main:
ori     $sp, $0, 0x3000     # Initialize stack pointer to the top word below .text
                                # The first value on stack will actually go at 0x2ffc
                                #   because $sp is decremented first.
addi    $fp, $sp, -4        # Set $fp to the start of main's stack frame

li $v0, 5
syscall            #scan int input
add $t0, $v0, $0   #N ($t0 = N) (LEN)

#scan strings
move $t1, $0
scan_string:
slt $t2, $t1, $t0    # i < N
beq $t2, $0, endofscanstring 
addi $t2, $0, 100
mult $t2, $t1
mflo $t2
la $a0, strings($t2)
li $a1, 100 
li $v0, 8
syscall            #scan string 
addi $t1, $t1, 1
j scan_string
endofscanstring:

## Bubble sort

bubblesort:
move $t1, $0       #outter i ($t1)
move $t2, $0
outter:
addi $t3, $t0, -1       #t3 = N-1
slt $t3, $t1, $t3       # i < N-1
beq $t3, $0, exit_outter  # if 0 exit outterloop       
addi $t2, $t1, 1       #j = i+1
inner:
slt $t3, $t2, $t0      #j < N
beq $t3, $0, exit_inner  # if 0 exit inner loop
addi $t3, $0, 100
mult $t3, $t1
mflo $t3
la $a0, strings($t3)  #string 1  
addi $t3, $0, 100     
mult $t3, $t2
mflo $t3 
la $a1, strings($t3)   #string 2
jal my_compare_strings  #compare
if:
addi $t3, $0, 1
beq $v0, $t3, my_swap_strings   #true
endif:
addi $t2, $t2, 1      #j++
j inner
exit_inner:
addi $t1, $t1, 1        #i++
j outter
exit_outter:
end_bubblesort:



move $t1, $0
printsortedstrings:
slt $t2, $t1, $t0
beq $t2, $0, exit_printsortedstrings  
add $t2, $0, 100
mult $t1, $t2
mflo $t2
la $a0, strings($t2)
ori $v0, $0, 4
syscall
addi $t1, $t1, 1
j printsortedstrings
exit_printsortedstrings:

exit_from_main:
ori     $v0, $0, 10     # System call code 10 for exit
syscall                 # Exit the program
endofmain:

#compare strings

my_compare_strings:
    addi    $sp, $sp, -8        # Make room on stack for saving $ra and $fp
    sw      $ra, 4($sp)         # Save $ra
    sw      $fp, 0($sp)         # Save $fp
    addi    $fp, $sp, 4         # Set $fp to the start of proc1's stack frame

                                # From now on:
                                #     0($fp) --> $ra's saved value
                                #    -4($fp) --> caller's $fp's saved value
                    

  
   addi    $sp, $sp, -16       # e.g., $s0, $s1, $s2, $s3
    sw      $s0, 12($sp)        # Save $s0
    sw      $s1, 8($sp)         # Save $s1
    sw      $s2, 4($sp)         # Save $s2
    sw      $s3, 0($sp)         # Save $s3

                                # From now on:
                                #    -8($fp) --> $s0's saved value
                                #   -12($fp) --> $s1's saved value
                                #   -16($fp) --> $s2's saved value
                                #   -20($fp) --> $s3's saved value

move $s0, $t1
move $s1, $t2
move $s2, $a0
move $s3, $a1

move $t1, $0     #i
compare_loop:
slt $t4, $t1, $t0  #i < LEN
beq $t4, $0, end_compare_loop
lb $t2, strings($a0)
lb $t3, strings($a1)
beqz $t2, null1
beqz $t3, null2
bne $t2, $t3, notequal
addi $t1, $t1, 1
addi $a0, $a0, 1
addi $a1, $a1, 1
j compare_loop

null1:  # if string 1 reaches null
beqz $t3, null2and1
addi $v0, $0, -1
j end_my_compare_strings

null2: # if string 2 reaches null before string1
addi $v0, $0, 1
j end_my_compare_strings

null2and1:
addi $v0, $0, 0
j end_my_compare_strings

notequal:
slt $t4, $t2, $t3   #string1 < string2
beq $t4, $0, greaterthan
addi $v0, $0, -1
j end_my_compare_strings

greaterthan:
addi $v0, $0, 1
j end_my_compare_strings

end_compare_loop:

addi $v0, $0, 0

end_my_compare_strings:

move $t1, $s0
move $t2, $s1
move $a0, $s2
move $a1, $s3
return:
    # =============================================================
    # Restore $sx registers
    lw  $s0,  -8($fp)           # Restore $s0
    lw  $s1, -12($fp)           # Restore $s1
    lw  $s2, -16($fp)           # Restore $s2
    lw  $s3, -20($fp)           # Restore $s3


    # =============================================================
    # Restore $fp, $ra, and shrink stack back to how we found it,
    # and return to caller.

return_from:
    addi    $sp, $fp, 4     # Restore $sp
    lw      $ra, 0($fp)     # Restore $ra
    lw      $fp, -4($fp)    # Restore $fp
    jr      $ra             # Return from procedure

endofcomparestrings:

#swap strings

my_swap_strings:
move $s0, $a0
move $s1, $a1
move $t3, $0        #i
swaploop:
addi $t4, $0, 100
slt $t4, $t3, $t4        # i < 100
beq $t4, $0, end_swaploop
lb $t4, strings($s0)
lb $t5, strings($s1)
sb $t5, strings($s0)
sb $t4, strings($s1)
addi $s0, $s0, 1
addi $s1, $s1, 1   
addi $t3, $t3, 1
j swaploop
end_swaploop:
j endif
end_my_swap_strings:



.text
.globl NchooseK                    # Simply means proc1 can be found by code residing in other files

NchooseK:
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
# NchooseK(n, 0) = 1
# NchooseK(n, n) = 1
beq $a1, $0, kequals
beq $a1, $a0, kequals
      
# NchooseK(n, k) = NchooseK(n-1, k-1) + NchooseK(n-1, k)

# NchooseK(n-1, k) + NchooseK(n-1, k-1) so you don' have to add 1 to the k after subtracting

# use the s registers to store the arguments
addiu $a0, $a0, -1   #subtract 1 from n
move $s0, $a0        
move $s1, $a1        
jal NchooseK         #NchooseK(n-1, k)
move $s2, $v0
move $a0, $s0
addi $a1, $s1, -1
jal NchooseK          #NchooseK(n-1, k-1)
addu $v0, $v0, $s2    # NchooseK(n-1, k) + NchooseK(n-1, k-1)          
j return



kequals:
li $v0, 1

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

 

end_of_NchooseK:






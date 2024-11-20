    .data
A:      .word 1, 2, 3, 4, 5       # Array A with 5 elements
sum:    .word 0                    # Variable sum initialized to 0
msg:    .asciiz "The sum value is: " # Message for final sum output
newline: .asciiz "\n"              # Newline character for formatting

    .text
    .globl main

# summation_3 function: Adds 3 to each element in A and updates sum
summation_3:
    # Arguments: $a0 = base address of A, $a1 = address of sum
    li $t0, 0                    # i = 0 (initialize loop counter)
summation_loop:
    bge $t0, 5, summation_end    # if i >= 5, exit loop

    lw $t1, 0($a1)               # load current value of sum
    addi $t1, $t1, 3             # sum = sum + 3
    sw $t1, 0($a1)               # store updated sum

    sll $t2, $t0, 2              # calculate offset for A[i] (i * 4)
    add $t3, $a0, $t2            # address of A[i]
    lw $t4, 0($t3)               # load A[i]
    addi $t4, $t4, 3             # A[i] = A[i] + 3
    sw $t4, 0($t3)               # store updated A[i]

    addi $t0, $t0, 1             # i++
    j summation_loop             # repeat loop
summation_end:
    jr $ra                       # return to caller

main:
    # Load base address of A and sum into $a0 and $a1 for function call
    la $a0, A                    # load base address of A into $a0
    la $a1, sum                  # load address of sum into $a1

    # Loop 1: Print initial values of A
    li $t0, 0                    # i = 0 (initialize loop counter)
print_initial:
    bge $t0, 5, call_summation   # if i >= 5, exit loop and call summation_3
    sll $t1, $t0, 2              # calculate offset for A[i] (i * 4)
    add $t2, $a0, $t1            # address of A[i]
    lw $a0, 0($t2)               # load A[i] into $a0 for printing
    li $v0, 1                    # syscall code for print_int
    syscall                      # print A[i]
    
    # Print newline
    la $a0, newline              # load newline character
    li $v0, 4                    # syscall code for print_string
    syscall                      # print newline
    
    addi $t0, $t0, 1             # i++
    j print_initial              # repeat loop

# Call summation_3 function
call_summation:
    jal summation_3              # call summation_3(A, sum)

    # Loop 2: Print modified values of A
    li $t0, 0                    # i = 0
print_modified:
    bge $t0, 5, print_sum        # if i >= 5, exit loop and print final sum
    sll $t1, $t0, 2              # calculate offset for A[i] (i * 4)
    add $t2, $a0, $t1            # address of A[i]
    lw $a0, 0($t2)               # load A[i] into $a0 for printing
    li $v0, 1                    # syscall code for print_int
    syscall                      # print A[i]

    # Print newline
    la $a0, newline              # load newline character
    li $v0, 4                    # syscall code for print_string
    syscall                      # print newline

    addi $t0, $t0, 1             # i++
    j print_modified             # repeat loop

# Print the final value of sum
print_sum:
    la $a0, msg                  # load message address
    li $v0, 4                    # syscall code for print_string
    syscall                      # print "The sum value is: "

    lw $a0, 0($a1)               # load final sum value into $a0
    li $v0, 1                    # syscall code for print_int
    syscall                      # print sum

    li $v0, 10                   # syscall code for exit
    syscall                      # exit program


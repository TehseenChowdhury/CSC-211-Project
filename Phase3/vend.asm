.data
products: .asciiz "\n1: Water ($1)\n2: Snacks ($3)\n3: Sandwiches ($5)\n4: Meals ($7)\n-1: Exit\n"
balance_prompt: .asciiz "\nEnter your initial balance: "
option_prompt: .asciiz "\nChoose an option: "
insufficient_balance: .asciiz "\nNot enough balance for this item. Choose another option."
remaining_balance: .asciiz "\nRemaining balance: $"
exit_message: .asciiz "\nExiting. Your remaining balance is: $"

prices: .word 1, 3, 5, 7  # Prices of Water, Snacks, Sandwiches, and Meals

.text
main:
    # Prompt user for balance
    li $v0, 4
    la $a0, balance_prompt
    syscall

    li $v0, 5
    syscall
    move $t0, $v0  # $t0 = balance

vending_machine:
    # Display product options
    li $v0, 4
    la $a0, products
    syscall

    # Prompt user for option
    li $v0, 4
    la $a0, option_prompt
    syscall

    li $v0, 5
    syscall
    move $t1, $v0  # $t1 = selected option

    # Exit if user selects -1
    li $t2, -1
    beq $t1, $t2, exit

    # Validate option range (1 to 4)
    blt $t1, 1, vending_machine
    bgt $t1, 4, vending_machine

    # Get the price of the selected product
    la $t3, prices
    sub $t1, $t1, 1  # Adjust index to 0-based
    sll $t1, $t1, 2  # Multiply index by 4 (size of word)
    add $t3, $t3, $t1
    lw $t4, 0($t3)  # $t4 = price of the selected item

    # Check if balance is sufficient
    blt $t0, $t4, insufficient_funds

    # Deduct price from balance
    sub $t0, $t0, $t4

    # Display remaining balance
    li $v0, 4
    la $a0, remaining_balance
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    j vending_machine

insufficient_funds:
    # Inform user of insufficient balance
    li $v0, 4
    la $a0, insufficient_balance
    syscall
    j vending_machine

exit:
    # Display remaining balance on exit
    li $v0, 4
    la $a0, exit_message
    syscall

    li $v0, 1
    move $a0, $t0
    syscall

    li $v0, 10  # Exit program
    syscall

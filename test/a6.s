.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
li $v0, 5 # 6
syscall # 6
li $v0, 5 # 7
syscall # 7
sw $v0, -8($sp) # 7
li $v0, 5 # 8
syscall # 8
sw $v0, -4($sp) # 8
lw $t0, -8($sp) # 9
lw $t1, -4($sp) # 9
move $a0, $t0 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, space # 9
syscall # 9
move $a0, $t1 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, enter # 9
syscall # 9
move $a3, $zero # 10
move $v0, $a3 # 10
j $ra # 10
li $v0, 10 # 10
syscall # 10


.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
move $v1, $ra
move $ra, $v1 # 3
li $v0, 5 # 6
syscall # 6
move $t0, $v0 # 6
li $v0, 5 # 7
syscall # 7
move $t0, $v0 # 7
sw $t0, -4($sp) # 7
li $v0, 5 # 8
syscall # 8
move $t0, $v0 # 8
sw $t0, -8($sp) # 8
lw $t0, -4($sp) # 9
lw $t1, -8($sp) # 9
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


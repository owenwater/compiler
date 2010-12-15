.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
li $t0, 3 # 2
sw $t0, -4($s7) # 2
li $t0, 4 # 6
sw $t0, -8($s7) # 6
lw $t0, -4($s7) # 7
lw $t1, -8($s7) # 7
move $a0, $t0 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, space # 7
syscall # 7
move $a0, $t1 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, enter # 7
syscall # 7
sw $ra, -4($sp) # 8
subu $sp, 4 # 8
li $t0, 5 # 9
sw $t0, -4($s7) # 9
lw $t0, -4($s7) # 10
lw $t1, -8($s7) # 10
move $a0, $t0 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
move $a0, $t1 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, enter # 10
syscall # 10
addu $sp, 4 # 11
lw $ra, -4($sp) # 11
move $a3, $zero # 12
move $v0, $a3 # 12
j $ra # 12
li $v0, 10 # 12
syscall # 12


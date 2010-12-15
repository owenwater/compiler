.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
li $t0, 2 # 6
sw $t0, -8($sp) # 6
sw $ra, -12($sp) # 7
subu $sp, 12 # 7
li $t0, 3 # 9
sw $t0, -4($sp) # 9
lw $t0, -4($sp) # 10
lw $t1, -4($sp) # 10
add $t0, $t0, $t1 # 10
sw $t0, 8($sp) # 10
lw $t0, -4($sp) # 11
lw $t1, 8($sp) # 11
move $a0, $t0 # 11
li $v0, 1 # 11
syscall # 11
li $v0, 4
la $a0, space # 11
syscall # 11
move $a0, $t1 # 11
li $v0, 1 # 11
syscall # 11
li $v0, 4
la $a0, enter # 11
syscall # 11
addu $sp, 12 # 12
lw $ra, -12($sp) # 12
sw $ra, -12($sp) # 13
subu $sp, 12 # 13
lw $t0, 4($sp) # 14
lw $t1, 8($sp) # 14
move $a0, $t0 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, space # 14
syscall # 14
move $a0, $t1 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, enter # 14
syscall # 14
addu $sp, 12 # 15
lw $ra, -12($sp) # 15
lw $t0, -8($sp) # 16
lw $t1, -4($sp) # 16
move $a0, $t0 # 16
li $v0, 1 # 16
syscall # 16
li $v0, 4
la $a0, space # 16
syscall # 16
move $a0, $t1 # 16
li $v0, 1 # 16
syscall # 16
li $v0, 4
la $a0, enter # 16
syscall # 16
move $a3, $zero # 17
move $v0, $a3 # 17
j $ra # 17
li $v0, 10 # 17
syscall # 17


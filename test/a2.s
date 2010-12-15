.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
subu $sp, 0 # 4
li $t0, 2 # 6
sw $t0, -8($sp) # 6
subu $sp, 8 # 7
li $t0, 3 # 9
sw $t0, -4($sp) # 9
lw $t0, -4($sp) # 10
lw $t1, -4($sp) # 10
add $t0, $t0, $t1 # 10
sw $t0, 4($sp) # 10
lw $t0, -4($sp) # 11
lw $t1, 4($sp) # 11
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
addu $sp, 8 # 12
subu $sp, 8 # 13
lw $t0, 0($sp) # 14
lw $t1, 4($sp) # 14
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
addu $sp, 8 # 15
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
addu $sp, 0 # 17
li $v0, 10 # 17
syscall # 17


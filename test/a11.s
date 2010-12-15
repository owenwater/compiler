.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
li $t0, 3 # 2
sw $t0, -4($sp) # 2
subu $sp, 8 # 5
li $t0, 4 # 6
sw $t0, 0($sp) # 6
lw $t0, 4($sp) # 7
lw $t1, 0($sp) # 7
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
subu $sp, 0 # 8
li $t0, 5 # 9
sw $t0, 4($sp) # 9
lw $t0, 4($sp) # 10
lw $t1, 0($sp) # 10
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
addu $sp, 0 # 11
addu $sp, 8 # 12
li $v0, 10 # 12
syscall # 12


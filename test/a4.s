.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
subu $sp, 0 # 4
li $t0, 155 # 6
sw $t0, -8($sp) # 6
li $t0, 3 # 7
sw $t0, -4($sp) # 7
lw $t0, -8($sp) # 8
lw $t1, -4($sp) # 8
sllv $t0, $t0, $t1 # 8
lw $t1, -8($sp) # 8
lw $t2, -4($sp) # 8
srlv $t1, $t1, $t2 # 8
move $a0, $t0 # 8
li $v0, 1 # 8
syscall # 8
li $v0, 4
la $a0, space # 8
syscall # 8
move $a0, $t1 # 8
li $v0, 1 # 8
syscall # 8
li $v0, 4
la $a0, enter # 8
syscall # 8
addu $sp, 0 # 9
li $v0, 10 # 9
syscall # 9


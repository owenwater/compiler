.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 

subu $sp, 0
li $t0, 155
sw $t0, 8($sp)
li $t0, 3
sw $t0, 4($sp)
lw $t0, 8($sp)
lw $t1, 4($sp)
sllv $t0, $t0, $t1
lw $t1, 8($sp)
lw $t2, 4($sp)
srlv $t1, $t1, $t2
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, space
syscall
move $a0, $t1
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall

addu $sp, 0

li $v0, 10
syscall


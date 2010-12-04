.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
li $t0, 3
sw $t0, 4($sp)

subu $sp, 8
li $t0, 4
sw $t0, 16($sp)
lw $t0, 12($sp)
lw $t1, 16($sp)
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

subu $sp, 0
li $t0, 5
sw $t0, 12($sp)
lw $t0, 12($sp)
lw $t1, 16($sp)
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

addu $sp, 8

li $v0, 10
syscall


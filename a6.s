.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
subu $sp, 0
main:
li $v0, 5
syscall
li $v0, 5
syscall
sw $v0, 8($sp)
li $v0, 5
syscall
sw $v0, 4($sp)
lw $t0, 8($sp)
lw $t1, 4($sp)
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


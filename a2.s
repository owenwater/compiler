.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
subu $sp, 0
main:
li $t0, 2
sw $t0, 8($sp)
subu $sp, 8
li $t0, 3
sw $t0, 4($sp)
lw $t0, 4($sp)
lw $t1, 4($sp)
add $t2, $t0, $t1
sw $t2, 12($sp)
lw $t0, 4($sp)
lw $t1, 12($sp)
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
addu $sp, 8

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


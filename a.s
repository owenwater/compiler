.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main:
subu $sp, 0
li $t0, 1
li $t1, 2
li $t2, 3
mult $t1, $t2
mflo $t3
add $t1, $t0, $t3
li $t0, 4
li $t2, 5
sub $t2, $0, $t2
li $t3, 6
add $t4, $t2, $t3
mult $t0, $t4
mflo $t2
li $t0, 7
mult $t2, $t0
mflo $t3
add $t0, $t1, $t3
sw $t0, 8($sp)
lw $t0, 8($sp)
lw $t1, 8($sp)
add $t2, $t0, $t1
sw $t2, 4($sp)
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
li $v0, 4
la $a0, str0
syscall
li $v0, 4
la $a0, enter
syscall
addu $sp, 0
li $v0, 10
syscall
str0:
.asciiz "h"


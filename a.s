.data

.text
.globl main

main:
li $t0, 1
beq $t0, $zero, 2
li $t0, 0
j 1
li $t0, 1
move $a0, $t0
li $v0, 1;
syscall

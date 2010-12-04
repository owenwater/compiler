.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main:

subu $sp, 0
li $t0, 0
sw $t0, 4($sp)
loop_begin0:
lw $t0, 4($sp)
li $t1, 10
blt $t0, $t1, cmp0
li $t0, 0
j cmp_end0
cmp0:
li $t0, 1
cmp_end0:

beq $t0, $zero, loop_end0
sw $t0, 8($sp)
subu $sp, 8
lw $t0, 12($sp)
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall

lw $t0, 12($sp)
li $t1, 1
add $t0, $t0, $t1
sw $t0, 12($sp)
addu $sp, 8
lw $t0, 8($sp)

j loop_begin0
loop_end0:
addu $sp, 0

li $v0, 10
syscall


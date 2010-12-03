.data
space:
.asciiz " "
enter:
.asciiz "\n"
str0:
.asciiz "True"

str1:
.asciiz "False"

.text
.globl main
subu $sp, 0
main:
li $t0, 1
li $t1, 0
or $t2, $t0, $t1
sw $t2, 4($sp)
subu $sp, 4
sw $t2, 4($sp)
subu $sp, 4
beq $t2, $zero, else3
then3:
li $t0, 0
li $t1, 1
li $t2, 0
and $t3, $t1, $t2
or $t1, $t0, $t3
sw $t1, 4($sp)
subu $sp, 4
sw $t1, 4($sp)
subu $sp, 4
beq $t1, $zero, else2
then2:
li $v0, 4
la $a0, str0
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, enter
syscall
addu $sp, 4
lw $t1, 4($sp)

j end2
else2:
li $t0, 1
li $t1, 1
and $t2, $t0, $t1
li $t0, 1
li $t1, 0
and $t3, $t0, $t1
or $t0, $t2, $t3
sw $t0, 4($sp)
subu $sp, 4
beq $t0, $zero, end0
then0:
li $t0, 1
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall
addu $sp, 4
lw $t0, 4($sp)

end0:
li $t1, 0
li $t2, 0
and $t3, $t1, $t2
sw $t0, 4($sp)
sw $t3, 8($sp)
subu $sp, 8
beq $t3, $zero, end1
then1:
li $t0, 2
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall
addu $sp, 8
lw $t0, 4($sp)
lw $t3, 8($sp)

end1:
addu $sp, 4
lw $t1, 4($sp)

end2:
addu $sp, 4
lw $t2, 4($sp)

j end3
else3:
li $v0, 4
la $a0, str1
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, enter
syscall
addu $sp, 4
lw $t2, 4($sp)

end3:
addu $sp, 0

li $v0, 10
syscall


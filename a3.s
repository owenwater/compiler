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
li $t1, 1
xor $t0, $t1, $t0
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
li $t1, 1
li $t2, 1
xor $t1, $t2, $t1
li $t2, 0
li $t3, 1
xor $t2, $t3, $t2
or $t1, $t1, $t2
sw $t0, 4($sp)
sw $t1, 8($sp)
subu $sp, 8
sw $t0, 4($sp)
sw $t1, 8($sp)
subu $sp, 8
beq $t1, $zero, else4
then4:
li $t0, 0
li $t1, 1
li $t2, 0
and $t1, $t1, $t2
or $t0, $t0, $t1
sw $t0, 4($sp)
subu $sp, 4
sw $t0, 4($sp)
subu $sp, 4
beq $t0, $zero, else3
then3:
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
lw $t0, 4($sp)

j end3
else3:
li $t0, 1
li $t1, 1
and $t0, $t0, $t1
li $t1, 1
li $t2, 0
and $t1, $t1, $t2
or $t0, $t0, $t1
sw $t0, 4($sp)
subu $sp, 4
beq $t0, $zero, end1
then1:
li $t0, 1
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall
addu $sp, 4
lw $t0, 4($sp)

end1:
li $t1, 0
li $t2, 1
xor $t1, $t2, $t1
li $t2, 0
and $t1, $t1, $t2
sw $t0, 4($sp)
sw $t1, 8($sp)
subu $sp, 8
beq $t1, $zero, end2
then2:
li $t0, 2
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall
addu $sp, 8
lw $t0, 4($sp)
lw $t1, 8($sp)

end2:
addu $sp, 4
lw $t0, 4($sp)

end3:
addu $sp, 8
lw $t0, 4($sp)
lw $t1, 8($sp)

j end4
else4:
li $v0, 4
la $a0, str1
syscall
li $v0, 4
la $a0, space
syscall
li $v0, 4
la $a0, enter
syscall
addu $sp, 8
lw $t0, 4($sp)
lw $t1, 8($sp)

end4:
addu $sp, 0

li $v0, 10
syscall


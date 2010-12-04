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
main:

subu $sp, 0
li $t0, 1
xori $t0, $t0, 1

beq $t0, $zero, end_if0
then0:
sw $t0, 4($sp)
subu $sp, 4
li $t0, 1
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall

addu $sp, 4
lw $t0, 4($sp)

end_if0:
li $t0, 1
xori $t0, $t0, 1
li $t1, 0
xori $t1, $t1, 1
or $t0, $t0, $t1

beq $t0, $zero, else4
then4:
sw $t0, 4($sp)
subu $sp, 4
li $t0, 0
li $t1, 1
li $t2, 0
and $t1, $t1, $t2
or $t0, $t0, $t1

beq $t0, $zero, else3
then3:
sw $t0, 4($sp)
subu $sp, 4
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

j end_if3
else3:
sw $t0, 4($sp)
subu $sp, 4
li $t0, 1
li $t1, 1
and $t0, $t0, $t1
li $t1, 1
li $t2, 0
and $t1, $t1, $t2
or $t0, $t0, $t1

beq $t0, $zero, end_if1
then1:
sw $t0, 4($sp)
subu $sp, 4
li $t0, 1
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall

addu $sp, 4
lw $t0, 4($sp)

end_if1:
li $t0, 0
xori $t0, $t0, 1
li $t1, 0
and $t0, $t0, $t1

beq $t0, $zero, end_if2
then2:
sw $t0, 4($sp)
subu $sp, 4
li $t0, 2
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall

addu $sp, 4
lw $t0, 4($sp)

end_if2:
addu $sp, 4
lw $t0, 4($sp)

end_if3:
addu $sp, 4
lw $t0, 4($sp)

j end_if4
else4:
sw $t0, 4($sp)
subu $sp, 4
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
lw $t0, 4($sp)

end_if4:
addu $sp, 0

li $v0, 10
syscall


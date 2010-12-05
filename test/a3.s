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
subu $sp, 0 # 4
li $t0, 1 # 5
xori $t0, $t0, 1 # 5
beq $t0, $zero, end_if0 # 9
then0: # 9
sw $t0, 4($sp) # 6
subu $sp, 4 # 6
li $t0, 1 # 7
move $a0, $t0 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, enter # 7
syscall # 7
addu $sp, 4 # 8
lw $t0, 4($sp) # 8
end_if0: # 9
li $t0, 1 # 9
xori $t0, $t0, 1 # 9
li $t1, 0 # 9
xori $t1, $t1, 1 # 9
or $t0, $t0, $t1 # 9
beq $t0, $zero, else4 # 30
then4: # 30
sw $t0, 4($sp) # 10
subu $sp, 4 # 10
li $t0, 0 # 11
li $t1, 1 # 11
li $t2, 0 # 11
and $t1, $t1, $t2 # 11
or $t0, $t0, $t1 # 11
beq $t0, $zero, else3 # 25
then3: # 25
sw $t0, 4($sp) # 12
subu $sp, 4 # 12
li $v0, 4
la $a0, str0 # 13
syscall # 13
li $v0, 4
la $a0, space # 13
syscall # 13
li $v0, 4
la $a0, enter # 13
syscall # 13
addu $sp, 4 # 14
lw $t0, 4($sp) # 14
j end_if3 # 25
else3: # 25
sw $t0, 4($sp) # 16
subu $sp, 4 # 16
li $t0, 1 # 17
li $t1, 1 # 17
and $t0, $t0, $t1 # 17
li $t1, 1 # 17
li $t2, 0 # 17
and $t1, $t1, $t2 # 17
or $t0, $t0, $t1 # 17
beq $t0, $zero, end_if1 # 21
then1: # 21
sw $t0, 4($sp) # 18
subu $sp, 4 # 18
li $t0, 1 # 19
move $a0, $t0 # 19
li $v0, 1 # 19
syscall # 19
li $v0, 4
la $a0, enter # 19
syscall # 19
addu $sp, 4 # 20
lw $t0, 4($sp) # 20
end_if1: # 21
li $t0, 0 # 21
xori $t0, $t0, 1 # 21
li $t1, 0 # 21
and $t0, $t0, $t1 # 21
beq $t0, $zero, end_if2 # 25
then2: # 25
sw $t0, 4($sp) # 22
subu $sp, 4 # 22
li $t0, 2 # 23
move $a0, $t0 # 23
li $v0, 1 # 23
syscall # 23
li $v0, 4
la $a0, enter # 23
syscall # 23
addu $sp, 4 # 24
lw $t0, 4($sp) # 24
end_if2: # 25
addu $sp, 4 # 25
lw $t0, 4($sp) # 25
end_if3: # 25
addu $sp, 4 # 26
lw $t0, 4($sp) # 26
j end_if4 # 30
else4: # 30
sw $t0, 4($sp) # 28
subu $sp, 4 # 28
li $v0, 4
la $a0, str1 # 29
syscall # 29
li $v0, 4
la $a0, space # 29
syscall # 29
li $v0, 4
la $a0, enter # 29
syscall # 29
addu $sp, 4 # 30
lw $t0, 4($sp) # 30
end_if4: # 30
addu $sp, 0 # 31
li $v0, 10 # 31
syscall # 31


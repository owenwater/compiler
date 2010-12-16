.data
space:
.asciiz " "
enter:
.asciiz "\n"
_str0:
.asciiz "function1"

_str1:
.asciiz "function2"

.text
.globl main
main: 
lui $s7, 0x1001
move $v1, $ra
move $ra, $v1 # 3
la $t0, f1 # 5
sw $ra, -4($sp) # 5
sw $t0, -8($sp) # 5
subu $sp, 8 # 5
sw $t0, -4($sp) # 5
jal g # 5
addu $sp, 8 # 5
lw $ra, -4($sp) # 5
lw $t0, -8($sp) # 5
move $t0, $v0 # 5
la $t0, f2 # 6
sw $ra, -4($sp) # 6
sw $t0, -8($sp) # 6
subu $sp, 8 # 6
sw $t0, -4($sp) # 6
jal g # 6
addu $sp, 8 # 6
lw $ra, -4($sp) # 6
lw $t0, -8($sp) # 6
move $t0, $v0 # 6
la $t0, f1 # 7
la $t1, f2 # 7
move $a0, $t0 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, space # 7
syscall # 7
move $a0, $t1 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, enter # 7
syscall # 7
move $a3, $zero # 8
move $v0, $a3 # 8
j $ra # 8
li $v0, 10 # 8
syscall # 8
f1: # 12
li $v0, 4
la $a0, _str0 # 11
syscall # 11
li $v0, 4
la $a0, space # 11
syscall # 11
li $v0, 4
la $a0, enter # 11
syscall # 11
move $a3, $zero # 12
move $v0, $a3 # 12
j $ra # 12
f2: # 16
li $v0, 4
la $a0, _str1 # 15
syscall # 15
li $v0, 4
la $a0, space # 15
syscall # 15
li $v0, 4
la $a0, enter # 15
syscall # 15
move $a3, $zero # 16
move $v0, $a3 # 16
j $ra # 16
g: # 20
lw $t0, -4($sp) # 19
sw $ra, -8($sp) # 19
sw $t0, -12($sp) # 19
subu $sp, 12 # 19
sw $t0, -4($sp) # 19
jal $t0 # 19
addu $sp, 12 # 19
lw $ra, -8($sp) # 19
lw $t0, -12($sp) # 19
move $t0, $v0 # 19
move $a3, $zero # 20
move $v0, $a3 # 20
j $ra # 20


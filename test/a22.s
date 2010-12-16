.data
space:
.asciiz " "
enter:
.asciiz "\n"
_str0:
.asciiz "==="

_str1:
.asciiz "==="

.text
.globl main
main: 
lui $s7, 0x1001
move $v1, $ra
move $ra, $v1 # 3
li $t0, 3 # 5
sw $t0, -4($sp) # 5
li $t0, 1 # 6
lw $t1, -4($sp) # 6
add $t1, $t1, $t0 # 6
sw $t1, -4($sp) # 6
lw $t0, -4($sp) # 7
move $a0, $t0 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, enter # 7
syscall # 7
li $t0, 1 # 8
li $t1, 1 # 8
lw $t2, -4($sp) # 8
add $t2, $t2, $t1 # 8
sw $t2, -4($sp) # 8
sll $t0, $t0, 2 # 8
sub $sp, $sp, $t0 # 8
sw $t2, -8($sp) # 8
add $sp, $sp, $t0 # 8
lw $t0, -4($sp) # 9
move $a0, $t0 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, enter # 9
syscall # 9
li $v0, 4
la $a0, _str0 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
li $v0, 4
la $a0, enter # 10
syscall # 10
li $t0, 1 # 11
sll $t0, $t0, 2 # 11
sub $sp, $sp, $t0 # 11
lw $t1, -8($sp) # 11
add $sp, $sp, $t0 # 11
move $a0, $t1 # 11
li $v0, 1 # 11
syscall # 11
li $v0, 4
la $a0, enter # 11
syscall # 11
li $t0, 1 # 12
li $t1, 1 # 12
move $t2, $t0 # 12
sll $t0, $t0, 2 # 12
sub $sp, $sp, $t0 # 12
lw $t3, -8($sp) # 12
add $sp, $sp, $t0 # 12
sub $t3, $t3, $t1 # 12
sll $t2, $t2, 2 # 12
sub $sp, $sp, $t2 # 12
sw $t3, -8($sp) # 12
add $sp, $sp, $t2 # 12
li $t0, 1 # 13
sll $t0, $t0, 2 # 13
sub $sp, $sp, $t0 # 13
lw $t1, -8($sp) # 13
add $sp, $sp, $t0 # 13
move $a0, $t1 # 13
li $v0, 1 # 13
syscall # 13
li $v0, 4
la $a0, enter # 13
syscall # 13
li $t0, 1 # 14
li $t1, 1 # 14
move $t2, $t0 # 14
sll $t0, $t0, 2 # 14
sub $sp, $sp, $t0 # 14
lw $t3, -8($sp) # 14
add $sp, $sp, $t0 # 14
sub $t3, $t3, $t1 # 14
sll $t2, $t2, 2 # 14
sub $sp, $sp, $t2 # 14
sw $t3, -8($sp) # 14
add $sp, $sp, $t2 # 14
li $t0, 1 # 15
sll $t0, $t0, 2 # 15
sub $sp, $sp, $t0 # 15
lw $t1, -8($sp) # 15
add $sp, $sp, $t0 # 15
move $a0, $t1 # 15
li $v0, 1 # 15
syscall # 15
li $v0, 4
la $a0, enter # 15
syscall # 15
li $v0, 4
la $a0, _str1 # 16
syscall # 16
li $v0, 4
la $a0, space # 16
syscall # 16
li $v0, 4
la $a0, enter # 16
syscall # 16
li $t0, 0 # 17
li $t1, 0 # 17
sll $t0, $t0, 2 # 17
sub $sp, $sp, $t0 # 17
sw $t1, -8($sp) # 17
add $sp, $sp, $t0 # 17
lw $t0, -4($sp) # 18
li $t1, 0 # 18
sll $t1, $t1, 2 # 18
sub $sp, $sp, $t1 # 18
lw $t2, -8($sp) # 18
add $sp, $sp, $t1 # 18
li $t1, 1 # 18
sll $t1, $t1, 2 # 18
sub $sp, $sp, $t1 # 18
lw $t3, -8($sp) # 18
add $sp, $sp, $t1 # 18
move $a0, $t0 # 18
li $v0, 1 # 18
syscall # 18
li $v0, 4
la $a0, space # 18
syscall # 18
move $a0, $t2 # 18
li $v0, 1 # 18
syscall # 18
li $v0, 4
la $a0, space # 18
syscall # 18
move $a0, $t3 # 18
li $v0, 1 # 18
syscall # 18
li $v0, 4
la $a0, enter # 18
syscall # 18
li $t0, 0 # 19
li $t1, 1 # 19
lw $t2, -4($sp) # 19
add $t2, $t2, $t1 # 19
sw $t2, -4($sp) # 19
li $t1, 1 # 19
sll $t1, $t1, 2 # 19
sub $sp, $sp, $t1 # 19
lw $t3, -8($sp) # 19
add $sp, $sp, $t1 # 19
add $t2, $t2, $t3 # 19
sll $t0, $t0, 2 # 19
sub $sp, $sp, $t0 # 19
sw $t2, -8($sp) # 19
add $sp, $sp, $t0 # 19
lw $t0, -4($sp) # 20
li $t1, 0 # 20
sll $t1, $t1, 2 # 20
sub $sp, $sp, $t1 # 20
lw $t2, -8($sp) # 20
add $sp, $sp, $t1 # 20
li $t1, 1 # 20
sll $t1, $t1, 2 # 20
sub $sp, $sp, $t1 # 20
lw $t3, -8($sp) # 20
add $sp, $sp, $t1 # 20
move $a0, $t0 # 20
li $v0, 1 # 20
syscall # 20
li $v0, 4
la $a0, space # 20
syscall # 20
move $a0, $t2 # 20
li $v0, 1 # 20
syscall # 20
li $v0, 4
la $a0, space # 20
syscall # 20
move $a0, $t3 # 20
li $v0, 1 # 20
syscall # 20
li $v0, 4
la $a0, enter # 20
syscall # 20
li $t0, 2 # 21
lw $t1, -4($sp) # 21
li $t2, 1 # 21
li $t3, 1 # 21
move $t4, $t2 # 21
sll $t2, $t2, 2 # 21
sub $sp, $sp, $t2 # 21
lw $t5, -8($sp) # 21
add $sp, $sp, $t2 # 21
add $t5, $t5, $t3 # 21
sll $t4, $t4, 2 # 21
sub $sp, $sp, $t4 # 21
sw $t5, -8($sp) # 21
add $sp, $sp, $t4 # 21
add $t1, $t1, $t5 # 21
sll $t0, $t0, 2 # 21
sub $sp, $sp, $t0 # 21
sw $t1, -8($sp) # 21
add $sp, $sp, $t0 # 21
lw $t0, -4($sp) # 22
li $t1, 2 # 22
sll $t1, $t1, 2 # 22
sub $sp, $sp, $t1 # 22
lw $t2, -8($sp) # 22
add $sp, $sp, $t1 # 22
li $t1, 1 # 22
sll $t1, $t1, 2 # 22
sub $sp, $sp, $t1 # 22
lw $t3, -8($sp) # 22
add $sp, $sp, $t1 # 22
move $a0, $t0 # 22
li $v0, 1 # 22
syscall # 22
li $v0, 4
la $a0, space # 22
syscall # 22
move $a0, $t2 # 22
li $v0, 1 # 22
syscall # 22
li $v0, 4
la $a0, space # 22
syscall # 22
move $a0, $t3 # 22
li $v0, 1 # 22
syscall # 22
li $v0, 4
la $a0, enter # 22
syscall # 22
move $a3, $zero # 25
move $v0, $a3 # 25
j $ra # 25
li $v0, 10 # 25
syscall # 25


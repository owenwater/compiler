.data
space:
.asciiz " "
enter:
.asciiz "\n"
str0:
.asciiz "Hello World"

.text
.globl main
main: 
lui $s7, 0x1001
li $t0, 1 # 6
li $t1, 2 # 6
li $t2, 3 # 6
mul $t1, $t1, $t2 # 6
add $t0, $t0, $t1 # 6
li $t1, 4 # 6
li $t2, 5 # 6
sub $t2, $0, $t2 # 6
li $t3, 6 # 6
add $t2, $t2, $t3 # 6
mul $t1, $t1, $t2 # 6
li $t2, 7 # 6
mul $t1, $t1, $t2 # 6
add $t0, $t0, $t1 # 6
sw $t0, -4($sp) # 6
lw $t0, -4($sp) # 7
lw $t1, -4($sp) # 7
add $t0, $t0, $t1 # 7
sw $t0, -8($sp) # 7
lw $t0, -4($sp) # 8
lw $t1, -8($sp) # 8
move $a0, $t0 # 8
li $v0, 1 # 8
syscall # 8
li $v0, 4
la $a0, space # 8
syscall # 8
move $a0, $t1 # 8
li $v0, 1 # 8
syscall # 8
li $v0, 4
la $a0, enter # 8
syscall # 8
li $v0, 4
la $a0, str0 # 9
syscall # 9
li $v0, 4
la $a0, space # 9
syscall # 9
li $v0, 4
la $a0, enter # 9
syscall # 9
move $a3, $zero # 10
move $v0, $a3 # 10
j $ra # 10
li $v0, 10 # 10
syscall # 10


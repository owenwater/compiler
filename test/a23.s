.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
move $v1, $ra
move $ra, $v1 # 3
li $t0, 12 # 5
li $t1, 7 # 5
li $t2, 3 # 5
sw $t0, -4($sp) # 5
sw $t1, -8($sp) # 5
sw $t2, -12($sp) # 5
lw $t0, -4($sp) # 6
li $t1, 4 # 6
xor $t0, $t0, $t1 # 6
sw $t0, -8($sp) # 6
lw $t0, -4($sp) # 7
lw $t1, -12($sp) # 7
xor $t1, $t1, $t0 # 7
sw $t1, -12($sp) # 7
lw $t0, -4($sp) # 8
lw $t1, -8($sp) # 8
lw $t2, -12($sp) # 8
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
la $a0, space # 8
syscall # 8
move $a0, $t2 # 8
li $v0, 1 # 8
syscall # 8
li $v0, 4
la $a0, enter # 8
syscall # 8
move $a3, $zero # 9
move $v0, $a3 # 9
j $ra # 9
li $v0, 10 # 9
syscall # 9


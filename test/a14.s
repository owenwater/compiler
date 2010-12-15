.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
li $t0, 11 # 2
sw $t0, -4($s7) # 2
li $t0, 21 # 6
sw $t0, -8($sp) # 6
li $t0, 222 # 7
sw $t0, -4($sp) # 7
lw $t0, -8($sp) # 8
lw $t1, -4($sp) # 8
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
lw $t0, -8($sp) # 9
li $t1, 4 # 9
sw $ra, -12($sp) # 9
sw $t0, -16($sp) # 9
sw $t1, -20($sp) # 9
subu $sp, 20 # 9
sw $t1, -4($sp) # 9
sw $t0, -8($sp) # 9
jal f # 9
addu $sp, 20 # 9
lw $ra, -12($sp) # 9
lw $t0, -16($sp) # 9
lw $t1, -20($sp) # 9
move $t2, $v0 # 9
sw $t2, -8($sp) # 9
lw $t2, -8($sp) # 10
lw $t3, -4($sp) # 10
move $a0, $t2 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
move $a0, $t3 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, enter # 10
syscall # 10
move $a3, $zero # 11
move $v0, $a3 # 11
j $ra # 11
li $v0, 10 # 11
syscall # 11
f: # 16
lw $t0, -8($sp) # 14
lw $t1, -4($sp) # 14
lw $t2, -4($s7) # 14
move $a0, $t0 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, space # 14
syscall # 14
move $a0, $t1 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, space # 14
syscall # 14
move $a0, $t2 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, enter # 14
syscall # 14
lw $t0, -8($sp) # 15
lw $t1, -4($sp) # 15
add $t0, $t0, $t1 # 15
move $a3, $t0 # 15
move $v0, $a3 # 15
j $ra # 15
move $a3, $zero # 16
move $v0, $a3 # 16
j $ra # 16


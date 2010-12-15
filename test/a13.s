.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
li $t0, 4 # 2
sw $t0, -4($s7) # 2
li $t0, 5 # 3
sw $t0, -8($s7) # 3
li $t0, 1 # 7
sw $t0, -8($sp) # 7
li $t0, 2 # 8
sw $t0, -4($sp) # 8
lw $t0, -8($sp) # 9
lw $t1, -4($sp) # 9
lw $t2, -4($s7) # 9
lw $t3, -8($s7) # 9
move $a0, $t0 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, space # 9
syscall # 9
move $a0, $t1 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, space # 9
syscall # 9
move $a0, $t2 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, space # 9
syscall # 9
move $a0, $t3 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, enter # 9
syscall # 9
subu $sp, 8 # 10
li $t0, 11 # 12
sw $t0, -16($sp) # 12
li $t0, 12 # 13
sw $t0, -12($sp) # 13
li $t0, 13 # 14
sw $t0, -8($sp) # 14
li $t0, 14 # 15
sw $t0, -4($sp) # 15
lw $t0, -16($sp) # 16
lw $t1, -12($sp) # 16
lw $t2, -8($sp) # 16
lw $t3, -4($sp) # 16
lw $t4, -4($s7) # 16
lw $t5, -8($s7) # 16
move $a0, $t0 # 16
li $v0, 1 # 16
syscall # 16
li $v0, 4
la $a0, space # 16
syscall # 16
move $a0, $t1 # 16
li $v0, 1 # 16
syscall # 16
li $v0, 4
la $a0, space # 16
syscall # 16
move $a0, $t2 # 16
li $v0, 1 # 16
syscall # 16
li $v0, 4
la $a0, space # 16
syscall # 16
move $a0, $t3 # 16
li $v0, 1 # 16
syscall # 16
li $v0, 4
la $a0, space # 16
syscall # 16
move $a0, $t4 # 16
li $v0, 1 # 16
syscall # 16
li $v0, 4
la $a0, space # 16
syscall # 16
move $a0, $t5 # 16
li $v0, 1 # 16
syscall # 16
li $v0, 4
la $a0, enter # 16
syscall # 16
addu $sp, 8 # 17
addu $sp, 0 # 18
li $v0, 10 # 18
syscall # 18


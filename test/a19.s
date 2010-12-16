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
li $t0, 111 # 2
sw $t0, -4($sp) # 2
jal f # 2
move $t0, $v0 # 2
sw $t0, -4($s7) # 2
move $ra, $v1 # 3
li $t0, 3 # 6
sw $t0, -4($sp) # 6
lw $t0, -4($sp) # 7
move $a0, $t0 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, enter # 7
syscall # 7
lw $t0, -4($sp) # 8
lw $t1, -4($sp) # 8
add $t0, $t0, $t1 # 8
sw $t0, -8($sp) # 8
lw $t0, -4($sp) # 9
lw $t1, -8($sp) # 9
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
la $a0, enter # 9
syscall # 9
li $t0, 13 # 10
sw $t0, -12($sp) # 10
lw $t0, -12($sp) # 11
sw $ra, -16($sp) # 11
sw $t0, -20($sp) # 11
subu $sp, 20 # 11
sw $t0, -4($sp) # 11
jal f # 11
addu $sp, 20 # 11
lw $ra, -16($sp) # 11
lw $t0, -20($sp) # 11
move $t0, $v0 # 11
sw $t0, -16($sp) # 11
lw $t0, -12($sp) # 12
lw $t1, -16($sp) # 12
lw $t2, -4($s7) # 12
move $a0, $t0 # 12
li $v0, 1 # 12
syscall # 12
li $v0, 4
la $a0, space # 12
syscall # 12
move $a0, $t1 # 12
li $v0, 1 # 12
syscall # 12
li $v0, 4
la $a0, space # 12
syscall # 12
move $a0, $t2 # 12
li $v0, 1 # 12
syscall # 12
li $v0, 4
la $a0, enter # 12
syscall # 12
move $a3, $zero # 13
move $v0, $a3 # 13
j $ra # 13
li $v0, 10 # 13
syscall # 13
f: # 17
lw $t0, -4($sp) # 16
li $t1, 1 # 16
add $t0, $t0, $t1 # 16
move $a3, $t0 # 16
move $v0, $a3 # 16
j $ra # 16
move $a3, $zero # 17
move $v0, $a3 # 17
j $ra # 17


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
li $t0, 3 # 5
sw $t0, -4($sp) # 5
addi $t0, $sp, -4 # 6
sw $ra, -8($sp) # 6
sw $t0, -12($sp) # 6
subu $sp, 12 # 6
sw $t0, -4($sp) # 6
jal f # 6
addu $sp, 12 # 6
lw $ra, -8($sp) # 6
lw $t0, -12($sp) # 6
move $t0, $v0 # 6
lw $t0, -4($sp) # 7
addi $t1, $sp, -4 # 7
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
f: # 12
li $t0, 4 # 11
lw $t1, -4($sp) # 11
sw $t0, 0($t1) # 11
move $a3, $zero # 12
move $v0, $a3 # 12
j $ra # 12


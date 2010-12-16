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
li $v0, 5 # 5
syscall # 5
move $t0, $v0 # 5
li $t0, 3 # 6
li $t1, 4 # 6
add $t0, $t0, $t1 # 6
sw $ra, -4($sp) # 7
subu $sp, 4 # 7
jal f # 7
addu $sp, 4 # 7
lw $ra, -4($sp) # 7
move $t0, $v0 # 7
sw $ra, -4($sp) # 8
subu $sp, 4 # 8
jal g # 8
addu $sp, 4 # 8
lw $ra, -4($sp) # 8
move $t0, $v0 # 8
li $v0, 5 # 9
syscall # 9
move $t0, $v0 # 9
li $t0, 1 # 10
li $t1, 1 # 10
sw $t0, -4($sp) # 10
sw $t1, -8($sp) # 10
lw $t0, -4($sp) # 11
lw $t1, -8($sp) # 11
move $a0, $t0 # 11
li $v0, 1 # 11
syscall # 11
li $v0, 4
la $a0, space # 11
syscall # 11
move $a0, $t1 # 11
li $v0, 1 # 11
syscall # 11
li $v0, 4
la $a0, enter # 11
syscall # 11
li $t0, 4 # 12
lw $t1, -8($sp) # 12
sub $t1, $t1, $t0 # 12
sw $t1, -8($sp) # 12
lw $t0, -4($sp) # 12
add $t0, $t0, $t1 # 12
sw $t0, -4($sp) # 12
sw $t0, -12($sp) # 12
lw $t0, -4($sp) # 13
lw $t1, -8($sp) # 13
lw $t2, -12($sp) # 13
move $a0, $t0 # 13
li $v0, 1 # 13
syscall # 13
li $v0, 4
la $a0, space # 13
syscall # 13
move $a0, $t1 # 13
li $v0, 1 # 13
syscall # 13
li $v0, 4
la $a0, space # 13
syscall # 13
move $a0, $t2 # 13
li $v0, 1 # 13
syscall # 13
li $v0, 4
la $a0, enter # 13
syscall # 13
move $a3, $zero # 14
move $v0, $a3 # 14
j $ra # 14
li $v0, 10 # 14
syscall # 14
f: # 18
li $t0, 3 # 17
move $a3, $t0 # 17
move $v0, $a3 # 17
j $ra # 17
move $a3, $zero # 18
move $v0, $a3 # 18
j $ra # 18
g: # 21
move $a3, $zero # 21
move $v0, $a3 # 21
j $ra # 21


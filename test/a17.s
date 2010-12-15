.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
li $t0, 4 # 4
sw $ra, -4($sp) # 4
sw $t0, -8($sp) # 4
subu $sp, 8 # 4
sw $t0, -4($sp) # 4
jal f # 4
addu $sp, 8 # 4
lw $ra, -4($sp) # 4
lw $t0, -8($sp) # 4
move $t1, $v0 # 4
li $t2, 5 # 4
sw $ra, -4($sp) # 4
sw $t0, -8($sp) # 4
sw $t1, -12($sp) # 4
sw $t2, -16($sp) # 4
subu $sp, 16 # 4
sw $t2, -4($sp) # 4
jal f # 4
addu $sp, 16 # 4
lw $ra, -4($sp) # 4
lw $t0, -8($sp) # 4
lw $t1, -12($sp) # 4
lw $t2, -16($sp) # 4
move $t3, $v0 # 4
li $t4, 6 # 4
sw $ra, -4($sp) # 4
sw $t0, -8($sp) # 4
sw $t1, -12($sp) # 4
sw $t2, -16($sp) # 4
sw $t3, -20($sp) # 4
sw $t4, -24($sp) # 4
subu $sp, 24 # 4
sw $t4, -4($sp) # 4
jal f # 4
addu $sp, 24 # 4
lw $ra, -4($sp) # 4
lw $t0, -8($sp) # 4
lw $t1, -12($sp) # 4
lw $t2, -16($sp) # 4
lw $t3, -20($sp) # 4
lw $t4, -24($sp) # 4
move $t5, $v0 # 4
mul $t3, $t3, $t5 # 4
add $t1, $t1, $t3 # 4
move $a0, $t1 # 4
li $v0, 1 # 4
syscall # 4
li $v0, 4
la $a0, enter # 4
syscall # 4
move $a3, $zero # 5
move $v0, $a3 # 5
j $ra # 5
li $v0, 10 # 5
syscall # 5
f: # 9
lw $t0, -4($sp) # 8
lw $t1, -4($sp) # 8
add $t0, $t0, $t1 # 8
move $a3, $t0 # 8
move $v0, $a3 # 8
j $ra # 8
move $a3, $zero # 9
move $v0, $a3 # 9
j $ra # 9


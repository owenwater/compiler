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
li $t0, 0 # 6
sw $t0, -4($sp) # 6
for_begin1: # 15
 # 6
lw $t1, -4($sp) # 6
li $t2, 10 # 6
blt $t1, $t2, cmp0 # 6
li $t1, 0 # 6
j cmp_end0 # 6
cmp0: # 6
li $t1, 1 # 6
cmp_end0: # 6
beq $t1, $zero, loop_end1 # 15
sw $ra, -12($sp) # 7
sw $t0, -16($sp) # 7
sw $t1, -20($sp) # 7
sw $t2, -24($sp) # 7
subu $sp, 24 # 7
li $t0, 1 # 9
sw $t0, -4($sp) # 9
li $t0, 1 # 10
sw $t0, 16($sp) # 10
for_begin0: # 13
 # 10
lw $t1, 16($sp) # 10
lw $t2, 20($sp) # 10
ble $t1, $t2, cmp1 # 10
li $t1, 0 # 10
j cmp_end1 # 10
cmp1: # 10
li $t1, 1 # 10
cmp_end1: # 10
beq $t1, $zero, loop_end0 # 13
sw $t0, -8($sp) # 11
sw $t1, -12($sp) # 11
sw $t2, -16($sp) # 11
subu $sp, 16 # 11
lw $t0, 12($sp) # 12
lw $t1, 32($sp) # 12
mul $t0, $t0, $t1 # 12
sw $t0, 12($sp) # 12
addu $sp, 16 # 13
lw $t0, -8($sp) # 13
lw $t1, -12($sp) # 13
lw $t2, -16($sp) # 13
loop_begin0: # 13
 # 10
lw $t2, 16($sp) # 10
li $t3, 1 # 10
add $t2, $t2, $t3 # 10
sw $t2, 16($sp) # 10
j for_begin0 # 13
loop_end0: # 13
lw $t1, 20($sp) # 14
lw $t3, -4($sp) # 14
move $a0, $t1 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, space # 14
syscall # 14
move $a0, $t3 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, enter # 14
syscall # 14
addu $sp, 24 # 15
lw $ra, -12($sp) # 15
lw $t0, -16($sp) # 15
lw $t1, -20($sp) # 15
lw $t2, -24($sp) # 15
loop_begin1: # 15
 # 6
lw $t2, -4($sp) # 6
li $t3, 1 # 6
add $t2, $t2, $t3 # 6
sw $t2, -4($sp) # 6
j for_begin1 # 15
loop_end1: # 15
move $a3, $zero # 16
move $v0, $a3 # 16
j $ra # 16
li $v0, 10 # 16
syscall # 16


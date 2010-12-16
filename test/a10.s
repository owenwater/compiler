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
for_begin1: # 23
 # 6
lw $t1, -4($sp) # 6
li $t2, 10 # 6
blt $t1, $t2, cmp0 # 6
li $t1, 0 # 6
j cmp_end0 # 6
cmp0: # 6
li $t1, 1 # 6
cmp_end0: # 6
beq $t1, $zero, loop_end1 # 23
sw $ra, -12($sp) # 7
sw $t0, -16($sp) # 7
sw $t1, -20($sp) # 7
sw $t2, -24($sp) # 7
subu $sp, 24 # 7
li $t0, 0 # 9
sw $t0, -4($sp) # 9
loop_begin0: # 22
li $t0, 1 # 10
beq $t0, $zero, loop_end0 # 22
sw $t0, -8($sp) # 11
subu $sp, 8 # 11
lw $t0, 4($sp) # 12
li $t1, 1 # 12
add $t0, $t0, $t1 # 12
sw $t0, 4($sp) # 12
lw $t0, 4($sp) # 13
li $t1, 2 # 13
div $t0, $t1 # 13
mfhi $t0 # 13
li $t1, 0 # 13
beq $t0, $t1, cmp1 # 13
li $t0, 0 # 13
j cmp_end1 # 13
cmp1: # 13
li $t0, 1 # 13
cmp_end1: # 13
beq $t0, $zero, end_if0 # 17
then0: # 17
sw $t0, -4($sp) # 14
subu $sp, 4 # 14
addu $sp, 12 # 15
lw $t0, -8($sp) # 15
j loop_begin0 # 15
addu $sp, 4 # 16
lw $t0, -4($sp) # 16
end_if0: # 17
lw $t0, 4($sp) # 17
lw $t1, 28($sp) # 17
bge $t0, $t1, cmp2 # 17
li $t0, 0 # 17
j cmp_end2 # 17
cmp2: # 17
li $t0, 1 # 17
cmp_end2: # 17
beq $t0, $zero, end_if1 # 21
then1: # 21
sw $t0, -4($sp) # 18
subu $sp, 4 # 18
addu $sp, 12 # 19
lw $t0, -8($sp) # 19
j loop_end0 # 19
addu $sp, 4 # 20
lw $t0, -4($sp) # 20
end_if1: # 21
lw $t0, 28($sp) # 21
lw $t1, 4($sp) # 21
move $a0, $t0 # 21
li $v0, 1 # 21
syscall # 21
li $v0, 4
la $a0, space # 21
syscall # 21
move $a0, $t1 # 21
li $v0, 1 # 21
syscall # 21
li $v0, 4
la $a0, enter # 21
syscall # 21
addu $sp, 8 # 22
lw $t0, -8($sp) # 22
j loop_begin0 # 22
loop_end0: # 22
addu $sp, 24 # 23
lw $ra, -12($sp) # 23
lw $t0, -16($sp) # 23
lw $t1, -20($sp) # 23
lw $t2, -24($sp) # 23
loop_begin1: # 23
 # 6
lw $t2, -4($sp) # 6
li $t3, 1 # 6
add $t2, $t2, $t3 # 6
sw $t2, -4($sp) # 6
j for_begin1 # 23
loop_end1: # 23
move $a3, $zero # 24
move $v0, $a3 # 24
j $ra # 24
li $v0, 10 # 24
syscall # 24


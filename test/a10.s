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
_for_begin1: # 23
 # 6
lw $t0, -4($sp) # 6
li $t1, 10 # 6
blt $t0, $t1, _cmp0 # 6
li $t0, 0 # 6
j _cmp_end0 # 6
_cmp0: # 6
li $t0, 1 # 6
_cmp_end0: # 6
beq $t0, $zero, _loop_end1 # 23
sw $ra, -12($sp) # 7
sw $t0, -16($sp) # 7
subu $sp, 16 # 7
li $t0, 0 # 9
sw $t0, -4($sp) # 9
_loop_begin0: # 22
li $t0, 1 # 10
beq $t0, $zero, _loop_end0 # 22
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
beq $t0, $t1, _cmp1 # 13
li $t0, 0 # 13
j _cmp_end1 # 13
_cmp1: # 13
li $t0, 1 # 13
_cmp_end1: # 13
beq $t0, $zero, _end_if0 # 17
_then0: # 17
sw $t0, -4($sp) # 14
subu $sp, 4 # 14
addu $sp, 12 # 15
lw $t0, -8($sp) # 15
j _loop_begin0 # 15
addu $sp, 4 # 16
lw $t0, -4($sp) # 16
_end_if0: # 17
lw $t0, 4($sp) # 17
lw $t1, 20($sp) # 17
bge $t0, $t1, _cmp2 # 17
li $t0, 0 # 17
j _cmp_end2 # 17
_cmp2: # 17
li $t0, 1 # 17
_cmp_end2: # 17
beq $t0, $zero, _end_if1 # 21
_then1: # 21
sw $t0, -4($sp) # 18
subu $sp, 4 # 18
addu $sp, 12 # 19
lw $t0, -8($sp) # 19
j _loop_end0 # 19
addu $sp, 4 # 20
lw $t0, -4($sp) # 20
_end_if1: # 21
lw $t0, 20($sp) # 21
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
j _loop_begin0 # 22
_loop_end0: # 22
addu $sp, 16 # 23
lw $ra, -12($sp) # 23
lw $t0, -16($sp) # 23
_loop_begin1: # 23
 # 6
lw $t1, -4($sp) # 6
li $t2, 1 # 6
add $t1, $t1, $t2 # 6
sw $t1, -4($sp) # 6
j _for_begin1 # 23
_loop_end1: # 23
move $a3, $zero # 24
move $v0, $a3 # 24
j $ra # 24
li $v0, 10 # 24
syscall # 24


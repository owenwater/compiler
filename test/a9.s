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
_for_begin1: # 15
 # 6
lw $t0, -4($sp) # 6
li $t1, 10 # 6
blt $t0, $t1, _cmp0 # 6
li $t0, 0 # 6
j _cmp_end0 # 6
_cmp0: # 6
li $t0, 1 # 6
_cmp_end0: # 6
beq $t0, $zero, _loop_end1 # 15
sw $ra, -12($sp) # 7
sw $t0, -16($sp) # 7
subu $sp, 16 # 7
li $t0, 1 # 9
sw $t0, -4($sp) # 9
li $t0, 1 # 10
sw $t0, 8($sp) # 10
_for_begin0: # 13
 # 10
lw $t0, 8($sp) # 10
lw $t1, 12($sp) # 10
ble $t0, $t1, _cmp1 # 10
li $t0, 0 # 10
j _cmp_end1 # 10
_cmp1: # 10
li $t0, 1 # 10
_cmp_end1: # 10
beq $t0, $zero, _loop_end0 # 13
sw $t0, -8($sp) # 11
subu $sp, 8 # 11
lw $t0, 4($sp) # 12
lw $t1, 16($sp) # 12
mul $t0, $t0, $t1 # 12
sw $t0, 4($sp) # 12
addu $sp, 8 # 13
lw $t0, -8($sp) # 13
_loop_begin0: # 13
 # 10
lw $t1, 8($sp) # 10
li $t2, 1 # 10
add $t1, $t1, $t2 # 10
sw $t1, 8($sp) # 10
j _for_begin0 # 13
_loop_end0: # 13
lw $t0, 12($sp) # 14
lw $t1, -4($sp) # 14
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
la $a0, enter # 14
syscall # 14
addu $sp, 16 # 15
lw $ra, -12($sp) # 15
lw $t0, -16($sp) # 15
_loop_begin1: # 15
 # 6
lw $t1, -4($sp) # 6
li $t2, 1 # 6
add $t1, $t1, $t2 # 6
sw $t1, -4($sp) # 6
j _for_begin1 # 15
_loop_end1: # 15
move $a3, $zero # 16
move $v0, $a3 # 16
j $ra # 16
li $v0, 10 # 16
syscall # 16


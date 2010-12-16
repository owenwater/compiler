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
_for_begin0: # 11
 # 6
lw $t0, -4($sp) # 6
li $t1, 10 # 6
ble $t0, $t1, _cmp0 # 6
li $t0, 0 # 6
j _cmp_end0 # 6
_cmp0: # 6
li $t0, 1 # 6
_cmp_end0: # 6
beq $t0, $zero, _loop_end0 # 11
sw $ra, -8($sp) # 7
sw $t0, -12($sp) # 7
subu $sp, 12 # 7
lw $t0, 8($sp) # 9
sw $t0, -8($sp) # 9
subu $sp, 8 # 9
sw $t0, -4($sp) # 9
jal f # 9
addu $sp, 8 # 9
lw $t0, -8($sp) # 9
move $t0, $v0 # 9
sw $t0, -4($sp) # 9
lw $t0, 8($sp) # 10
lw $t1, -4($sp) # 10
move $a0, $t0 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
move $a0, $t1 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, enter # 10
syscall # 10
addu $sp, 12 # 11
lw $ra, -8($sp) # 11
lw $t0, -12($sp) # 11
_loop_begin0: # 11
 # 6
lw $t1, -4($sp) # 6
li $t2, 1 # 6
add $t1, $t1, $t2 # 6
sw $t1, -4($sp) # 6
j _for_begin0 # 11
_loop_end0: # 11
move $a3, $zero # 12
move $v0, $a3 # 12
j $ra # 12
li $v0, 10 # 12
syscall # 12
f: # 27
lw $t0, -4($sp) # 15
li $t1, 0 # 15
beq $t0, $t1, _cmp1 # 15
li $t0, 0 # 15
j _cmp_end1 # 15
_cmp1: # 15
li $t0, 1 # 15
_cmp_end1: # 15
beq $t0, $zero, _end_if0 # 19
_then0: # 19
sw $ra, -8($sp) # 16
sw $t0, -12($sp) # 16
subu $sp, 12 # 16
li $t0, 1 # 17
move $a3, $t0 # 17
addu $sp, 12 # 17
lw $ra, -8($sp) # 17
lw $t0, -12($sp) # 17
move $v0, $a3 # 17
j $ra # 17
addu $sp, 12 # 18
lw $ra, -8($sp) # 18
lw $t0, -12($sp) # 18
_end_if0: # 19
lw $t0, -4($sp) # 19
li $t1, 2 # 19
ble $t0, $t1, _cmp2 # 19
li $t0, 0 # 19
j _cmp_end2 # 19
_cmp2: # 19
li $t0, 1 # 19
_cmp_end2: # 19
beq $t0, $zero, _else1 # 26
_then1: # 26
sw $ra, -8($sp) # 20
sw $t0, -12($sp) # 20
subu $sp, 12 # 20
lw $t0, 8($sp) # 21
move $a3, $t0 # 21
addu $sp, 12 # 21
lw $ra, -8($sp) # 21
lw $t0, -12($sp) # 21
move $v0, $a3 # 21
j $ra # 21
addu $sp, 12 # 22
lw $ra, -8($sp) # 22
lw $t0, -12($sp) # 22
j _end_if1 # 26
_else1: # 26
sw $ra, -8($sp) # 24
sw $t0, -12($sp) # 24
subu $sp, 12 # 24
lw $t0, 8($sp) # 25
lw $t1, 8($sp) # 25
li $t2, 1 # 25
sub $t1, $t1, $t2 # 25
sw $t0, -4($sp) # 25
sw $t1, -8($sp) # 25
subu $sp, 8 # 25
sw $t1, -4($sp) # 25
jal f # 25
addu $sp, 8 # 25
lw $t0, -4($sp) # 25
lw $t1, -8($sp) # 25
move $t1, $v0 # 25
mul $t0, $t0, $t1 # 25
move $a3, $t0 # 25
addu $sp, 12 # 25
lw $ra, -8($sp) # 25
lw $t0, -12($sp) # 25
move $v0, $a3 # 25
j $ra # 25
addu $sp, 12 # 26
lw $ra, -8($sp) # 26
lw $t0, -12($sp) # 26
_end_if1: # 26
move $a3, $zero # 27
move $v0, $a3 # 27
j $ra # 27


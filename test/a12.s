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
li $t1, 1 # 6
sll $t0, $t0, 2 # 6
sub $s7, $s7, $t0 # 6
sw $t1, -4($s7) # 6
add $s7, $s7, $t0 # 6
li $t0, 1 # 7
li $t1, 1 # 7
sll $t0, $t0, 2 # 7
sub $s7, $s7, $t0 # 7
sw $t1, -4($s7) # 7
add $s7, $s7, $t0 # 7
li $t0, 2 # 8
sw $t0, -4($sp) # 8
for_begin0: # 11
 # 8
lw $t0, -4($sp) # 8
li $t1, 10 # 8
blt $t0, $t1, cmp0 # 8
li $t0, 0 # 8
j cmp_end0 # 8
cmp0: # 8
li $t0, 1 # 8
cmp_end0: # 8
beq $t0, $zero, loop_end0 # 11
sw $ra, -8($sp) # 9
sw $t0, -12($sp) # 9
subu $sp, 12 # 9
lw $t0, 8($sp) # 10
lw $t1, 8($sp) # 10
li $t2, 1 # 10
sub $t1, $t1, $t2 # 10
sll $t1, $t1, 2 # 10
sub $s7, $s7, $t1 # 10
lw $t2, -4($s7) # 10
add $s7, $s7, $t1 # 10
lw $t1, 8($sp) # 10
li $t3, 2 # 10
sub $t1, $t1, $t3 # 10
sll $t1, $t1, 2 # 10
sub $s7, $s7, $t1 # 10
lw $t3, -4($s7) # 10
add $s7, $s7, $t1 # 10
add $t2, $t2, $t3 # 10
sll $t0, $t0, 2 # 10
sub $s7, $s7, $t0 # 10
sw $t2, -4($s7) # 10
add $s7, $s7, $t0 # 10
addu $sp, 12 # 11
lw $ra, -8($sp) # 11
lw $t0, -12($sp) # 11
loop_begin0: # 11
 # 8
lw $t1, -4($sp) # 8
li $t2, 1 # 8
add $t1, $t1, $t2 # 8
sw $t1, -4($sp) # 8
j for_begin0 # 11
loop_end0: # 11
li $t0, 0 # 12
sw $t0, -4($sp) # 12
for_begin1: # 15
 # 12
lw $t0, -4($sp) # 12
li $t1, 10 # 12
blt $t0, $t1, cmp1 # 12
li $t0, 0 # 12
j cmp_end1 # 12
cmp1: # 12
li $t0, 1 # 12
cmp_end1: # 12
beq $t0, $zero, loop_end1 # 15
sw $ra, -8($sp) # 13
sw $t0, -12($sp) # 13
subu $sp, 12 # 13
lw $t0, 8($sp) # 14
sll $t0, $t0, 2 # 14
sub $s7, $s7, $t0 # 14
lw $t1, -4($s7) # 14
add $s7, $s7, $t0 # 14
move $a0, $t1 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, enter # 14
syscall # 14
addu $sp, 12 # 15
lw $ra, -8($sp) # 15
lw $t0, -12($sp) # 15
loop_begin1: # 15
 # 12
lw $t1, -4($sp) # 12
li $t2, 1 # 12
add $t1, $t1, $t2 # 12
sw $t1, -4($sp) # 12
j for_begin1 # 15
loop_end1: # 15
move $a3, $zero # 16
move $v0, $a3 # 16
j $ra # 16
li $v0, 10 # 16
syscall # 16


.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
subu $sp, 40 # 4
li $t0, 0 # 6
li $t1, 1 # 6
sll $t0, $t0, 2 # 6
add $sp, $sp, $t0 # 6
sw $t1, 44($sp) # 6
sub $sp, $sp, $t0 # 6
li $t0, 1 # 7
li $t1, 1 # 7
sll $t0, $t0, 2 # 7
add $sp, $sp, $t0 # 7
sw $t1, 44($sp) # 7
sub $sp, $sp, $t0 # 7
li $t0, 2 # 8
sw $t0, 4($sp) # 8
for_begin0: # 11
 # 8
lw $t0, 4($sp) # 8
li $t1, 10 # 8
blt $t0, $t1, cmp0 # 8
li $t0, 0 # 8
j cmp_end0 # 8
cmp0: # 8
li $t0, 1 # 8
cmp_end0: # 8
beq $t0, $zero, loop_end0 # 11
sw $t0, 8($sp) # 9
subu $sp, 8 # 9
lw $t0, 12($sp) # 10
lw $t1, 12($sp) # 10
li $t2, 1 # 10
sub $t1, $t1, $t2 # 10
sll $t1, $t1, 2 # 10
add $sp, $sp, $t1 # 10
lw $t2, 52($sp) # 10
sub $sp, $sp, $t1 # 10
lw $t1, 12($sp) # 10
li $t3, 2 # 10
sub $t1, $t1, $t3 # 10
sll $t1, $t1, 2 # 10
add $sp, $sp, $t1 # 10
lw $t3, 52($sp) # 10
sub $sp, $sp, $t1 # 10
add $t2, $t2, $t3 # 10
sll $t0, $t0, 2 # 10
add $sp, $sp, $t0 # 10
sw $t2, 52($sp) # 10
sub $sp, $sp, $t0 # 10
addu $sp, 8 # 11
lw $t0, 8($sp) # 11
loop_begin0: # 11
 # 8
lw $t1, 4($sp) # 8
li $t2, 1 # 8
add $t1, $t1, $t2 # 8
sw $t1, 4($sp) # 8
j for_begin0 # 11
loop_end0: # 11
li $t0, 0 # 12
sw $t0, 4($sp) # 12
for_begin1: # 15
 # 12
lw $t0, 4($sp) # 12
li $t1, 10 # 12
blt $t0, $t1, cmp1 # 12
li $t0, 0 # 12
j cmp_end1 # 12
cmp1: # 12
li $t0, 1 # 12
cmp_end1: # 12
beq $t0, $zero, loop_end1 # 15
sw $t0, 8($sp) # 13
subu $sp, 8 # 13
lw $t0, 12($sp) # 14
sll $t0, $t0, 2 # 14
add $sp, $sp, $t0 # 14
lw $t1, 52($sp) # 14
sub $sp, $sp, $t0 # 14
move $a0, $t1 # 14
li $v0, 1 # 14
syscall # 14
li $v0, 4
la $a0, enter # 14
syscall # 14
addu $sp, 8 # 15
lw $t0, 8($sp) # 15
loop_begin1: # 15
 # 12
lw $t1, 4($sp) # 12
li $t2, 1 # 12
add $t1, $t1, $t2 # 12
sw $t1, 4($sp) # 12
j for_begin1 # 15
loop_end1: # 15
addu $sp, 40 # 16
li $v0, 10 # 16
syscall # 16

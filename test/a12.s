.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 

subu $sp, 40
li $t0, 0
li $t1, 1
sll $t0, $t0, 2
add $sp, $sp, $t0
sw $t1, 44($sp)
sub $sp, $sp, $t0
li $t0, 1
li $t1, 1
sll $t0, $t0, 2
add $sp, $sp, $t0
sw $t1, 44($sp)
sub $sp, $sp, $t0
li $t0, 2
sw $t0, 4($sp)

for_begin0:

lw $t0, 4($sp)
li $t1, 10
blt $t0, $t1, cmp0
li $t0, 0
j cmp_end0
cmp0:
li $t0, 1
cmp_end0:

beq $t0, $zero, loop_end0
sw $t0, 8($sp)
subu $sp, 8
lw $t0, 12($sp)
lw $t1, 12($sp)
li $t2, 1
sub $t1, $t1, $t2
sll $t1, $t1, 2
add $sp, $sp, $t1
lw $t2, 52($sp)
sub $sp, $sp, $t1
lw $t1, 12($sp)
li $t3, 2
sub $t1, $t1, $t3
sll $t1, $t1, 2
add $sp, $sp, $t1
lw $t3, 52($sp)
sub $sp, $sp, $t1
add $t2, $t2, $t3
sll $t0, $t0, 2
add $sp, $sp, $t0
sw $t2, 52($sp)
sub $sp, $sp, $t0
addu $sp, 8
lw $t0, 8($sp)

loop_begin0:

lw $t1, 4($sp)
li $t2, 1
add $t1, $t1, $t2
sw $t1, 4($sp)

j for_begin0
loop_end0:
li $t0, 0
sw $t0, 4($sp)

for_begin1:

lw $t0, 4($sp)
li $t1, 10
blt $t0, $t1, cmp1
li $t0, 0
j cmp_end1
cmp1:
li $t0, 1
cmp_end1:

beq $t0, $zero, loop_end1
sw $t0, 8($sp)
subu $sp, 8
lw $t0, 12($sp)
sll $t0, $t0, 2
add $sp, $sp, $t0
lw $t1, 52($sp)
sub $sp, $sp, $t0
move $a0, $t1
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall

addu $sp, 8
lw $t0, 8($sp)

loop_begin1:

lw $t1, 4($sp)
li $t2, 1
add $t1, $t1, $t2
sw $t1, 4($sp)

j for_begin1
loop_end1:
addu $sp, 40

li $v0, 10
syscall


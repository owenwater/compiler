.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 

subu $sp, 0
li $t0, 0
sw $t0, 8($sp)

for_begin1:

lw $t0, 8($sp)
li $t1, 10
blt $t0, $t1, cmp0
li $t0, 0
j cmp_end0
cmp0:
li $t0, 1
cmp_end0:

beq $t0, $zero, loop_end1
sw $t0, 12($sp)
subu $sp, 12
li $t0, 0
sw $t0, 4($sp)
loop_begin0:
li $t0, 1

beq $t0, $zero, loop_end0
sw $t0, 8($sp)
subu $sp, 8
lw $t0, 12($sp)
li $t1, 1
add $t0, $t0, $t1
sw $t0, 12($sp)
lw $t0, 12($sp)
li $t1, 2
div $t0, $t1
mfhi $t0
li $t1, 0
beq $t0, $t1, cmp1
li $t0, 0
j cmp_end1
cmp1:
li $t0, 1
cmp_end1:

beq $t0, $zero, end_if0
then0:
sw $t0, 4($sp)
subu $sp, 4
addu $sp, 12
lw $t0, 8($sp)
j loop_begin0
addu $sp, 4
lw $t0, 4($sp)

end_if0:
lw $t0, 12($sp)
lw $t1, 28($sp)
bge $t0, $t1, cmp2
li $t0, 0
j cmp_end2
cmp2:
li $t0, 1
cmp_end2:

beq $t0, $zero, end_if1
then1:
sw $t0, 4($sp)
subu $sp, 4
addu $sp, 12
lw $t0, 8($sp)
j loop_end0
addu $sp, 4
lw $t0, 4($sp)

end_if1:
lw $t0, 28($sp)
lw $t1, 12($sp)
move $a0, $t0
li $v0, 1
syscall
li $v0, 4
la $a0, space
syscall
move $a0, $t1
li $v0, 1
syscall
li $v0, 4
la $a0, enter
syscall

addu $sp, 8
lw $t0, 8($sp)

j loop_begin0
loop_end0:
addu $sp, 12
lw $t0, 12($sp)

loop_begin1:

lw $t1, 8($sp)
li $t2, 1
add $t1, $t1, $t2
sw $t1, 8($sp)

j for_begin1
loop_end1:
addu $sp, 0

li $v0, 10
syscall


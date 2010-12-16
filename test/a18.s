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
li $t0, 3 # 2
li $t1, 4 # 2
sw $t1, -4($s7) # 2
sw $t0, -8($s7) # 2
move $ra, $v1 # 3
li $t0, 15 # 5
li $t1, 16 # 5
sw $t0, -4($sp) # 5
sw $t1, -8($sp) # 5
li $t0, 0 # 6
sw $t0, -52($sp) # 6
for_begin0: # 9
 # 6
lw $t0, -52($sp) # 6
li $t1, 10 # 6
blt $t0, $t1, cmp0 # 6
li $t0, 0 # 6
j cmp_end0 # 6
cmp0: # 6
li $t0, 1 # 6
cmp_end0: # 6
beq $t0, $zero, loop_end0 # 9
sw $ra, -56($sp) # 7
sw $t0, -60($sp) # 7
subu $sp, 60 # 7
lw $t0, 8($sp) # 8
lw $t1, 8($sp) # 8
li $t2, 2 # 8
mul $t1, $t1, $t2 # 8
li $t2, 1 # 8
add $t1, $t1, $t2 # 8
sll $t0, $t0, 2 # 8
sub $sp, $sp, $t0 # 8
sw $t1, 48($sp) # 8
add $sp, $sp, $t0 # 8
addu $sp, 60 # 9
lw $ra, -56($sp) # 9
lw $t0, -60($sp) # 9
loop_begin0: # 9
 # 6
lw $t1, -52($sp) # 6
li $t2, 1 # 6
add $t1, $t1, $t2 # 6
sw $t1, -52($sp) # 6
j for_begin0 # 9
loop_end0: # 9
li $t0, 3 # 10
sll $t0, $t0, 2 # 10
sub $sp, $sp, $t0 # 10
lw $t1, -12($sp) # 10
add $sp, $sp, $t0 # 10
li $t0, 7 # 10
sll $t0, $t0, 2 # 10
sub $sp, $sp, $t0 # 10
lw $t2, -12($sp) # 10
add $sp, $sp, $t0 # 10
lw $t0, -4($s7) # 10
lw $t3, -4($sp) # 10
lw $t4, -8($sp) # 10
move $a0, $t1 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
move $a0, $t2 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
move $a0, $t0 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
move $a0, $t3 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
move $a0, $t4 # 10
li $v0, 1 # 10
syscall # 10
li $v0, 4
la $a0, enter # 10
syscall # 10
move $a3, $zero # 11
move $v0, $a3 # 11
j $ra # 11
li $v0, 10 # 11
syscall # 11


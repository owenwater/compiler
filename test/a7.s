.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
li $t0, 0 # 6
sw $t0, -4($sp) # 6
loop_begin0: # 11
lw $t0, -4($sp) # 7
li $t1, 10 # 7
blt $t0, $t1, cmp0 # 7
li $t0, 0 # 7
j cmp_end0 # 7
cmp0: # 7
li $t0, 1 # 7
cmp_end0: # 7
beq $t0, $zero, loop_end0 # 11
sw $ra, -8($sp) # 8
sw $t0, -12($sp) # 8
subu $sp, 12 # 8
lw $t0, 8($sp) # 9
move $a0, $t0 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, enter # 9
syscall # 9
lw $t0, 8($sp) # 10
li $t1, 1 # 10
add $t0, $t0, $t1 # 10
sw $t0, 8($sp) # 10
addu $sp, 12 # 11
lw $ra, -8($sp) # 11
lw $t0, -12($sp) # 11
j loop_begin0 # 11
loop_end0: # 11
move $a3, $zero # 12
move $v0, $a3 # 12
j $ra # 12
li $v0, 10 # 12
syscall # 12


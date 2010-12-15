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
sw $t0, -8($sp) # 6
li $t0, 0 # 7
sw $t0, -4($sp) # 7
loop_begin0: # 15
lw $t0, -4($sp) # 8
li $t1, 10 # 8
blt $t0, $t1, cmp0 # 8
li $t0, 0 # 8
j cmp_end0 # 8
cmp0: # 8
li $t0, 1 # 8
cmp_end0: # 8
beq $t0, $zero, loop_end0 # 15
sw $t0, -12($sp) # 9
subu $sp, 12 # 9
li $t0, 0 # 11
sw $t0, -4($sp) # 11
lw $t0, -4($sp) # 12
lw $t1, 8($sp) # 12
move $a0, $t0 # 12
li $v0, 1 # 12
syscall # 12
li $v0, 4
la $a0, space # 12
syscall # 12
move $a0, $t1 # 12
li $v0, 1 # 12
syscall # 12
li $v0, 4
la $a0, enter # 12
syscall # 12
lw $t0, 8($sp) # 13
li $t1, 1 # 13
add $t0, $t0, $t1 # 13
sw $t0, 8($sp) # 13
lw $t0, -4($sp) # 14
lw $t1, 8($sp) # 14
add $t0, $t0, $t1 # 14
sw $t0, -4($sp) # 14
addu $sp, 12 # 15
lw $t0, -12($sp) # 15
j loop_begin0 # 15
loop_end0: # 15
addu $sp, 0 # 16
li $v0, 10 # 16
syscall # 16


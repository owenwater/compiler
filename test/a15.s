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
li $t0, 3 # 6
sw $ra, -8($sp) # 6
sw $t0, -12($sp) # 6
subu $sp, 12 # 6
sw $t0, -4($sp) # 6
jal f # 6
addu $sp, 12 # 6
lw $ra, -8($sp) # 6
lw $t0, -12($sp) # 6
move $t0, $v0 # 6
sw $t0, -4($sp) # 6
lw $t0, -4($sp) # 7
move $a0, $t0 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, enter # 7
syscall # 7
li $t0, 10 # 8
sw $ra, -8($sp) # 8
sw $t0, -12($sp) # 8
subu $sp, 12 # 8
sw $t0, -4($sp) # 8
jal f # 8
addu $sp, 12 # 8
lw $ra, -8($sp) # 8
lw $t0, -12($sp) # 8
move $t0, $v0 # 8
sw $t0, -4($sp) # 8
lw $t0, -4($sp) # 9
move $a0, $t0 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, enter # 9
syscall # 9
move $a3, $zero # 10
move $v0, $a3 # 10
j $ra # 10
li $v0, 10 # 10
syscall # 10
f: # 21
lw $t0, -4($sp) # 13
li $t1, 5 # 13
blt $t0, $t1, _cmp0 # 13
li $t0, 0 # 13
j _cmp_end0 # 13
_cmp0: # 13
li $t0, 1 # 13
_cmp_end0: # 13
beq $t0, $zero, _else0 # 20
_then0: # 20
sw $ra, -8($sp) # 14
sw $t0, -12($sp) # 14
subu $sp, 12 # 14
li $t0, 1 # 15
move $a3, $t0 # 15
addu $sp, 12 # 15
lw $ra, -8($sp) # 15
lw $t0, -12($sp) # 15
move $v0, $a3 # 15
j $ra # 15
addu $sp, 12 # 16
lw $ra, -8($sp) # 16
lw $t0, -12($sp) # 16
j _end_if0 # 20
_else0: # 20
sw $ra, -8($sp) # 18
sw $t0, -12($sp) # 18
subu $sp, 12 # 18
li $t0, 0 # 19
move $a3, $t0 # 19
addu $sp, 12 # 19
lw $ra, -8($sp) # 19
lw $t0, -12($sp) # 19
move $v0, $a3 # 19
j $ra # 19
addu $sp, 12 # 20
lw $ra, -8($sp) # 20
lw $t0, -12($sp) # 20
_end_if0: # 20
move $a3, $zero # 21
move $v0, $a3 # 21
j $ra # 21


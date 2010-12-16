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
li $t0, 4 # 6
li $t1, 5 # 6
bgt $t0, $t1, _cmp0 # 6
li $t0, 0 # 6
j _cmp_end0 # 6
_cmp0: # 6
li $t0, 1 # 6
_cmp_end0: # 6
sw $t0, -4($sp) # 6
li $t0, 6 # 7
li $t1, 5 # 7
bgt $t0, $t1, _cmp1 # 7
li $t0, 0 # 7
j _cmp_end1 # 7
_cmp1: # 7
li $t0, 1 # 7
_cmp_end1: # 7
sw $t0, -8($sp) # 7
lw $t0, -4($sp) # 8
lw $t1, -8($sp) # 8
move $a0, $t0 # 8
li $v0, 1 # 8
syscall # 8
li $v0, 4
la $a0, space # 8
syscall # 8
move $a0, $t1 # 8
li $v0, 1 # 8
syscall # 8
li $v0, 4
la $a0, enter # 8
syscall # 8
li $t0, 4 # 9
li $t1, 5 # 9
blt $t0, $t1, _cmp2 # 9
li $t0, 0 # 9
j _cmp_end2 # 9
_cmp2: # 9
li $t0, 1 # 9
_cmp_end2: # 9
sw $t0, -4($sp) # 9
li $t0, 6 # 10
li $t1, 5 # 10
blt $t0, $t1, _cmp3 # 10
li $t0, 0 # 10
j _cmp_end3 # 10
_cmp3: # 10
li $t0, 1 # 10
_cmp_end3: # 10
sw $t0, -8($sp) # 10
lw $t0, -4($sp) # 11
lw $t1, -8($sp) # 11
move $a0, $t0 # 11
li $v0, 1 # 11
syscall # 11
li $v0, 4
la $a0, space # 11
syscall # 11
move $a0, $t1 # 11
li $v0, 1 # 11
syscall # 11
li $v0, 4
la $a0, enter # 11
syscall # 11
li $t0, 4 # 12
li $t1, 5 # 12
bge $t0, $t1, _cmp4 # 12
li $t0, 0 # 12
j _cmp_end4 # 12
_cmp4: # 12
li $t0, 1 # 12
_cmp_end4: # 12
sw $t0, -4($sp) # 12
li $t0, 5 # 13
li $t1, 5 # 13
bge $t0, $t1, _cmp5 # 13
li $t0, 0 # 13
j _cmp_end5 # 13
_cmp5: # 13
li $t0, 1 # 13
_cmp_end5: # 13
sw $t0, -8($sp) # 13
lw $t0, -4($sp) # 14
lw $t1, -8($sp) # 14
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
li $t0, 4 # 15
li $t1, 4 # 15
ble $t0, $t1, _cmp6 # 15
li $t0, 0 # 15
j _cmp_end6 # 15
_cmp6: # 15
li $t0, 1 # 15
_cmp_end6: # 15
sw $t0, -4($sp) # 15
li $t0, 6 # 16
li $t1, 5 # 16
ble $t0, $t1, _cmp7 # 16
li $t0, 0 # 16
j _cmp_end7 # 16
_cmp7: # 16
li $t0, 1 # 16
_cmp_end7: # 16
sw $t0, -8($sp) # 16
lw $t0, -4($sp) # 17
lw $t1, -8($sp) # 17
move $a0, $t0 # 17
li $v0, 1 # 17
syscall # 17
li $v0, 4
la $a0, space # 17
syscall # 17
move $a0, $t1 # 17
li $v0, 1 # 17
syscall # 17
li $v0, 4
la $a0, enter # 17
syscall # 17
li $t0, 5 # 18
li $t1, 5 # 18
beq $t0, $t1, _cmp8 # 18
li $t0, 0 # 18
j _cmp_end8 # 18
_cmp8: # 18
li $t0, 1 # 18
_cmp_end8: # 18
sw $t0, -4($sp) # 18
li $t0, 5 # 19
li $t1, 5 # 19
bne $t0, $t1, _cmp9 # 19
li $t0, 0 # 19
j _cmp_end9 # 19
_cmp9: # 19
li $t0, 1 # 19
_cmp_end9: # 19
sw $t0, -8($sp) # 19
lw $t0, -4($sp) # 20
lw $t1, -8($sp) # 20
move $a0, $t0 # 20
li $v0, 1 # 20
syscall # 20
li $v0, 4
la $a0, space # 20
syscall # 20
move $a0, $t1 # 20
li $v0, 1 # 20
syscall # 20
li $v0, 4
la $a0, enter # 20
syscall # 20
li $t0, 4 # 21
li $t1, 5 # 21
beq $t0, $t1, _cmp10 # 21
li $t0, 0 # 21
j _cmp_end10 # 21
_cmp10: # 21
li $t0, 1 # 21
_cmp_end10: # 21
sw $t0, -4($sp) # 21
li $t0, 4 # 22
li $t1, 5 # 22
bne $t0, $t1, _cmp11 # 22
li $t0, 0 # 22
j _cmp_end11 # 22
_cmp11: # 22
li $t0, 1 # 22
_cmp_end11: # 22
sw $t0, -8($sp) # 22
lw $t0, -4($sp) # 23
lw $t1, -8($sp) # 23
move $a0, $t0 # 23
li $v0, 1 # 23
syscall # 23
li $v0, 4
la $a0, space # 23
syscall # 23
move $a0, $t1 # 23
li $v0, 1 # 23
syscall # 23
li $v0, 4
la $a0, enter # 23
syscall # 23
move $a3, $zero # 24
move $v0, $a3 # 24
j $ra # 24
li $v0, 10 # 24
syscall # 24


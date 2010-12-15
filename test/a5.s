.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
lui $s7, 0x1001
li $t0, 4 # 6
li $t1, 5 # 6
bgt $t0, $t1, cmp0 # 6
li $t0, 0 # 6
j cmp_end0 # 6
cmp0: # 6
li $t0, 1 # 6
cmp_end0: # 6
sw $t0, -4($sp) # 6
li $t0, 6 # 7
li $t1, 5 # 7
bgt $t0, $t1, cmp1 # 7
li $t0, 0 # 7
j cmp_end1 # 7
cmp1: # 7
li $t0, 1 # 7
cmp_end1: # 7
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
blt $t0, $t1, cmp2 # 9
li $t0, 0 # 9
j cmp_end2 # 9
cmp2: # 9
li $t0, 1 # 9
cmp_end2: # 9
sw $t0, -4($sp) # 9
li $t0, 6 # 10
li $t1, 5 # 10
blt $t0, $t1, cmp3 # 10
li $t0, 0 # 10
j cmp_end3 # 10
cmp3: # 10
li $t0, 1 # 10
cmp_end3: # 10
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
bge $t0, $t1, cmp4 # 12
li $t0, 0 # 12
j cmp_end4 # 12
cmp4: # 12
li $t0, 1 # 12
cmp_end4: # 12
sw $t0, -4($sp) # 12
li $t0, 5 # 13
li $t1, 5 # 13
bge $t0, $t1, cmp5 # 13
li $t0, 0 # 13
j cmp_end5 # 13
cmp5: # 13
li $t0, 1 # 13
cmp_end5: # 13
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
ble $t0, $t1, cmp6 # 15
li $t0, 0 # 15
j cmp_end6 # 15
cmp6: # 15
li $t0, 1 # 15
cmp_end6: # 15
sw $t0, -4($sp) # 15
li $t0, 6 # 16
li $t1, 5 # 16
ble $t0, $t1, cmp7 # 16
li $t0, 0 # 16
j cmp_end7 # 16
cmp7: # 16
li $t0, 1 # 16
cmp_end7: # 16
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
beq $t0, $t1, cmp8 # 18
li $t0, 0 # 18
j cmp_end8 # 18
cmp8: # 18
li $t0, 1 # 18
cmp_end8: # 18
sw $t0, -4($sp) # 18
li $t0, 5 # 19
li $t1, 5 # 19
bne $t0, $t1, cmp9 # 19
li $t0, 0 # 19
j cmp_end9 # 19
cmp9: # 19
li $t0, 1 # 19
cmp_end9: # 19
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
beq $t0, $t1, cmp10 # 21
li $t0, 0 # 21
j cmp_end10 # 21
cmp10: # 21
li $t0, 1 # 21
cmp_end10: # 21
sw $t0, -4($sp) # 21
li $t0, 4 # 22
li $t1, 5 # 22
bne $t0, $t1, cmp11 # 22
li $t0, 0 # 22
j cmp_end11 # 22
cmp11: # 22
li $t0, 1 # 22
cmp_end11: # 22
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


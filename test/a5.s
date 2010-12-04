.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 

subu $sp, 0
li $t0, 4
li $t1, 5
bgt $t0, $t1, cmp0
li $t0, 0
j cmp_end0
cmp0:
li $t0, 1
cmp_end0:
sw $t0, 8($sp)
li $t0, 6
li $t1, 5
bgt $t0, $t1, cmp1
li $t0, 0
j cmp_end1
cmp1:
li $t0, 1
cmp_end1:
sw $t0, 4($sp)
lw $t0, 8($sp)
lw $t1, 4($sp)
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

li $t0, 4
li $t1, 5
blt $t0, $t1, cmp2
li $t0, 0
j cmp_end2
cmp2:
li $t0, 1
cmp_end2:
sw $t0, 8($sp)
li $t0, 6
li $t1, 5
blt $t0, $t1, cmp3
li $t0, 0
j cmp_end3
cmp3:
li $t0, 1
cmp_end3:
sw $t0, 4($sp)
lw $t0, 8($sp)
lw $t1, 4($sp)
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

li $t0, 4
li $t1, 5
bge $t0, $t1, cmp4
li $t0, 0
j cmp_end4
cmp4:
li $t0, 1
cmp_end4:
sw $t0, 8($sp)
li $t0, 5
li $t1, 5
bge $t0, $t1, cmp5
li $t0, 0
j cmp_end5
cmp5:
li $t0, 1
cmp_end5:
sw $t0, 4($sp)
lw $t0, 8($sp)
lw $t1, 4($sp)
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

li $t0, 4
li $t1, 4
ble $t0, $t1, cmp6
li $t0, 0
j cmp_end6
cmp6:
li $t0, 1
cmp_end6:
sw $t0, 8($sp)
li $t0, 6
li $t1, 5
ble $t0, $t1, cmp7
li $t0, 0
j cmp_end7
cmp7:
li $t0, 1
cmp_end7:
sw $t0, 4($sp)
lw $t0, 8($sp)
lw $t1, 4($sp)
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

li $t0, 5
li $t1, 5
beq $t0, $t1, cmp8
li $t0, 0
j cmp_end8
cmp8:
li $t0, 1
cmp_end8:
sw $t0, 8($sp)
li $t0, 5
li $t1, 5
bne $t0, $t1, cmp9
li $t0, 0
j cmp_end9
cmp9:
li $t0, 1
cmp_end9:
sw $t0, 4($sp)
lw $t0, 8($sp)
lw $t1, 4($sp)
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

li $t0, 4
li $t1, 5
beq $t0, $t1, cmp10
li $t0, 0
j cmp_end10
cmp10:
li $t0, 1
cmp_end10:
sw $t0, 8($sp)
li $t0, 4
li $t1, 5
bne $t0, $t1, cmp11
li $t0, 0
j cmp_end11
cmp11:
li $t0, 1
cmp_end11:
sw $t0, 4($sp)
lw $t0, 8($sp)
lw $t1, 4($sp)
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

addu $sp, 0

li $v0, 10
syscall


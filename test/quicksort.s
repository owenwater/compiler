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
move $ra, $v1 # 4
li $v0, 5 # 7
syscall # 7
move $t0, $v0 # 7
sw $t0, -8($sp) # 7
li $t0, 0 # 8
sw $t0, -4($sp) # 8
for_begin0: # 11
 # 8
lw $t1, -4($sp) # 8
lw $t2, -8($sp) # 8
blt $t1, $t2, cmp0 # 8
li $t1, 0 # 8
j cmp_end0 # 8
cmp0: # 8
li $t1, 1 # 8
cmp_end0: # 8
beq $t1, $zero, loop_end0 # 11
sw $ra, -12($sp) # 9
sw $t0, -16($sp) # 9
sw $t1, -20($sp) # 9
sw $t2, -24($sp) # 9
subu $sp, 24 # 9
lw $t0, 20($sp) # 10
li $v0, 5 # 10
syscall # 10
move $t1, $v0 # 10
sll $t0, $t0, 2 # 10
sub $s7, $s7, $t0 # 10
sw $t1, -4($s7) # 10
add $s7, $s7, $t0 # 10
addu $sp, 24 # 11
lw $ra, -12($sp) # 11
lw $t0, -16($sp) # 11
lw $t1, -20($sp) # 11
lw $t2, -24($sp) # 11
loop_begin0: # 11
 # 8
lw $t2, -4($sp) # 8
li $t3, 1 # 8
add $t2, $t2, $t3 # 8
sw $t2, -4($sp) # 8
j for_begin0 # 11
loop_end0: # 11
lw $t1, -8($sp) # 12
sw $ra, -12($sp) # 12
sw $t0, -16($sp) # 12
sw $t1, -20($sp) # 12
sw $t2, -24($sp) # 12
subu $sp, 24 # 12
sw $t1, -4($sp) # 12
jal sort # 12
addu $sp, 24 # 12
lw $ra, -12($sp) # 12
lw $t0, -16($sp) # 12
lw $t1, -20($sp) # 12
lw $t2, -24($sp) # 12
move $t3, $v0 # 12
move $a3, $zero # 13
move $v0, $a3 # 13
j $ra # 13
li $v0, 10 # 13
syscall # 13
qsort: # 72
lw $t0, -8($sp) # 19
lw $t1, -4($sp) # 19
bge $t0, $t1, cmp1 # 19
li $t0, 0 # 19
j cmp_end1 # 19
cmp1: # 19
li $t0, 1 # 19
cmp_end1: # 19
beq $t0, $zero, end_if0 # 24
then0: # 24
sw $ra, -32($sp) # 20
sw $t0, -36($sp) # 20
subu $sp, 36 # 20
move $a3, $zero # 21
addu $sp, 36 # 21
lw $ra, -32($sp) # 21
lw $t0, -36($sp) # 21
move $v0, $a3 # 21
j $ra # 21
addu $sp, 36 # 22
lw $ra, -32($sp) # 22
lw $t0, -36($sp) # 22
end_if0: # 24
lw $t0, -4($sp) # 24
lw $t1, -8($sp) # 24
sub $t0, $t0, $t1 # 24
li $t1, 16 # 24
ble $t0, $t1, cmp2 # 24
li $t0, 0 # 24
j cmp_end2 # 24
cmp2: # 24
li $t0, 1 # 24
cmp_end2: # 24
beq $t0, $zero, end_if2 # 44
then2: # 44
sw $ra, -32($sp) # 25
sw $t0, -36($sp) # 25
subu $sp, 36 # 25
lw $t0, 28($sp) # 27
sw $t0, -4($sp) # 27
for_begin2: # 40
 # 27
lw $t1, -4($sp) # 27
lw $t2, 32($sp) # 27
ble $t1, $t2, cmp3 # 27
li $t1, 0 # 27
j cmp_end3 # 27
cmp3: # 27
li $t1, 1 # 27
cmp_end3: # 27
beq $t1, $zero, loop_end2 # 40
sw $t0, -12($sp) # 28
sw $t1, -16($sp) # 28
sw $t2, -20($sp) # 28
subu $sp, 20 # 28
lw $t0, 48($sp) # 29
sw $t0, 12($sp) # 29
for_begin1: # 39
 # 29
lw $t1, 12($sp) # 29
lw $t2, 16($sp) # 29
ble $t1, $t2, cmp4 # 29
li $t1, 0 # 29
j cmp_end4 # 29
cmp4: # 29
li $t1, 1 # 29
cmp_end4: # 29
beq $t1, $zero, loop_end1 # 39
sw $t0, -4($sp) # 30
sw $t1, -8($sp) # 30
sw $t2, -12($sp) # 30
subu $sp, 12 # 30
lw $t0, 28($sp) # 31
sll $t0, $t0, 2 # 31
sub $s7, $s7, $t0 # 31
lw $t1, -4($s7) # 31
add $s7, $s7, $t0 # 31
lw $t0, 24($sp) # 31
sll $t0, $t0, 2 # 31
sub $s7, $s7, $t0 # 31
lw $t2, -4($s7) # 31
add $s7, $s7, $t0 # 31
blt $t1, $t2, cmp5 # 31
li $t1, 0 # 31
j cmp_end5 # 31
cmp5: # 31
li $t1, 1 # 31
cmp_end5: # 31
beq $t1, $zero, end_if1 # 39
then1: # 39
sw $t1, -4($sp) # 32
subu $sp, 4 # 32
lw $t0, 32($sp) # 34
sll $t0, $t0, 2 # 34
sub $s7, $s7, $t0 # 34
lw $t1, -4($s7) # 34
add $s7, $s7, $t0 # 34
sw $t1, -4($sp) # 34
lw $t0, 32($sp) # 35
lw $t1, 28($sp) # 35
sll $t1, $t1, 2 # 35
sub $s7, $s7, $t1 # 35
lw $t2, -4($s7) # 35
add $s7, $s7, $t1 # 35
sll $t0, $t0, 2 # 35
sub $s7, $s7, $t0 # 35
sw $t2, -4($s7) # 35
add $s7, $s7, $t0 # 35
lw $t0, 28($sp) # 36
lw $t1, -4($sp) # 36
sll $t0, $t0, 2 # 36
sub $s7, $s7, $t0 # 36
sw $t1, -4($s7) # 36
add $s7, $s7, $t0 # 36
addu $sp, 4 # 37
lw $t1, -4($sp) # 37
end_if1: # 39
addu $sp, 12 # 39
lw $t0, -4($sp) # 39
lw $t1, -8($sp) # 39
lw $t2, -12($sp) # 39
loop_begin1: # 39
 # 29
lw $t2, 12($sp) # 29
li $t3, 1 # 29
add $t2, $t2, $t3 # 29
sw $t2, 12($sp) # 29
j for_begin1 # 39
loop_end1: # 39
addu $sp, 20 # 40
lw $t0, -12($sp) # 40
lw $t1, -16($sp) # 40
lw $t2, -20($sp) # 40
loop_begin2: # 40
 # 27
lw $t2, -4($sp) # 27
li $t3, 1 # 27
add $t2, $t2, $t3 # 27
sw $t2, -4($sp) # 27
j for_begin2 # 40
loop_end2: # 40
move $a3, $zero # 41
addu $sp, 36 # 41
lw $ra, -32($sp) # 41
lw $t0, -36($sp) # 41
move $v0, $a3 # 41
j $ra # 41
addu $sp, 36 # 42
lw $ra, -32($sp) # 42
lw $t0, -36($sp) # 42
end_if2: # 44
lw $t0, -4($sp) # 44
lw $t1, -8($sp) # 44
sub $t0, $t0, $t1 # 44
li $t1, 1 # 44
add $t0, $t0, $t1 # 44
li $t1, 3 # 44
div $t0, $t1 # 44
mflo $t0 # 44
lw $t1, -8($sp) # 44
add $t0, $t0, $t1 # 44
sw $t0, -20($sp) # 44
lw $t0, -20($sp) # 46
sll $t0, $t0, 2 # 46
sub $s7, $s7, $t0 # 46
lw $t1, -4($s7) # 46
add $s7, $s7, $t0 # 46
sw $t1, -28($sp) # 46
lw $t0, -20($sp) # 47
lw $t1, -4($sp) # 47
sll $t1, $t1, 2 # 47
sub $s7, $s7, $t1 # 47
lw $t2, -4($s7) # 47
add $s7, $s7, $t1 # 47
sll $t0, $t0, 2 # 47
sub $s7, $s7, $t0 # 47
sw $t2, -4($s7) # 47
add $s7, $s7, $t0 # 47
lw $t0, -4($sp) # 48
lw $t1, -20($sp) # 48
sll $t1, $t1, 2 # 48
sub $s7, $s7, $t1 # 48
lw $t2, -4($s7) # 48
add $s7, $s7, $t1 # 48
sll $t0, $t0, 2 # 48
sub $s7, $s7, $t0 # 48
sw $t2, -4($s7) # 48
add $s7, $s7, $t0 # 48
lw $t0, -4($sp) # 50
sll $t0, $t0, 2 # 50
sub $s7, $s7, $t0 # 50
lw $t1, -4($s7) # 50
add $s7, $s7, $t0 # 50
sw $t1, -24($sp) # 50
lw $t0, -8($sp) # 52
li $t1, 1 # 52
sub $t0, $t0, $t1 # 52
sw $t0, -12($sp) # 52
lw $t0, -8($sp) # 53
sw $t0, -16($sp) # 53
for_begin3: # 62
 # 53
lw $t1, -16($sp) # 53
lw $t2, -4($sp) # 53
li $t3, 1 # 53
sub $t2, $t2, $t3 # 53
ble $t1, $t2, cmp6 # 53
li $t1, 0 # 53
j cmp_end6 # 53
cmp6: # 53
li $t1, 1 # 53
cmp_end6: # 53
beq $t1, $zero, loop_end3 # 62
sw $ra, -32($sp) # 54
sw $t0, -36($sp) # 54
sw $t1, -40($sp) # 54
sw $t2, -44($sp) # 54
subu $sp, 44 # 54
lw $t0, 28($sp) # 55
sll $t0, $t0, 2 # 55
sub $s7, $s7, $t0 # 55
lw $t1, -4($s7) # 55
add $s7, $s7, $t0 # 55
lw $t0, 20($sp) # 55
ble $t1, $t0, cmp7 # 55
li $t1, 0 # 55
j cmp_end7 # 55
cmp7: # 55
li $t1, 1 # 55
cmp_end7: # 55
beq $t1, $zero, end_if3 # 62
then3: # 62
sw $t1, -4($sp) # 56
subu $sp, 4 # 56
lw $t0, 36($sp) # 57
li $t1, 1 # 57
add $t0, $t0, $t1 # 57
sw $t0, 36($sp) # 57
lw $t0, 36($sp) # 58
sll $t0, $t0, 2 # 58
sub $s7, $s7, $t0 # 58
lw $t1, -4($s7) # 58
add $s7, $s7, $t0 # 58
sw $t1, 20($sp) # 58
lw $t0, 36($sp) # 59
lw $t1, 32($sp) # 59
sll $t1, $t1, 2 # 59
sub $s7, $s7, $t1 # 59
lw $t2, -4($s7) # 59
add $s7, $s7, $t1 # 59
sll $t0, $t0, 2 # 59
sub $s7, $s7, $t0 # 59
sw $t2, -4($s7) # 59
add $s7, $s7, $t0 # 59
lw $t0, 32($sp) # 60
lw $t1, 20($sp) # 60
sll $t0, $t0, 2 # 60
sub $s7, $s7, $t0 # 60
sw $t1, -4($s7) # 60
add $s7, $s7, $t0 # 60
addu $sp, 4 # 61
lw $t1, -4($sp) # 61
end_if3: # 62
addu $sp, 44 # 62
lw $ra, -32($sp) # 62
lw $t0, -36($sp) # 62
lw $t1, -40($sp) # 62
lw $t2, -44($sp) # 62
loop_begin3: # 62
 # 53
lw $t2, -16($sp) # 53
li $t3, 1 # 53
add $t2, $t2, $t3 # 53
sw $t2, -16($sp) # 53
j for_begin3 # 62
loop_end3: # 62
lw $t1, -12($sp) # 64
li $t3, 1 # 64
add $t1, $t1, $t3 # 64
sll $t1, $t1, 2 # 64
sub $s7, $s7, $t1 # 64
lw $t3, -4($s7) # 64
add $s7, $s7, $t1 # 64
sw $t3, -28($sp) # 64
lw $t1, -12($sp) # 65
li $t3, 1 # 65
add $t1, $t1, $t3 # 65
lw $t3, -4($sp) # 65
sll $t3, $t3, 2 # 65
sub $s7, $s7, $t3 # 65
lw $t4, -4($s7) # 65
add $s7, $s7, $t3 # 65
sll $t1, $t1, 2 # 65
sub $s7, $s7, $t1 # 65
sw $t4, -4($s7) # 65
add $s7, $s7, $t1 # 65
lw $t1, -4($sp) # 66
lw $t3, -28($sp) # 66
sll $t1, $t1, 2 # 66
sub $s7, $s7, $t1 # 66
sw $t3, -4($s7) # 66
add $s7, $s7, $t1 # 66
lw $t1, -8($sp) # 68
lw $t3, -12($sp) # 68
sw $ra, -32($sp) # 68
sw $t0, -36($sp) # 68
sw $t1, -40($sp) # 68
sw $t2, -44($sp) # 68
sw $t3, -48($sp) # 68
subu $sp, 48 # 68
sw $t3, -4($sp) # 68
sw $t1, -8($sp) # 68
jal qsort # 68
addu $sp, 48 # 68
lw $ra, -32($sp) # 68
lw $t0, -36($sp) # 68
lw $t1, -40($sp) # 68
lw $t2, -44($sp) # 68
lw $t3, -48($sp) # 68
move $t4, $v0 # 68
lw $t4, -12($sp) # 69
li $t5, 2 # 69
add $t4, $t4, $t5 # 69
lw $t5, -4($sp) # 69
sw $ra, -32($sp) # 69
sw $t0, -36($sp) # 69
sw $t1, -40($sp) # 69
sw $t2, -44($sp) # 69
sw $t3, -48($sp) # 69
sw $t4, -52($sp) # 69
sw $t5, -56($sp) # 69
subu $sp, 56 # 69
sw $t5, -4($sp) # 69
sw $t4, -8($sp) # 69
jal qsort # 69
addu $sp, 56 # 69
lw $ra, -32($sp) # 69
lw $t0, -36($sp) # 69
lw $t1, -40($sp) # 69
lw $t2, -44($sp) # 69
lw $t3, -48($sp) # 69
lw $t4, -52($sp) # 69
lw $t5, -56($sp) # 69
move $t6, $v0 # 69
move $a3, $zero # 71
move $v0, $a3 # 71
j $ra # 71
move $a3, $zero # 72
move $v0, $a3 # 72
j $ra # 72
sort: # 84
li $t0, 0 # 77
lw $t1, -4($sp) # 77
li $t2, 1 # 77
sub $t1, $t1, $t2 # 77
sw $ra, -12($sp) # 77
sw $t0, -16($sp) # 77
sw $t1, -20($sp) # 77
subu $sp, 20 # 77
sw $t1, -4($sp) # 77
sw $t0, -8($sp) # 77
jal qsort # 77
addu $sp, 20 # 77
lw $ra, -12($sp) # 77
lw $t0, -16($sp) # 77
lw $t1, -20($sp) # 77
move $t2, $v0 # 77
li $t2, 0 # 78
sw $t2, -8($sp) # 78
for_begin4: # 81
 # 78
lw $t3, -8($sp) # 78
lw $t4, -4($sp) # 78
blt $t3, $t4, cmp8 # 78
li $t3, 0 # 78
j cmp_end8 # 78
cmp8: # 78
li $t3, 1 # 78
cmp_end8: # 78
beq $t3, $zero, loop_end4 # 81
sw $ra, -12($sp) # 79
sw $t0, -16($sp) # 79
sw $t1, -20($sp) # 79
sw $t2, -24($sp) # 79
sw $t3, -28($sp) # 79
sw $t4, -32($sp) # 79
subu $sp, 32 # 79
lw $t0, 24($sp) # 80
sll $t0, $t0, 2 # 80
sub $s7, $s7, $t0 # 80
lw $t1, -4($s7) # 80
add $s7, $s7, $t0 # 80
move $a0, $t1 # 80
li $v0, 1 # 80
syscall # 80
li $v0, 4
la $a0, enter # 80
syscall # 80
addu $sp, 32 # 81
lw $ra, -12($sp) # 81
lw $t0, -16($sp) # 81
lw $t1, -20($sp) # 81
lw $t2, -24($sp) # 81
lw $t3, -28($sp) # 81
lw $t4, -32($sp) # 81
loop_begin4: # 81
 # 78
lw $t4, -8($sp) # 78
li $t5, 1 # 78
add $t4, $t4, $t5 # 78
sw $t4, -8($sp) # 78
j for_begin4 # 81
loop_end4: # 81
move $a3, $zero # 83
move $v0, $a3 # 83
j $ra # 83
move $a3, $zero # 84
move $v0, $a3 # 84
j $ra # 84


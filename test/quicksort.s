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
_for_begin0: # 11
 # 8
lw $t0, -4($sp) # 8
lw $t1, -8($sp) # 8
blt $t0, $t1, _cmp0 # 8
li $t0, 0 # 8
j _cmp_end0 # 8
_cmp0: # 8
li $t0, 1 # 8
_cmp_end0: # 8
beq $t0, $zero, _loop_end0 # 11
sw $ra, -12($sp) # 9
sw $t0, -16($sp) # 9
subu $sp, 16 # 9
lw $t0, 12($sp) # 10
li $v0, 5 # 10
syscall # 10
move $t1, $v0 # 10
sll $t0, $t0, 2 # 10
sub $s7, $s7, $t0 # 10
sw $t1, -4($s7) # 10
add $s7, $s7, $t0 # 10
addu $sp, 16 # 11
lw $ra, -12($sp) # 11
lw $t0, -16($sp) # 11
_loop_begin0: # 11
 # 8
lw $t1, -4($sp) # 8
li $t2, 1 # 8
add $t1, $t1, $t2 # 8
sw $t1, -4($sp) # 8
j _for_begin0 # 11
_loop_end0: # 11
lw $t0, -8($sp) # 12
sw $ra, -12($sp) # 12
sw $t0, -16($sp) # 12
subu $sp, 16 # 12
sw $t0, -4($sp) # 12
jal sort # 12
addu $sp, 16 # 12
lw $ra, -12($sp) # 12
lw $t0, -16($sp) # 12
move $t0, $v0 # 12
move $a3, $zero # 13
move $v0, $a3 # 13
j $ra # 13
li $v0, 10 # 13
syscall # 13
qsort: # 72
lw $t0, -8($sp) # 19
lw $t1, -4($sp) # 19
bge $t0, $t1, _cmp1 # 19
li $t0, 0 # 19
j _cmp_end1 # 19
_cmp1: # 19
li $t0, 1 # 19
_cmp_end1: # 19
beq $t0, $zero, _end_if0 # 24
_then0: # 24
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
_end_if0: # 24
lw $t0, -4($sp) # 24
lw $t1, -8($sp) # 24
sub $t0, $t0, $t1 # 24
li $t1, 16 # 24
ble $t0, $t1, _cmp2 # 24
li $t0, 0 # 24
j _cmp_end2 # 24
_cmp2: # 24
li $t0, 1 # 24
_cmp_end2: # 24
beq $t0, $zero, _end_if2 # 44
_then2: # 44
sw $ra, -32($sp) # 25
sw $t0, -36($sp) # 25
subu $sp, 36 # 25
lw $t0, 28($sp) # 27
sw $t0, -4($sp) # 27
_for_begin2: # 40
 # 27
lw $t0, -4($sp) # 27
lw $t1, 32($sp) # 27
ble $t0, $t1, _cmp3 # 27
li $t0, 0 # 27
j _cmp_end3 # 27
_cmp3: # 27
li $t0, 1 # 27
_cmp_end3: # 27
beq $t0, $zero, _loop_end2 # 40
sw $t0, -12($sp) # 28
subu $sp, 12 # 28
lw $t0, 40($sp) # 29
sw $t0, 4($sp) # 29
_for_begin1: # 39
 # 29
lw $t0, 4($sp) # 29
lw $t1, 8($sp) # 29
ble $t0, $t1, _cmp4 # 29
li $t0, 0 # 29
j _cmp_end4 # 29
_cmp4: # 29
li $t0, 1 # 29
_cmp_end4: # 29
beq $t0, $zero, _loop_end1 # 39
sw $t0, -4($sp) # 30
subu $sp, 4 # 30
lw $t0, 12($sp) # 31
sll $t0, $t0, 2 # 31
sub $s7, $s7, $t0 # 31
lw $t1, -4($s7) # 31
add $s7, $s7, $t0 # 31
lw $t0, 8($sp) # 31
sll $t0, $t0, 2 # 31
sub $s7, $s7, $t0 # 31
lw $t2, -4($s7) # 31
add $s7, $s7, $t0 # 31
blt $t1, $t2, _cmp5 # 31
li $t1, 0 # 31
j _cmp_end5 # 31
_cmp5: # 31
li $t1, 1 # 31
_cmp_end5: # 31
beq $t1, $zero, _end_if1 # 39
_then1: # 39
sw $t1, -4($sp) # 32
subu $sp, 4 # 32
lw $t0, 16($sp) # 34
sll $t0, $t0, 2 # 34
sub $s7, $s7, $t0 # 34
lw $t1, -4($s7) # 34
add $s7, $s7, $t0 # 34
sw $t1, -4($sp) # 34
lw $t0, 16($sp) # 35
lw $t1, 12($sp) # 35
sll $t1, $t1, 2 # 35
sub $s7, $s7, $t1 # 35
lw $t2, -4($s7) # 35
add $s7, $s7, $t1 # 35
sll $t0, $t0, 2 # 35
sub $s7, $s7, $t0 # 35
sw $t2, -4($s7) # 35
add $s7, $s7, $t0 # 35
lw $t0, 12($sp) # 36
lw $t1, -4($sp) # 36
sll $t0, $t0, 2 # 36
sub $s7, $s7, $t0 # 36
sw $t1, -4($s7) # 36
add $s7, $s7, $t0 # 36
addu $sp, 4 # 37
lw $t1, -4($sp) # 37
_end_if1: # 39
addu $sp, 4 # 39
lw $t0, -4($sp) # 39
_loop_begin1: # 39
 # 29
lw $t1, 4($sp) # 29
li $t2, 1 # 29
add $t1, $t1, $t2 # 29
sw $t1, 4($sp) # 29
j _for_begin1 # 39
_loop_end1: # 39
addu $sp, 12 # 40
lw $t0, -12($sp) # 40
_loop_begin2: # 40
 # 27
lw $t1, -4($sp) # 27
li $t2, 1 # 27
add $t1, $t1, $t2 # 27
sw $t1, -4($sp) # 27
j _for_begin2 # 40
_loop_end2: # 40
move $a3, $zero # 41
addu $sp, 36 # 41
lw $ra, -32($sp) # 41
lw $t0, -36($sp) # 41
move $v0, $a3 # 41
j $ra # 41
addu $sp, 36 # 42
lw $ra, -32($sp) # 42
lw $t0, -36($sp) # 42
_end_if2: # 44
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
_for_begin3: # 62
 # 53
lw $t0, -16($sp) # 53
lw $t1, -4($sp) # 53
li $t2, 1 # 53
sub $t1, $t1, $t2 # 53
ble $t0, $t1, _cmp6 # 53
li $t0, 0 # 53
j _cmp_end6 # 53
_cmp6: # 53
li $t0, 1 # 53
_cmp_end6: # 53
beq $t0, $zero, _loop_end3 # 62
sw $ra, -32($sp) # 54
sw $t0, -36($sp) # 54
subu $sp, 36 # 54
lw $t0, 20($sp) # 55
sll $t0, $t0, 2 # 55
sub $s7, $s7, $t0 # 55
lw $t1, -4($s7) # 55
add $s7, $s7, $t0 # 55
lw $t0, 12($sp) # 55
ble $t1, $t0, _cmp7 # 55
li $t1, 0 # 55
j _cmp_end7 # 55
_cmp7: # 55
li $t1, 1 # 55
_cmp_end7: # 55
beq $t1, $zero, _end_if3 # 62
_then3: # 62
sw $t1, -4($sp) # 56
subu $sp, 4 # 56
lw $t0, 28($sp) # 57
li $t1, 1 # 57
add $t0, $t0, $t1 # 57
sw $t0, 28($sp) # 57
lw $t0, 28($sp) # 58
sll $t0, $t0, 2 # 58
sub $s7, $s7, $t0 # 58
lw $t1, -4($s7) # 58
add $s7, $s7, $t0 # 58
sw $t1, 12($sp) # 58
lw $t0, 28($sp) # 59
lw $t1, 24($sp) # 59
sll $t1, $t1, 2 # 59
sub $s7, $s7, $t1 # 59
lw $t2, -4($s7) # 59
add $s7, $s7, $t1 # 59
sll $t0, $t0, 2 # 59
sub $s7, $s7, $t0 # 59
sw $t2, -4($s7) # 59
add $s7, $s7, $t0 # 59
lw $t0, 24($sp) # 60
lw $t1, 12($sp) # 60
sll $t0, $t0, 2 # 60
sub $s7, $s7, $t0 # 60
sw $t1, -4($s7) # 60
add $s7, $s7, $t0 # 60
addu $sp, 4 # 61
lw $t1, -4($sp) # 61
_end_if3: # 62
addu $sp, 36 # 62
lw $ra, -32($sp) # 62
lw $t0, -36($sp) # 62
_loop_begin3: # 62
 # 53
lw $t1, -16($sp) # 53
li $t2, 1 # 53
add $t1, $t1, $t2 # 53
sw $t1, -16($sp) # 53
j _for_begin3 # 62
_loop_end3: # 62
lw $t0, -12($sp) # 64
li $t1, 1 # 64
add $t0, $t0, $t1 # 64
sll $t0, $t0, 2 # 64
sub $s7, $s7, $t0 # 64
lw $t1, -4($s7) # 64
add $s7, $s7, $t0 # 64
sw $t1, -28($sp) # 64
lw $t0, -12($sp) # 65
li $t1, 1 # 65
add $t0, $t0, $t1 # 65
lw $t1, -4($sp) # 65
sll $t1, $t1, 2 # 65
sub $s7, $s7, $t1 # 65
lw $t2, -4($s7) # 65
add $s7, $s7, $t1 # 65
sll $t0, $t0, 2 # 65
sub $s7, $s7, $t0 # 65
sw $t2, -4($s7) # 65
add $s7, $s7, $t0 # 65
lw $t0, -4($sp) # 66
lw $t1, -28($sp) # 66
sll $t0, $t0, 2 # 66
sub $s7, $s7, $t0 # 66
sw $t1, -4($s7) # 66
add $s7, $s7, $t0 # 66
lw $t0, -8($sp) # 68
lw $t1, -12($sp) # 68
sw $ra, -32($sp) # 68
sw $t0, -36($sp) # 68
sw $t1, -40($sp) # 68
subu $sp, 40 # 68
sw $t1, -4($sp) # 68
sw $t0, -8($sp) # 68
jal qsort # 68
addu $sp, 40 # 68
lw $ra, -32($sp) # 68
lw $t0, -36($sp) # 68
lw $t1, -40($sp) # 68
move $t0, $v0 # 68
lw $t0, -12($sp) # 69
li $t1, 2 # 69
add $t0, $t0, $t1 # 69
lw $t1, -4($sp) # 69
sw $ra, -32($sp) # 69
sw $t0, -36($sp) # 69
sw $t1, -40($sp) # 69
subu $sp, 40 # 69
sw $t1, -4($sp) # 69
sw $t0, -8($sp) # 69
jal qsort # 69
addu $sp, 40 # 69
lw $ra, -32($sp) # 69
lw $t0, -36($sp) # 69
lw $t1, -40($sp) # 69
move $t0, $v0 # 69
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
move $t0, $v0 # 77
li $t0, 0 # 78
sw $t0, -8($sp) # 78
_for_begin4: # 81
 # 78
lw $t0, -8($sp) # 78
lw $t1, -4($sp) # 78
blt $t0, $t1, _cmp8 # 78
li $t0, 0 # 78
j _cmp_end8 # 78
_cmp8: # 78
li $t0, 1 # 78
_cmp_end8: # 78
beq $t0, $zero, _loop_end4 # 81
sw $ra, -12($sp) # 79
sw $t0, -16($sp) # 79
subu $sp, 16 # 79
lw $t0, 8($sp) # 80
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
addu $sp, 16 # 81
lw $ra, -12($sp) # 81
lw $t0, -16($sp) # 81
_loop_begin4: # 81
 # 78
lw $t1, -8($sp) # 78
li $t2, 1 # 78
add $t1, $t1, $t2 # 78
sw $t1, -8($sp) # 78
j _for_begin4 # 81
_loop_end4: # 81
move $a3, $zero # 83
move $v0, $a3 # 83
j $ra # 83
move $a3, $zero # 84
move $v0, $a3 # 84
j $ra # 84


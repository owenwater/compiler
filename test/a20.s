.data
space:
.asciiz " "
enter:
.asciiz "\n"
_str0:
.asciiz "+"

_str1:
.asciiz "-"

_str2:
.asciiz "*"

_str3:
.asciiz "/"

_str4:
.asciiz "%"

_str5:
.asciiz "&"

_str6:
.asciiz "|"

_str7:
.asciiz "<<"

_str8:
.asciiz ">>"

_str9:
.asciiz "arr"

.text
.globl main
main: 
lui $s7, 0x1001
move $v1, $ra
move $ra, $v1 # 3
li $t0, 1 # 5
li $t1, 4 # 5
sw $t0, -4($sp) # 5
sw $t1, -8($sp) # 5
lw $t0, -4($sp) # 7
lw $t1, -8($sp) # 7
move $a0, $t0 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, space # 7
syscall # 7
move $a0, $t1 # 7
li $v0, 1 # 7
syscall # 7
li $v0, 4
la $a0, enter # 7
syscall # 7
li $t0, 4 # 8
sw $t0, -8($sp) # 8
lw $t0, -4($sp) # 9
lw $t1, -8($sp) # 9
add $t1, $t1, $t0 # 9
sw $t1, -8($sp) # 9
li $v0, 4
la $a0, _str0 # 10
syscall # 10
li $v0, 4
la $a0, space # 10
syscall # 10
li $v0, 4
la $a0, enter # 10
syscall # 10
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
sw $t0, -8($sp) # 12
lw $t0, -4($sp) # 13
lw $t1, -8($sp) # 13
sub $t1, $t1, $t0 # 13
sw $t1, -8($sp) # 13
li $v0, 4
la $a0, _str1 # 14
syscall # 14
li $v0, 4
la $a0, space # 14
syscall # 14
li $v0, 4
la $a0, enter # 14
syscall # 14
lw $t0, -4($sp) # 15
lw $t1, -8($sp) # 15
move $a0, $t0 # 15
li $v0, 1 # 15
syscall # 15
li $v0, 4
la $a0, space # 15
syscall # 15
move $a0, $t1 # 15
li $v0, 1 # 15
syscall # 15
li $v0, 4
la $a0, enter # 15
syscall # 15
li $t0, 4 # 16
sw $t0, -8($sp) # 16
lw $t0, -4($sp) # 17
lw $t1, -8($sp) # 17
mul $t1, $t1, $t0 # 17
sw $t1, -8($sp) # 17
li $v0, 4
la $a0, _str2 # 18
syscall # 18
li $v0, 4
la $a0, space # 18
syscall # 18
li $v0, 4
la $a0, enter # 18
syscall # 18
lw $t0, -4($sp) # 19
lw $t1, -8($sp) # 19
move $a0, $t0 # 19
li $v0, 1 # 19
syscall # 19
li $v0, 4
la $a0, space # 19
syscall # 19
move $a0, $t1 # 19
li $v0, 1 # 19
syscall # 19
li $v0, 4
la $a0, enter # 19
syscall # 19
li $t0, 4 # 20
sw $t0, -8($sp) # 20
lw $t0, -4($sp) # 21
lw $t1, -8($sp) # 21
div $t1, $t0 # 21
mflo $t1 # 21
sw $t1, -8($sp) # 21
li $v0, 4
la $a0, _str3 # 22
syscall # 22
li $v0, 4
la $a0, space # 22
syscall # 22
li $v0, 4
la $a0, enter # 22
syscall # 22
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
li $t0, 4 # 24
sw $t0, -8($sp) # 24
lw $t0, -4($sp) # 25
lw $t1, -8($sp) # 25
div $t1, $t0 # 25
mfhi $t1 # 25
sw $t1, -8($sp) # 25
li $v0, 4
la $a0, _str4 # 26
syscall # 26
li $v0, 4
la $a0, space # 26
syscall # 26
li $v0, 4
la $a0, enter # 26
syscall # 26
lw $t0, -4($sp) # 27
lw $t1, -8($sp) # 27
move $a0, $t0 # 27
li $v0, 1 # 27
syscall # 27
li $v0, 4
la $a0, space # 27
syscall # 27
move $a0, $t1 # 27
li $v0, 1 # 27
syscall # 27
li $v0, 4
la $a0, enter # 27
syscall # 27
li $t0, 4 # 28
sw $t0, -8($sp) # 28
lw $t0, -4($sp) # 29
lw $t1, -8($sp) # 29
and $t1, $t1, $t0 # 29
sw $t1, -8($sp) # 29
li $v0, 4
la $a0, _str5 # 30
syscall # 30
li $v0, 4
la $a0, space # 30
syscall # 30
li $v0, 4
la $a0, enter # 30
syscall # 30
lw $t0, -4($sp) # 31
lw $t1, -8($sp) # 31
move $a0, $t0 # 31
li $v0, 1 # 31
syscall # 31
li $v0, 4
la $a0, space # 31
syscall # 31
move $a0, $t1 # 31
li $v0, 1 # 31
syscall # 31
li $v0, 4
la $a0, enter # 31
syscall # 31
li $t0, 4 # 32
sw $t0, -8($sp) # 32
lw $t0, -4($sp) # 33
lw $t1, -8($sp) # 33
or $t1, $t1, $t0 # 33
sw $t1, -8($sp) # 33
li $v0, 4
la $a0, _str6 # 34
syscall # 34
li $v0, 4
la $a0, space # 34
syscall # 34
li $v0, 4
la $a0, enter # 34
syscall # 34
lw $t0, -4($sp) # 35
lw $t1, -8($sp) # 35
move $a0, $t0 # 35
li $v0, 1 # 35
syscall # 35
li $v0, 4
la $a0, space # 35
syscall # 35
move $a0, $t1 # 35
li $v0, 1 # 35
syscall # 35
li $v0, 4
la $a0, enter # 35
syscall # 35
li $t0, 4 # 36
sw $t0, -8($sp) # 36
lw $t0, -4($sp) # 37
lw $t1, -8($sp) # 37
sllv $t1, $t1, $t0 # 37
sw $t1, -8($sp) # 37
li $v0, 4
la $a0, _str7 # 38
syscall # 38
li $v0, 4
la $a0, space # 38
syscall # 38
li $v0, 4
la $a0, enter # 38
syscall # 38
lw $t0, -4($sp) # 39
lw $t1, -8($sp) # 39
move $a0, $t0 # 39
li $v0, 1 # 39
syscall # 39
li $v0, 4
la $a0, space # 39
syscall # 39
move $a0, $t1 # 39
li $v0, 1 # 39
syscall # 39
li $v0, 4
la $a0, enter # 39
syscall # 39
li $t0, 4 # 40
sw $t0, -8($sp) # 40
lw $t0, -4($sp) # 41
lw $t1, -8($sp) # 41
srlv $t1, $t1, $t0 # 41
sw $t1, -8($sp) # 41
li $v0, 4
la $a0, _str8 # 42
syscall # 42
li $v0, 4
la $a0, space # 42
syscall # 42
li $v0, 4
la $a0, enter # 42
syscall # 42
lw $t0, -4($sp) # 43
lw $t1, -8($sp) # 43
move $a0, $t0 # 43
li $v0, 1 # 43
syscall # 43
li $v0, 4
la $a0, space # 43
syscall # 43
move $a0, $t1 # 43
li $v0, 1 # 43
syscall # 43
li $v0, 4
la $a0, enter # 43
syscall # 43
li $t0, 0 # 44
li $t1, 14 # 44
sll $t0, $t0, 2 # 44
sub $sp, $sp, $t0 # 44
sw $t1, -12($sp) # 44
add $sp, $sp, $t0 # 44
li $t0, 1 # 45
li $t1, 15 # 45
sll $t0, $t0, 2 # 45
sub $sp, $sp, $t0 # 45
sw $t1, -12($sp) # 45
add $sp, $sp, $t0 # 45
li $t0, 0 # 46
li $t1, 1 # 46
sll $t1, $t1, 2 # 46
sub $sp, $sp, $t1 # 46
lw $t2, -12($sp) # 46
add $sp, $sp, $t1 # 46
li $t1, 0 # 46
sll $t1, $t1, 2 # 46
sub $sp, $sp, $t1 # 46
lw $t3, -12($sp) # 46
add $sp, $sp, $t1 # 46
add $t2, $t2, $t3 # 46
lw $t1, -4($sp) # 46
sub $t2, $t2, $t1 # 46
move $t1, $t0 # 46
sll $t0, $t0, 2 # 46
sub $sp, $sp, $t0 # 46
lw $t3, -12($sp) # 46
add $sp, $sp, $t0 # 46
add $t3, $t3, $t2 # 46
sll $t1, $t1, 2 # 46
sub $sp, $sp, $t1 # 46
sw $t3, -12($sp) # 46
add $sp, $sp, $t1 # 46
li $v0, 4
la $a0, _str9 # 47
syscall # 47
li $v0, 4
la $a0, space # 47
syscall # 47
li $v0, 4
la $a0, enter # 47
syscall # 47
li $t0, 0 # 48
sll $t0, $t0, 2 # 48
sub $sp, $sp, $t0 # 48
lw $t1, -12($sp) # 48
add $sp, $sp, $t0 # 48
li $t0, 1 # 48
sll $t0, $t0, 2 # 48
sub $sp, $sp, $t0 # 48
lw $t2, -12($sp) # 48
add $sp, $sp, $t0 # 48
move $a0, $t1 # 48
li $v0, 1 # 48
syscall # 48
li $v0, 4
la $a0, space # 48
syscall # 48
move $a0, $t2 # 48
li $v0, 1 # 48
syscall # 48
li $v0, 4
la $a0, enter # 48
syscall # 48
move $a3, $zero # 49
move $v0, $a3 # 49
j $ra # 49
li $v0, 10 # 49
syscall # 49


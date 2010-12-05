.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
subu $sp, 0 # 4
li $v0, 5 # 6
syscall # 6
li $v0, 5 # 7
syscall # 7
sw $v0, 8($sp) # 7
li $v0, 5 # 8
syscall # 8
sw $v0, 4($sp) # 8
lw $t0, 8($sp) # 9
lw $t1, 4($sp) # 9
move $a0, $t0 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, space # 9
syscall # 9
move $a0, $t1 # 9
li $v0, 1 # 9
syscall # 9
li $v0, 4
la $a0, enter # 9
syscall # 9
addu $sp, 0 # 10
li $v0, 10 # 10
syscall # 10


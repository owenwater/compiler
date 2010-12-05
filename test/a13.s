.data
space:
.asciiz " "
enter:
.asciiz "\n"
.text
.globl main
main: 
subu $sp, 4 # 4
subu $sp, 4 # 6
addu $sp, 4 # 6
li $t0, 3 # 7
sw $t0, 4($sp) # 7
addu $sp, 4 # 8
li $v0, 10 # 8
syscall # 8
f: # 16
subu $sp, 8 # 12
addu $sp, 8 # 12
li $t0, 3 # 13
sw $t0, 8($sp) # 13
li $t0, 3 # 14
sw $t0, 4($sp) # 14
li $t0, 0 # 15
move $v0, $t0 # 15
j $ra # 15


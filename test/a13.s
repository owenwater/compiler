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
addu $sp, 4 # 7
li $v0, 10 # 7
syscall # 7
f: # 10


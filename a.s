.data
space:
.asciiz " "
enter:
.asciiz "\n"
str0:
.asciiz "Hello World"

.text
.globl main
main: 

li $t0, 123
li $t2, 4
sw $t0, 4($sp)
lw $t1, $t2($sp)

move $a0, $t1
li $v0, 1
syscall

li $v0, 10
syscall


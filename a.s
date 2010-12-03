.data

.text
.globl main

main:
li $t0, 1
li $t1, 1
xor $t0, $t0, $t1
move $a0, $t0
li $v0, 1;
syscall

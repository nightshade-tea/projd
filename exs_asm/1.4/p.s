.global _start

.section .text
_start:
    li   a0, 1
    li   a1, 7
    li   a2, 3

    mul  a0, a0, a2 # a0 = ac
    slli a0, a0, 2  # a0 = 4ac
    mul  a1, a1, a1 # a1 = b^2
    sub  a0, a1, a0 # a0 = b^2 -4ac

    addi sp, sp, -4
    sw   a0, 0(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 4
    ecall

    addi sp, sp, 4

    li   a7, 93 # exit()
    li   a0, 0
    ecall


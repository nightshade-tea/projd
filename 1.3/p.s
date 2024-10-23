.global _start

.section .text
_start:
    li   a0, 10
    li   a1, 6
    li   a2, 11

    add  a0, a0, a1
    add  a0, a0, a2
    li   a1, 3
    div  a0, a0, a1

    addi sp, sp, -8
    sw   a0, 0(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 8
    ecall

    addi sp, sp, 8

    li   a7, 93 # exit()
    li   a0, 0
    ecall


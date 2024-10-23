.global _start

.section .text
_start:
    li   t0, 10
    li   t1, 6

    add  t0, t0, t1
    srli t0, t0, 1

    addi sp, sp, -8
    sw   t0, 0(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 8
    ecall

    addi sp, sp, 8

    li   a7, 93 # exit()
    ecall


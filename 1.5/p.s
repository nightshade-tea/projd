.global _start

.section .text
_start:
    li   t0, 1
    li   t1, 7
    li   t2, 3

    mul  t0, t0, t2 # t0 = ac
    slli t0, t0, 2  # t0 = 4ac
    mul  t1, t1, t1 # t1 = b^2
    sub  t0, t1, t0 # t0 = b^2 -4ac

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


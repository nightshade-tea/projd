.global _start

.section .text
_start:
    li   t0, 3
    li   t1, 6

    sub  t0, t0, t1 # t0 = a-b
    srli t0, t0, 63 # t0 = t0 sign bit

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


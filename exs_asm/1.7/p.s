.global _start

.section .text
_start:
    li   a0, 0xdeadbeef

    slli t0, a0, 48
    srli t0, t0, 56

    slli t1, a0, 32
    srli t1, t1, 56

    addi sp, sp, -2
    sb   t0, 0(sp)
    sb   t1, 1(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 2
    ecall

    addi sp, sp, 2

    li   a7, 93 # exit()
    li   a0, 0
    ecall


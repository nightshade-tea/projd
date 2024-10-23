.global _start

.section .text
_start:
    li   t0, 0xdeadbeef

    slli t1, t0, 32
    srli t1, t1, 56

    slli t0, t0, 48
    srli t0, t0, 56

    addi sp, sp, -16
    sw   t0, 0(sp)
    sw   t1, 8(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 16
    ecall

    addi sp, sp, 16

    li   a7, 93 # exit()
    li   a0, 0
    ecall


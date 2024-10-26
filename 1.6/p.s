.global _start

.section .text
_start:
    li   a0, 3
    li   a1, 6

    sub  a0, a0, a1 # a0 = a-b
    srli a0, a0, 63 # a0 = a0 sign bit

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


.global _start

.section .text
_start:
    li   a0, -1 # 64 1's

    li   t0, 2
    li   t1, 0 # sum
while:
    beq  a0, x0, out
    remu t3, a0, t0
    add  t1, t1, t3
    srli a0, a0, 1
    jal  x0, while

out:
    addi sp, sp, -4
    sw   t1, 0(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 4
    ecall

    addi sp, sp, 4

    li   a7, 93 # exit()
    li   a0, 0
    ecall


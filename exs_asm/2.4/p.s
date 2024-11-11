.global _start

.section .text
_start:
    li   a0, 0b101010000

    li   t0, 64
    beq  a0, x0, out

    li   t0, 0
loop:
    andi t1, a0, 1
    bne  t1, x0, out
    add  t0, t0, 1
    srli a0, a0, 1
    jal  x0, loop

out:
    addi sp, sp, -4
    sw   t0, 0(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 4
    ecall

    addi sp, sp, 4

    li   a7, 93 # exit()
    li   a0, 0
    ecall


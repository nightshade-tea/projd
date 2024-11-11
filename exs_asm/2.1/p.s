.global _start

.section .text
_start:
    li   a0, 5 # n

    li   t0, 1
for:
    bge  x0, a0, out # !(n > 0) -> out
    mul  t0, t0, a0  # t0 = t0*n
    addi a0, a0, -1  # n--
    jal  x0, for

out: # t0 is n!
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


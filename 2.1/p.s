.global _start

.section .text
_start:
    li   t0, 5 # n

    li   t1, 1
for:
    bge  x0, t0, out # !(n > 0) -> out
    mul  t1, t1, t0  # t1 = t1*n
    addi t0, t0, -1  # n--
    jal  x0, for

out: # t1 is n!
    addi sp, sp, -8
    sw   t1, 0(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 8
    ecall

    addi sp, sp, 8

    li   a7, 93 # exit()
    li   a0, 0
    ecall


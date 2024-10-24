.global _start

.section .text
_start:
    li   a0, 29

    li   t0, 0
    li   t1, 1
    bge  t1, a0, out

    li   t0, 1
    srli t1, a0, 1
    li   t2, 2
for:
    blt  t1, t2, out
    rem  t3, a0, t2
    
    bne  t3, x0, oif
    li   t0, 0
    jal  x0, out

oif:
    addi t2, t2, 1
    jal  x0, for

out:
    addi sp, sp, -8
    sw   t0, 0(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 8
    ecall

    addi sp, sp, 8

    li   a7, 93 # exit()
    li   a0, 0
    ecall


.global _start


.section .rodata
V:
    .word 100, 92, 97
P:
    .word 1, 2, 3


.section .text
_start:
    li   a0, 3       # a0 = number of elements in V

    li   t1, 0       # num
    li   t2, 0       # den
    li   t0, 0       # i
for:                 # for (int i = 0; i < a0; i++)
    bge  t0, a0, out

    slli t3, t0, 2

    la   t4, V
    add  t4, t4, t3
    lw   t4, 0(t4)   # t4 = V[i]

    la   t5, P
    add  t5, t5, t3
    lw   t5, 0(t5)   # t5 = P[i]

    mul  t4, t4, t5

    add  t1, t1, t4  # num += V[i] * P[i]
    add  t2, t2, t5  # den += P[i]

    addi t0, t0, 1
    jal  x0, for

out:
    div  t1, t1, t2  # t1 = num / den
    addi sp, sp, -4
    sw   t1, 0(sp)

    li   a7, 64      # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 4
    ecall            # a2 has already been set

    addi sp, sp, 4

    li   a7, 93      # exit()
    li   a0, 0
    ecall


.global _start


.section .rodata
V:
    .word 2, 3, 5, 4, 11


.section .text
_start:
    li   a0, 5       # a0 = number of elements in V

    li   t1, 0       # sum
    li   t0, 0       # i
for:                 # for (int i = 0; i < a0; i++)
    bge  t0, a0, out

    la   t3, V
    slli t2, t0, 2
    add  t2, t2, t3  # t2 = &V[i]

    lw   t2, 0(t2)   # t2 = V[i]
    add  t1, t1, t2  # sum += t2

    addi t0, t0, 1
    jal  x0, for

out:
    div  t1, t1, a0  # t1 = sum / n of elems
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


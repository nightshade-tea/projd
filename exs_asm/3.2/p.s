.global _start


.section .rodata
A:
    .word 1, 2, 3, 4, 5
B:
    .word 1, 1, 1, 1, 1


.section .text
_start:
    li   a0, 5          # a0 = number of elements in array

    slli a2, a0, 2      # a2 = size of the array in bytes (4*a0)
    sub  sp, sp, a2

    li   t0, 0          # i
for:                    # for (int i = 0; i < a0; i++)
    bge  t0, a0, out

    slli t1, t0, 2      # t1 has the shift amount to access element i

    la   t2, A
    add  t2, t2, t1
    lw   t2, 0(t2)      # t2 = A[i]

    la   t3, B
    add  t3, t3, t1
    lw   t3, 0(t3)      # t3 = B[i]

    add  t1, t1, sp
    add  t2, t2, t3
    sw   t2, 0(t1)      # C[i] = A[i] + B[i]

    addi t0, t0, 1
    jal  x0, for

out:
    li   a7, 64         # write()
    li   a0, 1
    mv   a1, sp
    ecall               # a2 has already been set

    add sp, sp, a2

    li   a7, 93         # exit()
    li   a0, 0
    ecall


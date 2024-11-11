.global _start


.section .rodata
str_v:
    .ascii "O fatorial eh mais que 10x maior.\n"
str_f:
    .ascii "O fatorial eh menos que 10x maior.\n"


.section .text
fatorial:
    li   t0, 1       # f = 1
    li   t1, 2       # i = 2
1:                   # for (i = 2; i <= n; i++)
    blt  a0, t1, 2f

    mul  t0, t0, t1  # f = f * i

    addi t1, t1, 1
    jal  x0, 1b
2:
    mv   a0, t0
    jalr x0, ra, 0   # return f


_start:
    li   a0, 5       # n

    addi sp, sp, -4
    sw   a0, 0(sp)   # save n before calling fatorial

    jal  ra, fatorial

    lw   t0, 0(sp)   # restore value of n on t0
    add  sp, sp, 4

    li   t1, 10
    mul  t0, t0, t1  # t0 = 10 * n

    bge  t0, a0, 1f  # if (f > 10 * n)
    
    la   a1, str_v
    li   a2, 34

    jal  x0, 2f
1:                   # else

    la   a1, str_f
    li   a2, 35

2:
    li   a7, 64      # write()
    li   a0, 1
    ecall


    li   a7, 93      # exit()
    li   a0, 0
    ecall


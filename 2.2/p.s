.global _start

.section .text
_start:
    li   a0, 6 # n

    li   t0, 2 # i
    li   t1, 1
    li   t2, 1
for:
    bge  t0, a0, out
    add  t3, t1, t2
    mv   t1, t2
    mv   t2, t3
    addi t0, t0, 1
    jal  x0, for

out: # t2 is fib(n)
    addi sp, sp, -8
    sw   t2, 0(sp)

    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    li   a2, 8
    ecall

    addi sp, sp, 8

    li   a7, 93 # exit()
    li   a0, 0
    ecall


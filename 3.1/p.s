.global _start

.section .text
_start:
    li   a0, 33

    bge  x0, a0, exit

    slli a2, a0, 2
    sub  sp, sp, a2

    li   t0, 0
for:
    bge  t0, a0, out

    slli t1, t0, 2
    add  t1, t1, sp
    sh   t0, 0(t1)

    addi t0, t0, 1
    jal  x0, for

out:
    li   a7, 64 # write()
    li   a0, 1
    mv   a1, sp
    # a2 is 4*a0
    ecall

    add sp, sp, a2

exit:
    li   a7, 93 # exit()
    li   a0, 0
    ecall


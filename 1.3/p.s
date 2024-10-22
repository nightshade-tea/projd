.global _start

_start:
    addi a0, x0, 10
    addi a1, x0, 6
    addi a2, x0, 11

    add  a0, a0, a1 # a0 += a1
    add  a0, a0, a2 # a0 += a2
    addi a1, x0, 3
    div  a0, a0, a1 # a0 /= 3

    addi a7, x0, 93 # exit()
    ecall


.global _start

_start:
    addi a0, x0, 1
    addi a1, x0, 7
    addi a2, x0, 3

    mul  a0, a0, a2 # a0 = ac
    slli a0, a0, 2  # a0 = 4ac
    mul  a1, a1, a1 # a1 = b^2
    sub  a0, a1, a0 # a0 = b^2 -4ac

    addi a7, x0, 93 # exit()
    ecall


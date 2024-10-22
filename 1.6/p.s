.global _start

_start:
    addi a0, x0, 3
    addi a1, x0, 6

    sub  a0, a0, a1 # a0 = a-b
    srli a0, a0, 63 # a0 = a0 sign bit

    addi a7, x0, 93 # exit()
    ecall


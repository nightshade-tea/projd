.global _start

_start:
    addi a7, zero, 64 # write()
    addi a0, zero, 1
    la   a1, hello
    addi a2, zero, 13
    ecall

    addi a7, zero, 93 # exit()
    addi a0, zero, 0
    ecall

hello:
    .ascii "Hello, World\n"


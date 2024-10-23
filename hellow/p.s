.global _start

.section .text
_start:
    li   a7, 64 # write()
    li   a0, 1
    la   a1, hello
    li   a2, 13
    ecall

    li   a7, 93 # exit()
    li   a0, 0
    ecall

.section .data
hello:
    .ascii "Hello, World\n"


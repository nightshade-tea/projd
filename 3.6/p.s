.global _start


.section .rodata
str:
    .ascii "some text here\n"


.section .text
_start:
    li   a2, 15      # a2 = str size

    sub  sp, sp, a2

    li   t0, 0       # i
for:                 # for (int i = 0; i < a0; i++)
    bge  t0, a2, out

    la   t1, str
    add  t1, t1, t0
    lb   t2, 0(t1)   # t2 = str[i]

    li   t4, 0x61    # 'a'
    li   t5, 0x7a    # 'z'
    blt  t2, t4, oif
    blt  t5, t2, oif
    addi t2, t2, -32 # if t2 has a lowercase letter, uppercase it

oif:
    add  t3, sp, t0
    sb   t2, 0(t3)

    addi t0, t0, 1
    jal  x0, for

out:
    li   a7, 64      # write()
    li   a0, 1
    mv   a1, sp
    ecall            # a2 has already been set

    add  sp, sp, a2

    li   a7, 93      # exit()
    li   a0, 0
    ecall


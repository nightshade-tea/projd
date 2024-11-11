.global _start

.section .text
_start:
    li   a0, 19      # a0 = number of elements in array

    slli a2, a0, 2   # a2 = size of the array in bytes (4*a0)
    sub  sp, sp, a2  # allocate a2 bytes in the stack

    li   t1, 1
    sw   t1, 0(sp)
    sw   t1, 4(sp)   # store F1, F2 = 1

    li   t2, 1
    li   t0, 2       # i
for:                 # for (int i = 2; i < a0; i++)
    bge  t0, a0, out 

    add  t3, t1, t2  # Fi = F(i-1) + F(i-2)

    slli t4, t0, 2
    add  t4, t4, sp
    sw   t3, 0(t4)   # store Fi

    mv   t1, t2      # prepare for the next iteration
    mv   t2, t3

    addi t0, t0, 1
    jal  x0, for

out:
    li   a7, 64      # write()
    li   a0, 1
    mv   a1, sp
    ecall            # a2 has already been set

    add sp, sp, a2   # deallocate

    li   a7, 93      # exit()
    li   a0, 0
    ecall


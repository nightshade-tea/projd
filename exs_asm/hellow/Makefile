.PHONY: build clean

build:
	riscv64-linux-gnu-as p.s -o p.o
	riscv64-linux-gnu-gcc -o p p.o -nostdlib -static

clean:
	rm -rf p p.o


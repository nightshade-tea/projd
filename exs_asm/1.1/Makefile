.PHONY: build clean run

build:
	riscv64-linux-gnu-as p.s -o p.o
	riscv64-linux-gnu-gcc -o p p.o -nostdlib -static

clean:
	rm -rf p p.o

run: build
	@echo ""
	@./p | hexdump -v -e '4/1 "%02x " "\n"' | awk '{printf "%d::0x", NR; for(i=8; i>0; i--) printf "%s ", $$i; printf "\n"}' | tr -d ' '

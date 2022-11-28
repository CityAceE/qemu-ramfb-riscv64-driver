riscv64-linux-gnu-gcc -T linker.ld -I include/ boot.s serial.c qemu_dma.c fb.c kernel.c -o build/kernel -nostdlib -lgcc -g

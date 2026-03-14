## Toolchain
CC = riscv64-unknown-linux-gnu-gcc

## Directories
BUILD = build

## Flags
CFLAGS = -mcmodel=medany -nostdlib -I include -g
LDFLAGS = -T linker.ld -lgcc

## Sources
SRCS = boot.s serial.c qemu_dma.c fb.c kernel.c

## Output
KERNEL = $(BUILD)/kernel

## Default target
all: $(KERNEL)

## Ensure build directory exists
$(BUILD):
	mkdir -p $(BUILD)

## Build kernel
$(KERNEL): $(SRCS) | $(BUILD)
	$(CC) $(SRCS) $(CFLAGS) $(LDFLAGS) -o $(KERNEL)

## Run in QEMU
run: $(KERNEL)
	qemu-system-riscv64 \
		-machine virt \
		-kernel $(KERNEL) \
		-device ramfb \
		-bios none \
		-serial stdio

## Run with GDB support
gdb: $(KERNEL)
	qemu-system-riscv64 \
		-s -S \
		-machine virt \
		-kernel $(KERNEL) \
		-device ramfb \
		-bios none \
		-serial stdio

## Clean build artifacts
clean:
	rm -rf $(BUILD)/*

.PHONY: all run gdb clean

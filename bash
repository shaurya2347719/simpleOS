gcc -ffreestanding -c kernel.c -o kernel.o
nasm -f elf64 kernel_entry.asm -o kernel_entry.o
ld -o kernel.bin -Ttext 0x1000 kernel_entry.o kernel.o --oformat binary
nasm bootloader.asm -f bin -o bootloader.bin
cat bootloader.bin kernel.bin > os-image

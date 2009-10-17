all: a.img

.S.o:
	gcc -m32 -c $< -o $@

header.elf: header.o
	ld -T setup.ld $< -o $@

a.img: header.elf
	objcopy -O binary $< $@

clean:
	rm -f *.o *.elf *.img

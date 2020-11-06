OutDir=build
SourceDir=src

makeDir:
	@mkdir -p ${OutDir}

ASMBubbling: makeDir
	nasm -g -F dwarf -f elf64 ${SourceDir}/ASMBubbling.asm  -o ${OutDir}/ASMBubbling.o
	@ld -o ${OutDir}/ASMBubbling.bin ${OutDir}/ASMBubbling.o

dump:
	objdump -D -M intel -j .text  ${OutDir}/ASMBubbling.bin

all: ASMBubbling
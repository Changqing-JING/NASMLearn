OutDir=build
SourceDir=src

makeDir:
	@mkdir -p ${OutDir}

ASMBubbling: makeDir
	nasm -g -F dwarf -f elf64 ${SourceDir}/ASMBubbling.asm  -o ${OutDir}/ASMBubbling.o
	@ld -o ${OutDir}/ASMBubbling.bin ${OutDir}/ASMBubbling.o

test_ch: makeDir
	nasm -g -F dwarf -f elf64 ${SourceDir}/test_ch.asm  -o ${OutDir}/test_ch.o

asIntel:
	as -g -c -o ${OutDir}/asIntelDemo.o ${SourceDir}/asIntelDemo.asm 

dump:
	objdump -D -M intel -j .text  ${OutDir}/ASMBubbling.bin

bin: asIntel
	gcc -g -o ${OutDir}/callAsm ${SourceDir}/callAsm.c ${OutDir}/asIntelDemo.o

all: ASMBubbling
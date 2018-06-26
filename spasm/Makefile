
all: spasm spasm32

new: clean all


process: spasm.h process.c spasm.c
	$(CC) $^ -o $@

process32: spasm.h process.c spasm.c
	$(CC) -m32 $^ -o $@

<<<<<<< Updated upstream
spasm: spasm_test.c spasm.c spasm.h
	$(CC) $^ -o $@

spasm32: spasm32_test.c spasm.c spasm.h
=======
spasm: emulator/spasm_test.c emulator/spasm.c emulator/spasm.h
	$(CC) $^ -o $@

spasm32: emulator/spasm32_test.c emulator/spasm.c emulator/spasm.h
>>>>>>> Stashed changes
	$(CC) -m32 $^ -o $@

clean:
	$(RM) sub_vm test spasm spasm32 process process32 

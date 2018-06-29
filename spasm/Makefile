
all: spasm spasm32

new: clean all


process: emulator/spasm.h emulator/process.c emulator/spasm.c
	$(CC) $^ -o $@

process_debug: emulator/spasm.h emulator/process_v.c emulator/spasm.c
	$(CC) $^ -o $@

process32: emulator/spasm.h emulator/process.c emulator/spasm.c
	$(CC) -m32 $^ -o $@

process32_debug: emulator/spasm.h emulator/process_v.c emulator/spasm.c
	$(CC) -m32 $^ -o $@

spasm: emulator/spasm_test.c emulator/spasm.c emulator/spasm.h
	$(CC) $^ -o $@

spasm32: emulator/spasm32_test.c emulator/spasm.c emulator/spasm.h
	$(CC) -m32 $^ -o $@

clean:
	$(RM) sub_vm spasm spasm32 process process32 process_debug process32_debug

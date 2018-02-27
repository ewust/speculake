
all: inject measure

new: clean all

inject: inject.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure: target_fn.S measure.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure_noasm: measure.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

single: single.c linker.ld
	$(CC) -Wl,-Tlinker.ld single.c -o $@

clean:
	$(RM) inject measure

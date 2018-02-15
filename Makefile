

inject: inject.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure: measure.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

single: single.c linker.ld
	$(CC) -Wl,-Tlinker.ld single.c -o $@

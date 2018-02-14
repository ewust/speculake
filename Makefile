

inject: inject.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure: measure.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

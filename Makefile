
all: inject measure

inject: inject.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure: target_fn.S measure.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure_noasm: measure.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

single: target_fn.S single.c link-single.ld common.c
	$(CC) -Wl,-Tlink-single.ld target_fn.S single.c common.c -o $@

clean:
	rm inject measure *.o

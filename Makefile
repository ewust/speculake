
all: inject measure

inject: inject.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure: target_fn.S measure.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure_noasm: measure.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@


single: target_fn.S common.c single.c link-single.ld
	$(CC) -m64 -fPIC -pie -mcmodel=large -fno-asynchronous-unwind-tables -c single.c
	$(CC) -m64 -fPIC -pie -mcmodel=large -fno-asynchronous-unwind-tables -c common.c
	$(CC) -m64 -fPIC -pie -mcmodel=large -fno-asynchronous-unwind-tables -c target_fn.S
	$(CC) -fPIC -Wl,-Tlink-single.ld target_fn.o common.o single.o -mcmodel=large -shared -fno-asynchronous-unwind-tables -o libsingle.so
	$(CC) -m64 main.c -lsingle -L./ -o single
	#$(CC) -m64 -mcmodel=large -Wl,-Tlink-single.ld target_fn.o common.o single.o -shared -o libsingle.so
	#gcc -fPIC -Wl,-Tlink-single.ld target_fn.o common.o single.o -mcmodel=large -nostdlib -shared -fno-asynchronous-unwind-tables -static -o libsingle.a

clean:
	rm inject measure *.o


all: payload


payload: target_fn.c payload.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

trigger: trigger.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

simulate-openssl: test-jumps.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@



clean:
	$(RM) *.o payload simulate-openssl

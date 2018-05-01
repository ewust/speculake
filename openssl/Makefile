
all: payload trigger


payload: target_fn.c payload.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

trigger: trigger.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

simulate-openssl: test-jumps.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@


replicated.S: loop1.cut replicate-jumps.py
	python indirect.py < loop1.cut | python replicate-jumps.py > replicated.S

trained: trained.c
	$(CC) replicated.S trained.c -o $@


clean:
	$(RM) *.o payload simulate-openssl

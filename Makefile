

ver=$(shell awk -F'.' '{print $$1}' < /etc/issue)
NO_PIE=-no-pie
ifeq ($(ver),Ubuntu 14)
	NO_PIE=-fno-pie
endif


all: inject measure

retpoline: inject_retp measure_retp

exp_retp1:  target_fn.c retpoline_miss.c indirect_retpoline.S decrypt.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

inject: inject.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

inject_retp: inject.c indirect_retpoline.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

trigger: trigger.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

measure: target_fn.c measure.c indirect.S decrypt.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

measure_envy: target_fn.c measure_envy.c indirect.S decrypt.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

measure_retp: target_fn.c measure_retpoline.c indirect_retpoline.S decrypt.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

camellia: target_fn.c camellia-triggered.c decrypt.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@

turing: turing_target.c turing.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@

measure_noasm: measure.c common.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@

simulate-openssl: test-jumps.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@



single: target_fn.S common.c measure.c link-single.ld
	$(CC) -m64 -fPIC -pie -mcmodel=large -c measure.c
	$(CC) -m64 -fPIC -pie -mcmodel=large -c common.c
	$(CC) -m64 -fPIC -pie -mcmodel=large -c target_fn.S
	$(CC) -m64 -mcmodel=large -Wl,-Tlink-single.ld target_fn.o common.o measure.o -shared -o libsingle.so
	$(CC) -m64 main.c -lsingle -L./ -o single

clean:
	$(RM) inject measure *.o trigger inject_retp measure_retp

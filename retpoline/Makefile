

ver=$(shell awk -F'.' '{print $$1}' < /etc/issue)
NO_PIE=-no-pie
ifeq ($(ver),Ubuntu 14)
	NO_PIE=-fno-pie
endif


#============ Retpoline Experiments ==============

all: exp1 exp2 exp3 exp4 

exp1: exp1_measure exp1_inject

exp1_inject: inject.c indirect_retpoline.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

exp1_measure:  target_fn.c measure.c indirect_retpoline.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

exp2:  target_fn.c measure_exp1.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

exp3:  target_fn.c retpoline_miss.c indirect_retpoline.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

exp4: exp4_inject exp4_measure 

exp4_inject: inject_ret.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

exp4_measure: target_fn.c retpoline_yield.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

clean:
	$(RM) *.o exp* 

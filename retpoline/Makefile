

ver=$(shell awk -F'.' '{print $$1}' < /etc/issue)
NO_PIE=-no-pie
ifeq ($(ver),Ubuntu 14)
	NO_PIE=-fno-pie
endif

# CC=gcc-7
# RETP_OPTS=-mindirect-branch=thunk-inline -mfunction-return=thunk-inline -mindirect-branch-register

#============ Retpoline Experiments ==============

all: exp4 

exp2:  target_fn.c measure_exp2.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

exp4: inject measure 

inject: inject_retp.c 
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE} ${RETP_OPTS}

measure: target_fn.c measure_retp.c signal.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE} ${RETP_OPTS}

clean:
	$(RM) *.o exp2 measure inject 

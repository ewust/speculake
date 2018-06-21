
ver=$(shell awk -F'.' '{print $$1}' < /etc/issue)
NO_PIE=-no-pie
ifeq ($(ver),Ubuntu 14)
	NO_PIE=-fno-pie
endif


all: inject turing 

inject: inject.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

turing: turing_target.c turing.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@

clean:
	$(RM) turing inject *.o 

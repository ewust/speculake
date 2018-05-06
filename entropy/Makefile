

ver=$(shell awk -F'.' '{print $$1}' < /etc/issue)
NO_PIE=-no-pie
ifeq ($(ver),Ubuntu 14)
	NO_PIE=-fno-pie
endif


all: trigger decrypt

trigger: trigger.c indirect.S trigger_jumps.autogen.S ptext.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

decrypt: measure.c indirect.S targets.autogen.S ctext.autogen.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

trigger_jumps.autogen.S: gen-chain.py
	python gen-chain.py trigger > trigger_jumps.autogen.S
	python gen-chain.py payload > targets.autogen.S

targets.autogen.S: gen-chain.py
	python gen-chain.py trigger > trigger_jumps.autogen.S
	python gen-chain.py payload > targets.autogen.S

ctext.autogen.S: trigger ptext.S
	./trigger e > ctext.autogen.S

clean:
	$(RM) decrypt *.o trigger trigger_jumps.autogen.S targets.autogen.S ctext.autogen.S

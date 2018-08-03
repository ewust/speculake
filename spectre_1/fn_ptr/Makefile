

ver=$(shell awk -F'.' '{print $$1}' < /etc/issue)
NO_PIE=-no-pie
ifeq ($(ver),Ubuntu 14)
	NO_PIE=-fno-pie
endif


#============ Retpoline Experiments ==============

all: exploit

exploit: target_fn.c measure.c signal.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE} -fno-stack-protector -fomit-frame-pointer

clean:
	$(RM) *.o exploit

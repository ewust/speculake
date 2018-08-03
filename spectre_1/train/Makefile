

ver=$(shell awk -F'.' '{print $$1}' < /etc/issue)
NO_PIE=-no-pie
ifeq ($(ver),Ubuntu 14)
	NO_PIE=-fno-pie
endif


#============ Retpoline Experiments ==============

all: exploit_f exploit_r

exploit_f: target_fn.c measure_fn.c signal.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE} -fno-stack-protector -fomit-frame-pointer

exploit_r: target_fn.c measure_ret.c signal.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE} -fno-stack-protector -fomit-frame-pointer

clean:
	$(RM) *.o exploit*

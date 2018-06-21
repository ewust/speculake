
# HACK: on Ubuntu 14, use -fno-pie, on Ubuntu >= 16, -no-pie
# TODO: do this off bin-utils instead of ubuntu version
ver=$(shell awk -F'.' '{print $$1}' < /etc/issue)
NO_PIE=-no-pie
ifeq ($(ver),Ubuntu 14)
	NO_PIE=-fno-pie
endif

all: trigger spasm_vm


trigger: trigger.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

spasm_vm: target_fn.c indirect.S decrypt.S ../spasm/emulator/spasm.c spasm_vm.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@ ${NO_PIE}

clean:
	$(RM) spasm_vm trigger *.o

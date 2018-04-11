
all: trigger spasm_vm 

trigger: trigger.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ -no-pie

spasm_vm: target_fn.c indirect.S decrypt.S ../spasm/spasm.c spasm_vm.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@ -no-pie

clean:
	$(RM) spasm_vm trigger *.o


all: inject turing 

inject: inject.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ -no-pie

turing: turing_target.c turing.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@

clean:
	$(RM) turing inject *.o 

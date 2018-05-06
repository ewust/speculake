
all: inject iftest 

inject: inject.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ -no-pie

iftest: if_target.c if.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@

clean:
	$(RM) iftest inject *.o 

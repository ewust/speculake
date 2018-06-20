LDFLAGS += $(shell pkg-config --libs glib-2.0) -pthread -lm -lunicorn
ARMCC = arm-linux-gnueabi-gcc
ARMCFLAGS += --static -g -nostdlib

all: full_emulator.c full_emulator.h
	$(CC) -g full_emulator.c  -o full_emulator $(LDFLAGS)

helloWorld: helloWorld.c libI/libI.c libI/libI.S libI/libI.h linker.ld
	$(ARMCC) $(ARMCFLAGS) libI/libI.S libI/libI.c helloWorld.c -Wl,-Tlinker.ld -o helloWorld

rev-shell: rev_shell.c libI/libI.c libI/libI.S libI/libI.h linker.ld
	$(ARMCC) $(ARMCFLAGS) libI/libI.S libI/libI.c rev_shell.c -Wl,-Tlinker.ld -o rev_shell

server: server.c client.c
	$(CC) $(CFLAGS) server.c $(LDFLAGS) -o server
	$(CC) client.c -o client

clean:
	$(RM) server client *.o full_emulator helloWorld rev_shell

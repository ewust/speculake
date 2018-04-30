LDFLAGS += $(shell pkg-config --libs glib-2.0) -pthread -lm -lunicorn

all: full_emulator.c full_emulator.h
	$(CC)   $(CFLAGS)  -g full_emulator.c  -o full_emulator $(LDFLAGS)

server: server.c client.c
	$(CC) $(CFLAGS) server.c $(LDFLAGS) -o server
	$(CC) client.c -o client

clean:
	$(RM) server client *.o full_emulator

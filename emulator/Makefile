LDFLAGS += $(shell pkg-config --libs glib-2.0) -pthread -lm -lunicorn

all: server.c client.c
	$(CC) $(CFLAGS) server.c $(LDFLAGS) -o server
	$(CC) client.c -o client

clean:
	$(RM) server client *.o
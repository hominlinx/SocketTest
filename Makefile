CC=gcc -w -s
CFLAGS=-std=c99 -w
HEADERS=$(wildcard *.h)

%.o: %.c $(HEADERS)
	@$(CC) $(CFLAGS) -c $< -o $@


all: server client udpclient udpserver

server: server.o
	@$(CC) $(CFLAGS) server.o -o $@ -lpthread
client: client.o
	@$(CC) $(CFLAGS) client.o -o $@
udpserver: udpserver.o
	@$(CC) $(CFLAGS) udpserver.o -o $@ -lpthread
udpclient: udpclient.o
	@$(CC) $(CFLAGS) udpclient.o -o $@

clean:
	rm -rf *.o
	rm -rf client server udpserver udpclient

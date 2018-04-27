
all: robsize spec-size

trigger: trigger.c indirect.S
	$(CC) -Wl,-Tlinker.ld $^ -o $@ -no-pie

robsize: robsize.cc 
	$(CC) $^ -o $@ 

cache-miss: cache-miss.c 
	$(CC) $^ -o $@ 

spec-size: measure.c indirect.S  spec-size.c
	$(CC) -Wl,-Tlinker.ld $^ -o $@ -no-pie

clean:
	$(RM) robsize spec-size cache-miss *.o trigger

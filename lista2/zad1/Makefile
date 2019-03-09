scan: scan.c
	gcc -o scan scan.c

scan.c: scan.l
	flex -oscan.c scan.l

clean:
	rm scan.c scan

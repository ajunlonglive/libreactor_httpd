httpd:
	docker build -t reactor-sdk .
	docker run --rm -v ${PWD}:/example reactor-sdk \
	gcc -g -O3 -flto -march=native -Wall -Wpedantic -static example/httpd.c -oexample/httpd -lreactor -ldynamic

clean:
	rm -f httpd

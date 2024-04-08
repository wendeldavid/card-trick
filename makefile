run:
	go run .

build-linux:
	rm -f card-trick
	GOOS=linux GOARCH=amd64 go build -o card-trick

build-windows:
	rm -f card-trick.exe
	GOOS=windows GOARCH=amd64 go build -o card-trick.exe

compose-run:
	docker compose run card-trick
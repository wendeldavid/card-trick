.PHONY: all run build-linux build-windows

all: run

run:
	go run .

build-linux:
	GOOS=linux GOARCH=amd64 go build -o card-trick

build-windows:
	GOOS=windows GOARCH=amd64 go build -o card-trick.exe

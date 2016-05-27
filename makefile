all: check build

build: osx linux windows

osx:
	GOOS=darwin go build -o ./dist/osx/limo

linux:
	GOOS=linux go build -o ./dist/linux/limo

windows:
	GOOS=windows go build -o ./dist/windows/limo.exe

check: lint test

lint:
	golint --set_exit_status .
	golint --set_exit_status ./cmd
	golint --set_exit_status ./config

test:
	go test . ./cmd ./config

clean:
	rm -rf dist/*
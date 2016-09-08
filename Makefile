.PHONY: setup build compile image deploy run clean

default: build

setup:
	go get github.com/rogueethic/envconf
	go get github.com/rogueethic/jsonlog

clean:
	rm -f cmd/zendesk-export/zendesk-export
	go clean

build: clean compile image

compile:
	cd cmd/zendesk-export; CGO_ENABLED=0 go build -a -tags netgo -ldflags '-w' .

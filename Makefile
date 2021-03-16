.PHONY: elm
elm:
	@./scripts/build.sh

.PHONY: watch
watch: elm
	@./scripts/watch.sh

.PHONY: start-server
start-server: build-server
	./bin/server

.PHONY: build-server
build-server:
	@mkdir -p bin
	go build -o bin/server .

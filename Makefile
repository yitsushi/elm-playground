.PHONY: elm
elm:
	@./scripts/build.sh

.PHONY: watch
watch: elm
	@./scripts/watch.sh

.PHONY: start-server
start-server:
	go run .
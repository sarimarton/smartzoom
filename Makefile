.PHONY: build

build:
	swift build
	mkdir -p .bin
	cp ./.build/arm64-apple-macosx/debug/smartzoom .bin
	chmod +x .bin/smartzoom

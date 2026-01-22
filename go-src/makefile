# Makefile for Go → WebAssembly builds

WASM_OUT = ../ts-src/public/wasm/main.wasm
GO_FILES = $(shell find . -name '*.go')

wasm:
	GOOS=js GOARCH=wasm go build -o $(WASM_OUT) $(GO_FILES)

clean:
	rm -f $(WASM_OUT)

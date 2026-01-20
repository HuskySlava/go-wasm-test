package main

import (
	"syscall/js"
	"time"
)

func getUnixNano(this js.Value, args []js.Value) interface{} {
	return time.Now().UnixNano()
}

func main() {
	js.Global().Set("getUnixNano", js.FuncOf(getUnixNano))

	select {}
}

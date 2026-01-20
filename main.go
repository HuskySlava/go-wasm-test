package main

import (
	"syscall/js"
	"time"
)

func updateUnixNano(ch chan int64) {
	for {
		ch <- time.Now().UnixNano()
		time.Sleep(10 * time.Millisecond) // Throttle
	}
}

func main() {
	ch := make(chan int64, 100) // buffered channel
	go updateUnixNano(ch)

	jsCallback := js.Global().Get("updateUnix")
	for u := range ch {
		jsCallback.Invoke(float64(u))
	}

}

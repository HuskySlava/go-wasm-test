package main

import (
	"fmt"
	"syscall/js"
	"time"
)

func numberToHex(num uint) string {
	const MaxNum = 16777216

	if num < 1 {
		num = 1
	} else if num > 16777216 {
		num -= MaxNum
	}

	hex := fmt.Sprintf("#%06x", num)

	return hex
}

func updateUnixNano(ch chan string) {
	for {
		ms := time.Now().UnixMilli()
		last8 := ms % 100_000_000
		ch <- numberToHex(uint(last8))
		time.Sleep(time.Millisecond * 16) // Throttle to 60 times a sec
	}
}

func main() {
	ch := make(chan string, 100) // buffered channel
	go updateUnixNano(ch)

	jsCallback := js.Global().Get("updateHexValue")
	for color := range ch {
		jsCallback.Invoke(color)
	}

}

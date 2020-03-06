package main

import "time"

func main() {
	// i := 1
	fff := make([]string, 100000)
	for {
		// i++
		fff = append(fff, "")
		// go ffff(i)
	}
}

func ffff(i int) {
	fff := make([]string, i)
	time.Sleep(time.Second * 1000000)
	fff = append(fff, "")
}

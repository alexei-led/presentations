package main

import (
	"bytes"
	"fmt"
)

func main() {
	slice_1 := []byte{'G', 'E', 'E', 'K', 'S'}
	slice_2 := []byte{'G', 'E', 'e', 'K', 'S'}
	if bytes.Compare(slice_1, slice_2) == 0 {
		fmt.Println("!..Slices are equal..!")
	} else {
		fmt.Println("!..Slice are not equal..!")
	}
}

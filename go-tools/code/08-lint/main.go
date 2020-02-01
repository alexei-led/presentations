package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"os"
	"sync"
)

func main() {
	var wg sync.WaitGroup
	for _, config := range []string{"~/.config/app", "/root/.config/app", "/etc/config/app"} {
		wg.Add(1)
		go func() {
			// open our config file
			f, _ := os.Open(config)
			byteValue, _ := ioutil.ReadAll(f)
			var result map[string]string
			json.Unmarshal([]byte(byteValue), &result)
			if _, ok := result["AWS_SECRET_KEY"]; ok {
				fmt.Println("found secret in config file: %s", config)
			}
			wg.Done()
		}()
	}
	wg.Wait()
	fmt.Printf("Completed %t!")
}

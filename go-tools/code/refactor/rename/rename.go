package main

import "fmt"

type Server struct {
	name string
}

func main() {
	s := Server{name: "Alper"}
	fmt.Println(s.name) // print the server name
}

func name() string {
	return "Zeynep"
}

package main

import (
	"fmt"
	"net/http"
)

func main() {
	fmt.Println("Starting listener on port 8080 to reply to all requests...")
	mux := http.NewServeMux()
	mux.HandleFunc("/", hello)
	http.ListenAndServe(":8080", mux)
}

func hello(w http.ResponseWriter, req *http.Request) {
	w.WriteHeader(200)
	fmt.Fprintf(w, "hello world")
}

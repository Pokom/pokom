package main

import (
	"embed"
	"log"
	"net/http"
)

//go:embed public
var content embed.FS

func main() {
	http.HandleFunc("/", index)
	http.Handle("/public/", http.FileServer(http.FS(content)))
	if err := http.ListenAndServe(":8080", nil); err != nil {
		log.Fatal(err)
	}
}

func index(w http.ResponseWriter, r *http.Request) {
	data, _ := content.ReadFile("public/index.html")
	w.WriteHeader(http.StatusOK)
	w.Write(data)
}

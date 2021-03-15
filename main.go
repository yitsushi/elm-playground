package main

import (
	"io"
	"log"
	"net/http"
	"os"
)

func sendFileOrError(w http.ResponseWriter, path string) {
	log.Println(path)

	content, err := os.ReadFile(path)
	if err != nil {
		_, _ = io.WriteString(w, err.Error())

		return
	}

	_, _ = w.Write(content)
}

func main() {
	http.HandleFunc("/application.js", func(w http.ResponseWriter, req *http.Request) {
		sendFileOrError(w, "public/application.js")
	})

	http.HandleFunc("/", func(w http.ResponseWriter, req *http.Request) {
		sendFileOrError(w, "public/index.html")
	})

	log.Println("http://localhost:8000/")
	_ = http.ListenAndServe(":8000", nil)
}

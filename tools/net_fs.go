package main

import (
	"flag"
	"fmt"
	"net/http"
	"os"
	"runtime"
)

//Net File System

var rootPath *string
var port *int
var host *string

//use go run net_fs.go $rootPath $Host $Port to run net file system on http protocol
//maybe you can run: go build -o net_fs net_fs.go to get the executable binary file.
func main() {
	defer func() {
		if r := recover(); r != nil {
			_, _ = fmt.Fprintln(os.Stderr, "This Net File System Only Support Run On Linux Or Windows.Now Occurred Unknown Error.")
			flag.PrintDefaults()
		}
	}()

	if runtime.GOOS == `linux` {
		flag.StringVar(rootPath, "RootDir", "/", "root direction like /root in unix/linux,C:// in windows.")
	} else if runtime.GOOS == "windows" {
		flag.StringVar(rootPath, "RootDir", "/", "root direction like /root in unix/linux,C:// in windows.")
	} else {
		_, _ = fmt.Fprintln(os.Stderr, "This Net File System Only Supports Running On Linux Or Windows.")
	}

	flag.StringVar(host, "Host", "127.0.0.1", "bind in address.")
	flag.IntVar(port, "Port", 5337, "listen port.")

	flag.Parse()

	http.Handle("/", http.FileServer(http.Dir(*rootPath)))
	_ = http.ListenAndServe(fmt.Sprintf("%s:%d", *host, *port), nil)
}

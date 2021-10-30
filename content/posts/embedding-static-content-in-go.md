---
title: "Embedding Static Content in Go"
date: 2021-10-28T06:11:27-04:00
draft: true
---

In Go 1.16, the ability to embed files into executables was introduced. See this excellent [jetbrains](https://blog.jetbrains.com/go/2021/06/09/how-to-use-go-embed-in-go-1-16/) post that dives deeper into the topic.
Before this was introduced, developers had to use a 3rd party tools to accomplish the same thing. If you're curious about the motivation behind the change, check out the [RFC](https://github.com/golang/go/issues/35950) written by [Bradfitz](https://bradfitz.com/)!

As a newer developer in Go, I was curious as to **why** one would want to embed files directly within the executable. One case that I found compelling was embeded a staticly generated website within an executable!
This gives you the ability to write your own thin static webserver in GoLang and run it **anywhere**. Why would I want to do this?
- preview environments based upon Pull Requests
- instrumentation to gather usage statistics
- Scale up/Scale down with ease
- Fun and profit? 

The rest of this post answer the following questions:
- What is the `embed` package?
- How can I use `embed` with static files?
- How can I create "preview" environments?

## What is embed?

The official [docs](https://pkg.go.dev/embed) states that

> Package embed provides access to files embedded in the running Go program.
> Go source files that import "embed" can use the //go:embed directive to initialize a variable of type string, []byte, or FS with the contents of files read from the package directory or subdirectories at compile time.

## Basic Example

{{<highlight "go">}}
package main

import "embed"

//go:embed hello.txt
var f embed.FS

func main() {
    data, _ := f.ReadFile("hello.txt")
	print(string(data))
}
{{</highlight>}}

I ran into an issue with this initially because I had copied the example as is from the documentation.
The directive and var needs to be **outside** of a func, and there cannot be any other lines of code between the directive and variable block.

## Serve static file

{{<highlight "go">}}
package main

import (
	"embed"
	"net/http"
)

//go:embed hello.txt
var f embed.FS
func main() {
	http.HandleFunc("/", index)
	http.ListenAndServe(":8081", nil)
}

func index(w http.ResponseWriter, r *http.Request) {
	data, _ := f.ReadFile("hello.txt")
	w.WriteHeader(http.StatusOK)
	w.Write(data)
}
{{</highlight>}}

## Creating a Preview Environment

- Think through the bare minimum amount of code to demonstrate this
- Get a working example locally
- Containerize the example
- Talk through next steps(more posts!)
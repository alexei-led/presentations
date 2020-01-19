---
marp: true
title: Go tools
description: Get to know Go tools
theme: uncover
class: invert
footer: 'GopherCon Israel, 3 February 2020'
paginate: true
---

# Get to know Go tools

<!-- _footer: ![invert:70%](https://www.gophercon.org.il/images/logo.png) <br> 3 February 2020 -->
<!-- _paginate: false -->

Alexei Ledenev

github.com/alexei-led

---

## Hello

```sh
# inspect Go environment
go env

# run Go code
go run
```

<!--
go env -json | jq -r '.GORPOXY'
-->

---

## Edit

```sh
# code format
gofmt

# 'gofmt' plus fix imports
goimports
```

<!--
goimports -d main.go | colordiff
goimports -w main.go
-->

---

## Share

```sh
# share code on The Go Playground
go play
```

---

## Refactoring

```sh
# rewrite string
gofmt -r

# go rename tool
gorename

# go refactoring tool: rename, extract, var
godoctor
```

---

## Explore

```sh
# show source code for symbol
go doc -src

# run go documentation server (offline)
godoc

# explore visual call graph
go-callvis
```

---

## Dependency

```sh
# introspect Go packages and their interdependencies
go list

# add missing and remove unused modules
go mod tidy

# explain why packages or modules are needed
go mod why

# scan for embedded licenses
golicense
```

<!--
https://dave.cheney.net/2014/09/14/go-list-your-swiss-army-knife
go list -u -m -json all | go-mod-outdated -direct
-->

---

## Build

```sh
# core Go build command
go build

# list supported architectures and OS for Go builder
go tool dist list
```

<!--
GOOS
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags '-s -w -extldflags "-static"' -o app *.go
--->

---

## Static Builds

```sh
# disable cgo, unless you need to interoperate with C libraries
# most likely - you do not need it
CGO_ENABLED=0

# Go linker flags
# -s: omit the symbol table and debug information
# -w: omit the DWARF symbol table
# -extldflags: flags to ext4ernal gcc linker
-ldflags '-s -w -extldflags "-static"'

# portable packer for binaries: 40-60% final size reduce
- upx --best [--brute]
```

<!-- 
https://www.lucasepe.it/posts/golang-static-builds/
https://blog.hashbangbash.com/2014/04/linking-golang-statically/
-->

---

## Build Tags

<!--
https://mickey.dev/posts/go-build-tags-testing/ 
-->

```go
// +build linux darwin
// +build amd64
package mypackage
...
```

```go
// +build integration
package mypackage
import "testing"
...
```

```sh
go test --tags=integration
```

---

## Test

- `go test`
- `go test -cover`
- `go test -race`
- `richgo test`

---

## Tests/Mock Generation

`gotests`
`mockery|gomock`

---

## Benchmark

- `go test -run=^$ -bench=. ./... `
- `benchcmp`

---

## Static Analysis

- `go vet`
- `golangci-lint`
- `goreporter`

---

## Profile

```sh
go test -run=^$ -bench=^BenchmarkFoo$ -cpuprofile=/tmp/cpuprofile.out .
go test -run=^$ -bench=^BenchmarkFoo$ -memprofile=/tmp/memprofile.out .
go test -run=^$ -bench=^BenchmarkFoo$ -blockprofile=/tmp/blockprofile.out .
go test -run=^$ -bench=^BenchmarkFoo$ -mutexprofile=/tmp/mutexprofile.out .

go tool pprof -http=:5000 /tmp/cpuprofile.out
```

---

## Release

- `docker`
- `make`
- `goreleaser`

---

## Badges

- ![](https://camo.githubusercontent.com/072857af59b99a995d5e66cdac76fc224825c169/68747470733a2f2f676f7265706f7274636172642e636f6d2f62616467652f6769746875622e636f6d2f616c657865692d6c65642f70756d6261) `goreportcard`
- ![](https://s3.amazonaws.com/assets.coveralls.io/badges/coveralls_90.svg) `coveralls.io`
- ![](https://camo.githubusercontent.com/b216815be8df59ecf97f5926a579af746d79f613/68747470733a2f2f676f646f632e6f72672f6769746875622e636f6d2f676f6875676f696f2f6875676f3f7374617475732e737667) `godoc`
- ![](https://github.com/alexei-led/pumba/workflows/Pumba%20CI/badge.svg) `github actions`

---

## Thank you

![invert:100% height:50](https://cdn1.iconfinder.com/data/icons/social-media-rounded-corners/512/Rounded_Medium3_svg-64.png) ![invert height:50](https://pngimage.net/wp-content/uploads/2018/06/twitter-icon-black-png-1.png) @alexeiled
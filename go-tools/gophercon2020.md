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
<div data-marpit-fragment>

![height:350](https://www.jetbrains.com/go/img/screenshots/go_overview.png) ![height:350](https://www.i-programmer.info/images/stories/News/2019/July/A/vscode2.jpg)

</div>

![bg contain](https://i.imgur.com/a7NgLYi.png)

<!-- 
Go November 10. 2019; 10 years old; me and Go almost 5 years
Go SDK comes with lot of useful tools out-of-the box
Over these years Go community created additional helpful tools
All IDEs are using these tools under the hood
 -->

---

## Why Terminal

* Power
* Automation
* Productivity
* Beauty of CLI

<!--
Power - more control over commands, no everything is exposed in GUI
Automation - CLI is essential for effective automation
PRoductivity - once get familiar, some tasks easier to run in terminal
Beauty - personal feeling

2:00
-->

---

## Hello

```sh
# list Go SDK tools
go help

# inspect Go environment
go env
go env --json | jq .
```

<!--
code/01-hello
-->

---

## Edit

```sh
# code format: simplify and write result to (source) file
gofmt -s -w

# list files whose formatting differs from goimport's
goimports -l

# 'gofmt' plus fix imports and write result to (source) file
goimports -w

# run Go code
go run
```

<!--
code/01-hello
-->

---

## Share

```sh
# share code on The Go Playground
goplay
```

<!--
code/02-share
-->

---

## Refactoring

<div data-marpit-fragment>

```sh
# rewrite code
gofmt -r ...
# rewrite rule: pattern -> replacement
# [pattern] & [replacement] must be valid go expressions
gofmt -r 'bytes.Compare(a, b) == 0 -> bytes.Equal(a, b)'
gofmt -r 'bytes.Compare(a, b) != 0 -> !bytes.Equal(a, b)'
```

</div>

<div data-marpit-fragment>

```sh
# go rename tool
gorename

# go refactoring tool: rename, extract, var: used by IDEs
godoctor
```

</div>

<!--
code/03-refactor
-->

---

## Explore

<div data-marpit-fragment>

```sh
# view documentation for the strings package
go doc strings
# view full documentation for the strings package
go doc -all strings | less
# view documentation for the strings.Replace function
go doc strings.Replace
# show source code for symbol
go doc -src strings.Replace
```

</div>

<div data-marpit-fragment>

**offline documentation**

```sh
# run go documentation server (offline) :6060
godoc
```

</div>

---

## Explore (Enhance)

```sh
# color: show source code for symbol
godocc github.com/urfave/cli.GenericFlag.Apply

# color: view documentation for the strings.Replace function
godocc -src github.com/urfave/cli.GenericFlag.Apply

# visualize go source code dependency tree
depth github.com/prometheus/client_golang/prometheus

# print import chains in which the 'regexp' package is found
depth -explain regexp github.com/prometheus/client_golang/prometheus

# explore visual call graph
go-callvis -nostd gtoken
```

---

## Dependency

```sh
# introspect Go packages and their interdependencies
go list  -f '{{ join .Imports "\n" }}'
# list all modules
go list -m all
# list outdated direct modules
go list -f '{{if and (not .Indirect) .Update}}{{.}}{{end}}' -u -m all

# add missing and remove unused modules
go mod tidy
# explain why packages or modules are needed
go mod why

# scan for embedded licenses
golicense -verbose -license .golicense.json [app.binary]
```

<!--
A module is a collection of related Go packages that are versioned together as a single unit.
https://dave.cheney.net/2014/09/14/go-list-your-swiss-army-knife
go list -u -m -json all | go-mod-outdated -direct

golicense show config file
golicense gtoken | gtoken-webhook
-->

---

## Build

```sh
# list supported architectures and OS for Go builder
go tool dist list

# build linux arm64 executable
GOOS=linux GOARCH=amd64 go build -o=.bin/$GOOS_$GOARCH/app .

# inspect linker flags
go tool link -help

# embed version info into build
go build -ldflags "-X main.Version=${VERSION} \
                   -X main.GitCommit=${COMMIT} \
                   -X main.GitBranch=${BRANCH} \
                   -X main.BuildDate=${DATE}" .
```

<!--
GOOS=linux GOARCH=arm64 go build -o=.bin/app .
file .bin/app
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
go build -ldflags='-s -w -extldflags "-static"' -o=.bin/app

# portable packer for binaries: 40-60% final size reduce
- upx --best [--brute]
```

<!-- 
https://www.lucasepe.it/posts/golang-static-builds/
https://blog.hashbangbash.com/2014/04/linking-golang-statically/
consider demo on github-webhook
-->

---

## Build Tags

<div data-marpit-fragment>
build (linux AND arm64) OR (darwin AND (NOT cgo))

```go
// +build linux,amd86 darwin,!cgo
package app
...
```

</div>

<div data-marpit-fragment>
build/test only if `--tags=integration` is provided

```go
// +build integration
package app
import "testing"
...
```

</div>

<!--
https://mickey.dev/posts/go-build-tags-testing/ 
-->

---

## Test

```sh
# run tests
go test

# run tests with code coverage
go test -cover

# test with race condition
go test -race

# enrich test result output
richgo test
```

---

## Tests/Mock Generation

```sh
# generate table driven tests
gotests

# generate mock for Go interfaces
mockery
```

<!--
https://tutorialedge.net/golang/improving-your-tests-with-testify-go/
-->

---

## Benchmark

```sh
# run benchmark only, skipping tests
go test -run=^$ -bench=. ./...

# compare benchmark results
benchcmp old.txt new.txt
```

---

## Static Analysis

<div data-marpit-fragment>

```sh
# inspect vet tool
go tool vet help
go vet

# report unchecked errors
errcheck

# ... other linter tools
```

</div>

<div data-marpit-fragment>

**golangci-lint:** _linters aggregator_

```sh
# run all linters
golangci-lint run --enable-all
```

</div>

---

## Profile

```sh
# collect profile results: cpu, memory, block, mutex
go test -bench="^Benchmark(.*)$" -cpuprofile=/tmp/cpuprofile.out .

# inspect profile results
go tool pprof -http=:8080 /tmp/cpuprofile.out
```

---

## Build Automation

### Makefile

* Build != Compile
* Same tool for each phase
* Language and tool agnostic
* Multi-platform
* Environment and compile-time variables
* Reproducible builds

---

## Makefile (example)

```makefile
    GOCMD=go
    GOBUILD=$(GOCMD) build
    GOCLEAN=$(GOCMD) clean
    GOTEST=$(GOCMD) test
    BINARY_NAME=app

    all: test build
    build:
            $(GOBUILD) -o $(BINARY_NAME) -v
    test:
            $(GOTEST) -v ./...
    clean:
            $(GOCLEAN)
            rm -f $(BINARY_NAME) $(BINARY_LINUX)
```

---

## Build with Docker

```dockerfile
# test and build
FROM golang:1.13 AS builder
RUN mkdir -p /go/src/app
WORKDIR /go/src/app
COPY go.* .
RUN --mount=type=cache,target=/go/mod go mod download
COPY . .
RUN make

#--- release
FROM scratch
COPY --from=build /go/src/app/.bin/app /app
ENTRYPOINT ["/app"]
```

---
<style scoped>
h2 {
  color: DimGray;
}
</style>

## GoReleaser

![bg contain opacity:.6](https://i.imgur.com/316a9UT.png)

<div data-marpit-fragment>

```yaml
repo: goreleaser/releaser
binary_name: app
changelog:
  sort: asc
brew:
  repo: app/homebrew-formulae
builds:
  goos:
  - linux
  - darwin
  - windows
  goarch:
  - amd64
```

</div>

<!--
https://github.com/doitintl/secrets-init 
-->

---

## Badges

* ![height:45](https://camo.githubusercontent.com/072857af59b99a995d5e66cdac76fc224825c169/68747470733a2f2f676f7265706f7274636172642e636f6d2f62616467652f6769746875622e636f6d2f616c657865692d6c65642f70756d6261) `goreportcard`

* ![height:45](https://s3.amazonaws.com/assets.coveralls.io/badges/coveralls_90.svg) `coveralls.io`

* ![height:45](https://camo.githubusercontent.com/b216815be8df59ecf97f5926a579af746d79f613/68747470733a2f2f676f646f632e6f72672f6769746875622e636f6d2f676f6875676f696f2f6875676f3f7374617475732e737667) `godoc`

* ![height:45](https://github.com/alexei-led/pumba/workflows/Pumba%20CI/badge.svg) `github actions`

---

## Thank you

![invert:100% height:50](https://cdn1.iconfinder.com/data/icons/social-media-rounded-corners/512/Rounded_Medium3_svg-64.png) ![invert height:50](https://pngimage.net/wp-content/uploads/2018/06/twitter-icon-black-png-1.png) @alexeiled

<br/>

[github.com/alexei-led/presentations](https://github.com/alexei-led/presentations)
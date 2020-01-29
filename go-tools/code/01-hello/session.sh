# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

# inspect Go SDK
go help
clear

#explore Go environment
go env

go env GOPROXY GOROOT GOCACHE

go env --json | jq .

go env -json | jq -r '.GOPROXY'
clear

# start writing Go code
go mod init main

ccat file.txt | tee main.go

goimports -l .

goimports -d main.go | colordiff

goimports -w main.go

ccat main.go
clear

# run Go code
go run .

./clean.sh
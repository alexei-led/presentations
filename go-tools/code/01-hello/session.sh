# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

# inspect Go SDK
go help | bat -l man
go help cache | bat -l man
clear

#explore Go environment
go env | bat -l ini

go env GOPROXY GOROOT GOCACHE

go env --json | jq .

go env -json | jq -r '.GOPROXY'
clear

# start writing Go code
go mod init main

cat file.txt | tee main.go | bat -l go
clear

# list not properly formated Go files
goimports -l .

goimports -d main.go | colordiff

goimports -w main.go

bat main.go
clear

# run Go code
go run .

./clean.sh

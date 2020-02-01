#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

# start writing Go code
go mod init main

cat file.txt | tee main.go | bat -l go

# list not properly formated Go files
goimports -l .

goimports -d main.go | colordiff

goimports -w main.go

bat main.go
clear

# mechanical source transformation
bat compare.go

gofmt -r 'bytes.Compare(slice_1, slice_2) == 0 -> bytes.Equal(slice_1, slice_2)' compare.go | colordiff compare.go - 

./clean.sh

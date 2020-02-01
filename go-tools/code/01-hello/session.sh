#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

# inspect Go SDK
go help | bat -l man
clear

#explore Go environment
go env | bat -l ini

go env GOPROXY GOROOT GOCACHE

go env --json | jq .

go env -json | jq -r '.GOPROXY'
clear


#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

bat main.go

# should compile without errors
go build

# go vet - run static code analysis
go vet

# search fo unchecked errors
errcheck

# run multiple linters with golangci-lint
golangci-lint run
clear

# list available linters
golangci-lint linters
clear

# run with all linters enabled
golangci-lint run --enable-all


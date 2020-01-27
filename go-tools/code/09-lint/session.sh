# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true

ccat main.go

# should compile without errors
go build

# go vet - run static code analysis
go vet

# search fo unchecked errors
errcheck

# run multiple linters with golangci-lint
golangci-lint run
clear

# run with all linters enabled
golangci-lint run --enable-all


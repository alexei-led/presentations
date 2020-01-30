# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true

tree
bat main.go

# generate table driven tests
gotests -all -w main.go
bat main_test.go
clear

# generate mock
mockery -all -inpkg
bat mock_MessageService.go
clear

# use mock in test
cat main_test.go.txt > main_test.go
bat main_test.go
go test -v .
clear

# nice test output
richgo test -v -cover .

./clean.sh



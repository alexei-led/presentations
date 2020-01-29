# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true

tree
ccat main.go

# generate table driven tests
gotests -all -w main.go
ccat main_test.go
clear

# generate mock
mockery -all -inpkg
ccat mock_MessageService.go
clear

# use mock in test
cat main_test.go.txt > main_test.go
ccat main_test.go
go test -v .
clear

# nice test output
richgo test -v -cover .

./clean.sh



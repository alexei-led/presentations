#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

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

richgo test -v -cover .

./clean.sh



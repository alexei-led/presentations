# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true

# generate table driven tests
gotests -all -w main.go
ccat main_test.go
clear

# generate mock
mockery -all -inpkg
ccat mock_MessageService.go
clear

# use mock in test
cat main_test.go.txt | tee main_test.go
go test -v .
clear

# nice test output
richgo test -v -cover .

./clean.sh



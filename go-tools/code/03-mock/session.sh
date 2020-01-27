# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true

# generate table driven tests
gotests -all -w main.go

# generate mock
mockery -all -inpkg 



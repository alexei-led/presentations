# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: default
#doitlive commentecho: true

go mod init main

#
# write simple go app
ccat file.txt | tee main.go

#
# preview format and fix imports
goimports -d main.go | colordiff

#
# format code and fix imports
goimports -w main.go

ccat main.go

go run .

./clean.sh
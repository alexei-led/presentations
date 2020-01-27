# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

godoctor -help
godoctor -list
clear

# rename variable
cd rename
ccat rename.go
cat rename.go | godoctor -pos 6,5:6,5 rename host | colordiff
clear

# extract function
cd ../extract
ccat extract.go
cat extract.go | godoctor -pos 8,1:13,1 extract countLines | colordiff
cd ..

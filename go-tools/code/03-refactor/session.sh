# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

godoctor -help
godoctor -list
clear

# rename variable
cd rename
bat rename.go
cat rename.go | godoctor -pos 6,5:6,5 rename host | colordiff
clear

# extract function
cd ../extract
bat extract.go
cat extract.go | godoctor -pos 8,1:13,1 extract countLines | colordiff
cd ..

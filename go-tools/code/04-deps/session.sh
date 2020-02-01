#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

cd /Users/alexei/Workspace/gcp/gke/gtoken/cmd/gtoken
bat main.go

# introspect Go packages and their interdependencies
go list all
go list -m all
go help list | bat -l man
clear

# play with go list
go list  -f '{{ join .Imports "\n" }}'
clear

# list outdated direct modules
go list -f '{{if and (not .Indirect) .Update}}{{.}}{{end}}' -u -m all

# explain why packages or modules are needed
depth -explain regexp gtoken
clear

# scan for embedded licenses
golicense -verbose -license ../../.golicense.json .bin/gtoken
bat ../../.golicense.json

cd -

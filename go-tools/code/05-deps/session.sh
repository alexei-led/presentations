#doitlive shell: /bin/bash
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

cd /Users/alexei/Workspace/gcp/gke/gtoken/cmd/gtoken
tree
head -30 main.go | ccat

# introspect Go packages and their interdependencies
go list  -f '{{ join .Imports "\n" }}'
clear

# list all modules
go list -m all
clear

# list outdated direct modules
go list -f '{{if and (not .Indirect) .Update}}{{.}}{{end}}' -u -m all

# prettify outaded modules list as table
go list -u -m -json all | go-mod-outdated -direct
clear

# add missing and remove unused modules
go mod tidy -v
git reset --hard HEAD

# explain why packages or modules are needed
go mod why regexp
clear

# scan for embedded licenses
golicense -verbose -license ../../.golicense.json .bin/gtoken

cd -
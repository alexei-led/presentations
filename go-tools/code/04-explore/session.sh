#doitlive shell: /bin/bash
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

go doc strings
clear

# view full documentation for the strings package
go doc -all strings | less
clear

# view documentation for the strings.Replace function
go doc strings.Replace
go doc -src strings.Replace
clear

# open offline documentation
godoc &
open http://localhost:6060
pkill godoc
clear

# now in color
cd /Users/alexei/Workspace/gcp/gke/gtoken/cmd/gtoken
godocc github.com/urfave/cli.GenericFlag.Apply
godocc -src github.com/urfave/cli.GenericFlag.Apply
godocc -src github.com/urfave/cli.GenericFlag.ApplyWithError
clear

# visualize go source code dependency tree
depth github.com/prometheus/client_golang/prometheus

# print import chains in which the 'regexp' package is found
depth -explain regexp github.com/prometheus/client_golang/prometheus

# explore visual call graph
go-callvis -nostd gtoken
cd -


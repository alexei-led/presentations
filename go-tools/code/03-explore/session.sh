#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

# view full documentation for the strings package
go doc -all strings | less

# view documentation for the strings.Replace function
go doc strings.Replace
go doc -src strings.Replace | bat -l go

# open offline documentation
godoc -http=:6060 &
open http://localhost:6060
pkill godoc



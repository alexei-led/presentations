#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2

bat anonymizer_test.go

#
# fisrt version of anonymyzer
cat anonymizer.go.v1 | tee anonymizer.go | bat -l go

#
# run benchmark and keep results in v1.txt
go test -bench=. | tee v1.txt

#
# imporve anonymizer function
cat anonymizer.go.v2 | tee anonymizer.go | bat -l go

#
# run benchmark and keep results in v2.txt
go test -bench=. | tee v2.txt

#
# compare benchmark results
benchcmp v1.txt v2.txt


./clean.sh
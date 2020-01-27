# Recorded with the doitlive recorder
#doitlive shell: /bin/bash
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true

ccat anonymizer_test.go


#
# fisrt version of anonymyzer
ccat anonymizer.go.v1 | tee anonymizer.go

#
# run benchmark and keep results in v1.txt
go test -bench=. | tee v1.txt

#
# imporve anonymizer function
ccat anonymizer.go.v2 | tee anonymizer.go

#
# run benchmark and keep results in v2.txt
go test -bench=. | tee v2.txt

#
# compare benchmark results
benchcmp v1.txt v2.txt


./clean.sh
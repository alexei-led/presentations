# Recorded with the doitlive recorder
#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$

bat mypkg.go
clear

bat mypkg_test.go
clear

go test -bench=BeginsWithRegex -cpuprofile=cpuprofile_regex.out | tee regex.txt

go test -bench=BeginsWithCompiledRegex -cpuprofile=cpuprofile_compiled.out | tee compiled.txt

go test -bench=BeginsWithString -cpuprofile=cpuprofile_string.out | tee string.txt

nohup go tool pprof -http=:8080 cpuprofile_regex.out &

nohup go tool pprof -http=:8081 cpuprofile_compiled.out &

nohup go tool pprof -http=:8082 cpuprofile_string.out &

./clean.sh

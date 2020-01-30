#doitlive shell: /bin/zsh
#doitlive prompt: {user.green.bold}:{dir.green}$
#doitlive commentecho: true
#doitlive speed: 2
cd /Users/alexei/Workspace/goapp

# list supported architectures and OS for Go builder
go tool dist list

# build linux and windows arm64 executable
GOOS=linux GOARCH=amd64 go build -o=.bin/goapp_linux .
GOOS=windows GOARCH=amd64 go build -o=.bin/goapp_windows .
file .bin/goapp_linux
file .bin/goapp_windows
clear

# inspect linker flags
go tool link -help
clear

# prepare env
export VERSION=$(git describe --tags --always --dirty)
export COMMIT=$(git rev-parse --short HEAD)
export BRANCH=$(git rev-parse --abbrev-ref HEAD)
export DATE=$(date +%FT%T%z)

# build binary
go build -ldflags "-X main.Version=${VERSION} -X main.GitCommit=${COMMIT} -X main.GitBranch=${BRANCH} -X main.BuildDate=${DATE}" -o .bin/goapp 
.bin/goapp --version

cd -
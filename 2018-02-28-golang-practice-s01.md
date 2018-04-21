# Environment Setup

## Install golang
https://github.com/jenac/playground/blob/master/ubuntu1604/golang-1.10.sh

## Set Environment Variables
```
export GOPATH=/home/lihe/go
export PATH=$PATH:$GOPATH/bin
```

## Folder Structure
```
mkdir -p ~/go
mkdir -p ~/go/src/github.com/jenac/hello
mkdir -p ~/go/pkg
mkdir -p ~/go/bin
```

## Install All Project Dependencies
```
go get ./...
```

## Misc comamnd
```
go get <package name>
go build
go install
```
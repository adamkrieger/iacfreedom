#!/usr/bin/env bash
mkdir -p bin

go get -u "github.com/aws/aws-lambda-go/events"
go get -u "github.com/aws/aws-lambda-go/lambda"

GOOS=linux go build -o bin/main productlistfunction.go
mkdir -p binpkg
zip -rj binpkg/productlistfunction.zip bin
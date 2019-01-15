#!/usr/bin/env ash
mkdir -p bin

echo Getting golang Dependencies

go get -u "github.com/gin-gonic/gin"

echo Building Executable

GOOS=linux go build -a -o bin/orderservice main.go

echo Copying Executable to Media Library

# aws s3 cp --profile $1 ./bin/orderservice s3://bin-iacfreedom/orderservice/1.0.0/orderservice
aws s3 cp ./bin/orderservice s3://bin-iacfreedom/orderservice/1.0.0/orderservice

# ls -al bin

# docker build \
#     -t iactalk_orderservice \
#     .
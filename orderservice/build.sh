#!/usr/bin/env ash
mkdir -p bin

go get -u "github.com/gin-gonic/gin"

GOOS=linux go build -a -o bin/orderservice main.go

pip --version

aws s3 cp --profile iacbuildtemp ./bin/orderservice s3://bin-iacfreedom/orderservice/1.0.0/orderservice

# ls -al bin

# docker build \
#     -t iactalk_orderservice \
#     .
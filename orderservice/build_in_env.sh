#!/usr/bin/env bash
AWS_ACCT_NUM=$(aws sts get-caller-identity --output text --profile iacbuildtemp --query 'Account')
docker run -it --rm -v $PWD:/src \
    $AWS_ACCT_NUM.dkr.ecr.us-east-1.amazonaws.com/golang_svc_buildenv:1.10 ./build.sh iacbuildtemp

# mkdir -p bin

# go get -u "github.com/gin-gonic/gin"

# GOOS=linux go build -a -o bin/orderservice main.go

# pip --version

# aws s3 cp --profile iacbuildtemp ./bin/orderservice s3://bin-iacfreedom/orderservice/1.0.0/orderservice

# ls -al bin

# docker build \
#     -t iactalk_orderservice \
#     .
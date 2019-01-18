#!/usr/bin/env ash
mkdir -p bin

echo Exporting Relevant Variables

export MAJOR=$(cat config/major.txt)
export MINOR=$(cat config/minor.txt)
export VERSION_NUM=$(python nextver.py iacf_order_service $MAJOR $MINOR)

echo Getting golang Dependencies

go get -u "github.com/gin-gonic/gin"

echo Building Executable

GOOS=linux go build -a -o bin/orderservice main.go

rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

# echo Copying Executable to Media Library

# # aws s3 cp --profile $1 ./bin/orderservice s3://bin-iacfreedom/orderservice/1.0.0/orderservice
# aws s3 cp ./bin/orderservice s3://bin-iacfreedom/orderservice/1.0.0/orderservice

# ls -al bin

# docker build \
#     -t iactalk_orderservice \
#     .
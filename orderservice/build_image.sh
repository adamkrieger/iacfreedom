#!/usr/bin/env bash
aws s3 cp --profile iacbuildtemp s3://bin-iacfreedom/orderservice/1.0.0/orderservice ./bin/orderservice

# ls -al bin

# docker build \
#     -t iactalk_orderservice \
#     .
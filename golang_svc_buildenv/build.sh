#!/usr/bin/env bash

echo Building build env image...

docker build \
    -t golang_svc_buildenv:1.10 \
    .

echo Logging in to AWS ECR...

$(aws ecr get-login --profile iacbuildtemp --region us-east-1 --no-include-email)

echo Tagging Image for AWS ECR...

AWS_ACCT_NUM=$(aws sts get-caller-identity --output text --profile iacbuildtemp --query 'Account')
docker tag golang_svc_buildenv:1.10 $AWS_ACCT_NUM.dkr.ecr.us-east-1.amazonaws.com/golang_svc_buildenv:1.10

echo Push Image to AWS ECR Repository...

docker push $AWS_ACCT_NUM.dkr.ecr.us-east-1.amazonaws.com/golang_svc_buildenv:1.10

echo Done
echo
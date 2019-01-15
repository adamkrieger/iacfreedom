#!/usr/bin/env ash

echo Tagging Image for AWS ECR...

AWS_ACCT_NUM=$(aws sts get-caller-identity --output text --query 'Account')
docker tag iacf_order_service:$BUILDENVVER $AWS_ACCT_NUM.dkr.ecr.us-east-1.amazonaws.com/iacf_order_service:1.0.0

echo Push Image to AWS ECR Repository...

docker push $AWS_ACCT_NUM.dkr.ecr.us-east-1.amazonaws.com/iacf_order_service:1.0.0

echo Done
echo
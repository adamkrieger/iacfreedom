#!/usr/bin/env ash

echo Tagging Image for AWS ECR...

AWS_ACCT_NUM=$(aws sts get-caller-identity --output text --query 'Account')
docker tag iacf_order_service:$1 $AWS_ACCT_NUM.dkr.ecr.us-east-1.amazonaws.com/iacf_order_service:$1

echo Push Image to AWS ECR Repository...

$(aws ecr get-login --region us-east-1 --no-include-email)
docker push $AWS_ACCT_NUM.dkr.ecr.us-east-1.amazonaws.com/iacf_order_service:$1

rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi

echo Done
echo
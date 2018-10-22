#!/usr/bin/env bash

docker run -it --rm \
    -v `pwd`/ansible:/opt/ansible \
    --name ansible_iac_instance \
    -e AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID \
    -e AWS_SECRET_ACCESS_KEY=$AWS_SECRET_ACCESS_KEY \
    ansible_iac

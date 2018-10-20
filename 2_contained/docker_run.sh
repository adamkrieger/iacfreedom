#!/usr/bin/env bash

docker run -it --rm \
    -v `pwd`/ansible:/opt/ansible \
    --name ansible_iac_instance \
    ansible_iac

#!/usr/bin/env ash

docker build \
    -t iacf_order_service:$1 \
    .

rc=$?; if [[ $rc != 0 ]]; then exit $rc; fi
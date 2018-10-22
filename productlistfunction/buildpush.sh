#!/usr/bin/env bash
./build.sh

aws s3 cp ./binpkg/productlistfunction.zip s3://bin-iacfreedom/productlistfunction/1.0.1/productlistfunction.zip

#!/usr/bin/env bash
export AWS_REGION=eu-west-1
export DIST_OUTPUT_BUCKET=webgames-game-analytic
export SOLUTION_NAME=game-analytic
export VERSION=v1.1.1
cd ./deployment
./build-s3-dist.sh $DIST_OUTPUT_BUCKET $SOLUTION_NAME $VERSION
aws s3 cp ./global-s3-assets s3://$DIST_OUTPUT_BUCKET-$AWS_REGION/$SOLUTION_NAME/$VERSION --recursive --acl bucket-owner-full-control
aws s3 cp ./regional-s3-assets s3://$DIST_OUTPUT_BUCKET-$AWS_REGION/$SOLUTION_NAME/$VERSION --recursive --acl bucket-owner-full-control

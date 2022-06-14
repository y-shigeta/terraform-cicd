#!/bin/sh

MESSAGE=$(git log ${CODEBUILD_SOURCE_VERSION} -1 --pretty=format:"%s")
echo ${MESSAGE}
CODEBUILD_SOURCE_VERSION=$(echo ${MESSAGE} | cut -f4 -d' ' | sed 's/#/pr\//')
echo ${CODEBUILD_SOURCE_VERSION}
terraform init -input=false -no-color
terraform apply -input=false -no-color -auto-approve

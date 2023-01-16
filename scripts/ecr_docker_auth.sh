#!/bin/bash
# Authenticate my Docker client to an Amazon ECR registry

# TODO: get these from a command
# Default for now
readonly REGION='us-east-1'
readonly ACCOUNT_ID=''

aws ecr get-login-password --region "${REGION}" | \
    docker login --username AWS --password-stdin "${ACCOUNT_ID}.dkr.ecr.region.amazonaws.com"

#!/bin/bash
# Authenticate my Docker client to an Amazon ECR registry

# TODO: check these work
# Default should be us-east-1
# If using a profile you'd need aws configure get region --profile PROFILE
readonly REGION="$(aws configure get region)"
readonly ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"

aws ecr get-login-password --region "${REGION}" | \
    docker login --username AWS --password-stdin "${ACCOUNT_ID}.dkr.ecr.region.amazonaws.com"

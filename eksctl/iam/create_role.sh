#!/bin/bash
# Create role for to use for eksctl
# Policies from https://eksctl.io/usage/minimum-iam-policies/

# TODO: check this works

readonly ROLE_NAME='eksctl-robot'
readonly ACCOUNT_ID="$(aws sts get-caller-identity --query Account --output text)"

# TODO: probably replace account ID in the trust policy file

# Trust policy
aws iam create-role \
    --role-name "${ROLE_NAME}"
    --assume-role-policy-document policies/eksctl_role_trust_policy.json

# AWS managed policies
aws iam attach-role-policy \
    --role-name "${ROLE_NAME}" \
    --policy-arn arn:aws:iam::aws:policy/AmazonEC2FullAccess

aws iam attach-role-policy \
    --role-name "${ROLE_NAME}" \
    --policy-arn arn:aws:iam::aws:policy/AWSCloudFormationFullAccess

# TODO: replace account ID in these policy files

# Customer managed policies
aws iam create-policy \
    --policy-name eks-all-access \
    --policy-document file://policies/eks_all_access.json

aws iam create-policy \
    --policy-name iam-limited-access \
    --policy-document file://policies/iam_limited_access.json

aws iam attach-role-policy \
    --role-name "${ROLE_NAME}" \
    --policy-arn "arn:aws:iam::${ACCOUNT_ID}:policy/eks-all-access"

aws iam attach-role-policy \
    --role-name "${ROLE_NAME}" \
    --policy-arn "arn:aws:iam::${ACCOUNT_ID}:policy/iam-limited-access"

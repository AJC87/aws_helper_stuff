#!/bin/bash
# Run assume role command to get credentials and export them so you can use the role

# TODO: FINISH ME

# TODO: pass into script
readonly ACCOUNT_ID=''
readonly ROLE_NAME=''
readonly ROLE_SESSION_NAME='testing'

aws sts assume-role \
    --role-arn "arn:aws:iam::${ACCOUNT_ID}:role/${ROLE_NAME}" \
    --role-session-name "${ROLE_SESSION_NAME}"

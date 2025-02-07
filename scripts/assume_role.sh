#!/bin/bash
# Run assume role command to get credentials and export them so you can use the role

# TODO: FINISH ME

# TODO: pass into script
readonly ACCOUNT_ID=''
readonly ROLE_NAME=''
readonly ROLE_SESSION_NAME='testing'

# TODO: get the credentials from the command and export them, also use a profile for this
aws sts assume-role \
    --role-arn "arn:aws:iam::${ACCOUNT_ID}:role/${ROLE_NAME}" \
    --role-session-name "${ROLE_SESSION_NAME}"

# Print the role to confirm that we have switched to it
aws sts get-caller-identity

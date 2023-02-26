#!/bin/bash
# Make credential report FINISH ME

# TODO: test it out

aws iam generate-credential-report

aws iam get-credential-report

# TODO: Base64
aws iam get-credential-report --output text --query Content

# TODO: check does it look right in spreadsheet

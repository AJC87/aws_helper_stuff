#!/bin/bash
# Get canonical user ID (needed for S3 ACLs)

aws s3api list-buckets --query Owner.ID --output text

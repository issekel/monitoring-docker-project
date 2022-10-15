#!/bin/bash

export AWS_ACCESS_KEY_ID="admin"
export AWS_SECRET_ACCESS_KEY="{{ inventory_minio_secret_key }}"

ENDPOINT="http://{{ inventory_minio_host }}:{{ inventory_minio_port }}"
BUCKET="reporter"

# aws s3api --endpoint-url "${ENDPOINT}" list-buckets
aws s3api --endpoint-url "${ENDPOINT}" create-bucket --bucket "${BUCKET}"

# aws s3api --endpoint-url "${ENDPOINT}" get-bucket-lifecycle-configuration --bucket "${BUCKET}"
aws s3api --endpoint-url "${ENDPOINT}" put-bucket-lifecycle-configuration --bucket "${BUCKET}" --lifecycle-configuration file://bucket-lifecycle.json
# aws s3api --endpoint-url "${ENDPOINT}" delete-bucket-lifecycle            --bucket "${BUCKET}"

aws s3api --endpoint-url "${ENDPOINT}" put-bucket-policy --bucket "${BUCKET}" --policy file://bucket-policy.json
# aws s3api --endpoint-url "${ENDPOINT}" get-bucket-policy --bucket "${BUCKET}"
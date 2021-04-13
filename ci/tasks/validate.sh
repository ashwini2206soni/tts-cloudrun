#!/bin/sh

set -e

cat <<< ${TF_PROVIDER_GCP_CREDENTIALS} >> credentials.json

echo "==> Init <=="
terraform init \
    -input=false \
    -no-color \
    ./terraform

echo "==> Plan <=="
terraform plan \
    -input=false \
    -no-color \
    -var-file=terraform/default.tfvars \
    ./terraform
echo "==> Done <=="

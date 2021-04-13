#!/bin/sh

set -e

echo "${TF_PROVIDER_GCP_CREDENTIALS}" > credentials.json
export CLOUDSDK_CORE_PROJECT='ashwini-consulting'
export GOOGLE_APPLICATION_CREDENTIALS='credentials.json'
echo "==> Init <=="
terraform init \
    -input=false \
    -no-color \
    ./terraform



echo "==> Plan <=="
terraform plan \
    -out=main.tfplan \
    -input=false \
    -no-color \
    -var-file=terraform/default.tfvars \
    ./terraform

echo "==> Apply <=="
terraform apply \
    -input=false \
    -no-color \
    main.tfplan
echo "==> Done <=="

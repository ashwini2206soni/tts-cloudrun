#!/bin/sh

set -e

echo "${TF_PROVIDER_GCP_CREDENTIALS}" > credentials.json
gcloud auth activate-service-account ashwini-consulting-sa@ashwini-consulting.iam.gserviceaccount.com --key-file=credentials.json --project='ashwini-consulting'

gcloudd builds submit --tag gcr.io/ashwini-consulting/front:v2
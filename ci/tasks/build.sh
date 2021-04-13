#!/bin/sh

set -e
cd text-speech/
echo "${TF_PROVIDER_GCP_CREDENTIALS}" > credentials.json
gcloud auth activate-service-account ashwini-consulting-sa@ashwini-consulting.iam.gserviceaccount.com --key-file=credentials.json --project='ashwini-consulting'

gcloud builds submit --tag gcr.io/ashwini-consulting/front:v2
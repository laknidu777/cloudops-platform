#!/bin/bash
set -euo pipefail

MY_IP=$(curl -4 -fsS https://checkip.amazonaws.com | tr -d '\n')

echo "Detected public IP: $MY_IP"

terraform -chdir=infrastructure/terraform/aws-lab plan \
  -var="ssh_allowed_cidr=${MY_IP}/32"

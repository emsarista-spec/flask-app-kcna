#!/bin/bash
set -e

REGION="ap-southeast-2"
ACCOUNT_ID="598497819406"
ECR_SERVER="${ACCOUNT_ID}.dkr.ecr.${REGION}.amazonaws.com"

echo "Logging into ECR..."
aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $ECR_SERVER

echo "Creating ECR pull secret in Kubernetes..."
kubectl delete secret ecr-secret --ignore-not-found
kubectl create secret docker-registry ecr-secret \
  --docker-server=$ECR_SERVER \
  --docker-username=AWS \
  --docker-password=$(aws ecr get-login-password --region $REGION)

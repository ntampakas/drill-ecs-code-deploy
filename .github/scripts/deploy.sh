#!/bin/bash
set -ex

DEPLOY_ID=$(aws deploy create-deployment --cli-input-yaml file://create-deployment.yaml --region eu-central-1 --output text)

while true; do
  STATUS=$(aws deploy get-deployment --deployment-id $DEPLOY_ID --query 'deploymentInfo.status' --output text)
  if [ $STATUS != "InProgress" ] && [ $STATUS != "Created" ]; then
    if [ $STATUS = "Succeeded" ]; then
       echo "SUCCESS"
       exit 0
    else
       echo "Failed"
       exit 1
    fi
  else
    echo "Deploying..."
  fi
     sleep 30
done

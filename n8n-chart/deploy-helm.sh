#!/bin/bash

echo "Deploying n8n with Helm..."

# Install/upgrade the chart
helm upgrade --install n8n . \
  --namespace n8n \
  --create-namespace \
  --wait \
  --timeout=10m

echo "Deployment complete!"
echo "Get service info: kubectl get svc n8n -n n8n"

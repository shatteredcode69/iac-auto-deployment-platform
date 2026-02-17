#!/bin/bash

set -e

echo "🚀 Starting deployment..."

# Move to project root (one level up from scripts)
cd "$(dirname "$0")/.."

echo "📦 Initializing Terraform..."
cd terraform
terraform init -input=false

echo "🏗 Applying Terraform configuration..."
terraform apply -auto-approve

echo ""
echo "✅ Deployment successful!"
echo "🌐 Application is live at: http://localhost:3000"
echo ""

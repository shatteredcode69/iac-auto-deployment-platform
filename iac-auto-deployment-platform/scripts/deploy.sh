#!/bin/bash

set -e  # Exit immediately if a command fails

echo "🚀 Starting deployment..."

# Navigate to terraform directory
cd terraform

echo "📦 Initializing Terraform..."
terraform init -input=false

echo "🏗 Applying Terraform configuration..."
terraform apply -auto-approve

echo "🔍 Fetching application URL..."

# Since we are mapping port 3000 locally
APP_URL="http://localhost:3000"

echo ""
echo "✅ Deployment successful!"
echo "🌐 Application is live at: $APP_URL"
echo ""

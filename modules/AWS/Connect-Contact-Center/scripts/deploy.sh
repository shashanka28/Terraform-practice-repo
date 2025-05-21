#!/bin/bash
set -e

ENV_NAME=$1
cd environments/$ENV_NAME

echo "🔧 Initializing Terraform for $ENV_NAME"
terraform init -input=false

echo "📋 Planning Terraform for $ENV_NAME"
terraform plan -out=tfplan

echo "🚀 Applying Terraform for $ENV_NAME"
terraform apply -auto-approve tfplan

echo "✅ Terraform Succeeded"

# Get outputs for Ansible
export CONNECT_INSTANCE_ID=$(terraform output -raw connect_instance_id)
export LAMBDA_ARN=$(terraform output -raw lambda_function_arn)

echo "🔧 Running Ansible post-deploy tasks for Amazon Connect..."
cd ../../ansible
ansible-playbook playbooks/configure_connect.yml -e "env=$ENV_NAME"

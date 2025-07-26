## State File Mannagemmnet - Remote Backend

# How Terraform Updates Infrastructure

* Goal: Keep actual state same as desired state
* State File: Actual state resides in terraform.tfstate file
* Process: Terraform compares current state with desired configuration
* Updates: Only changes the resources that need modification

**Terraform lock** refers to a mechanism used to prevent multiple Terraform processes from simultaneously modifying the same Terraform state file, which could lead to conflicts and data corruption.

# Terraform State File

The state file is a JSON file that contains:
* Resource metadata and current configuration
* Resource dependencies
* Provider information
* Resource attribute values

# State File Best Practices

- Never edit state file manually
- Store state file remotely (not in local file system)
- Enable state locking to prevent concurrent modifications
- Backup state files regularly
- Use separate state files for different environments
- Restrict access to state files (contains sensitive data)
- Encrypt state files at rest and in transit

# Remote Backend Benefits

* Collaboration: Team members can share state
* Locking: Prevents concurrent state modifications
* Security: Encrypted storage and access control
* Backup: Automatic versioning and backup
* Durability: Highly available storage

# AWS Remote Backend Components

1. S3 Bucket: Stores the state file
2. DynamoDB Table: Provides state locking mechanism
3. IAM Policies: Control access to backend resources


## Steps to Setup Remote Backend

* Step 1: Create S3 Bucket for State Storage
Create an S3 bucket with versioning enabled to store Terraform state files.

* Step 2: Create DynamoDB Table for State Locking
Create a DynamoDB table with a primary key named LockID (String) for state locking.

* Step 3: Configure Backend in Terraform
Update your Terraform configuration to use the S3 backend with DynamoDB for locking.


## Backend setup script

```bash
#!/bin/bash

BUCKET_NAME="terraform-state-$(date +%s)"
DYNAMODB_TABLE="terraform-state-lock"
REGION="us-east-1"

# Create S3 bucket for state storage
aws s3 mb s3://$BUCKET_NAME --region $REGION

# Enable versioning on the bucket
aws s3api put-bucket-versioning \
  --bucket $BUCKET_NAME \
  --versioning-configuration Status=Enabled

# Enable server-side encryption
aws s3api put-bucket-encryption \
  --bucket $BUCKET_NAME \
  --server-side-encryption-configuration '{
    "Rules": [
      {
        "ApplyServerSideEncryptionByDefault": {
          "SSEAlgorithm": "AES256"
        }
      }
    ]
  }'

# Create DynamoDB table for state locking
aws dynamodb create-table \
  --table-name $DYNAMODB_TABLE \
  --attribute-definitions AttributeName=LockID,AttributeType=S \
  --key-schema AttributeName=LockID,KeyType=HASH \
  --provisioned-throughput ReadCapacityUnits=5,WriteCapacityUnits=5 \
  --region $REGION
```

# Terraform

```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
```

## Backend Migration

```
# Initialize with new backend configuration
terraform init

# Terraform will prompt to migrate existing state
# Answer 'yes' to copy existing state to new backend

# Verify state is now remote
terraform state list
```

## State commands

```
# List resources in state
terraform state list

# Show detailed state information
terraform state show <resource_name>

# Remove resource from state (without destroying)
terraform state rm <resource_name>

# Move resource to different state address
terraform state mv <source> <destination>

# Pull current state and display
terraform state pull
```
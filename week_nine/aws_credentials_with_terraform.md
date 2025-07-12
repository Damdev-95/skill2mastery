## How to authenticate with Terraform using AWS

# Firstly, How to install AWS CLI on ubuntu 

```bash

# 1. Update your system
sudo apt update -y

# 2. Install unzip & curl (if not already installed)
sudo apt install unzip curl -y

# 3. Download the AWS CLI v2 installer
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"

# 4. Unzip the installer
unzip awscliv2.zip

# 5. Run the installer
sudo ./aws/install

# 6. Check the installation
aws --version
```

## The issue we had in class 😩😩😩

<img width="1288" height="335" alt="image" src="https://github.com/user-attachments/assets/c27435dd-d405-4ffb-9a5d-aa2c40da9f28" />

Ideally, the binary file should bbe located in 

`/usr/local/bin/aws `

But we can't find it there, the binary installer was found at 

`/usr/local/aws-cli/v2/current/bin/aws`

## How do we resolve

```bash
nano ~/.bashrc

# Add this line
export PATH=$PATH:/usr/local/aws-cli/v2/current/bin

# save the file and run this on terminal
source ~/.bashrc
```
## Yeah, we are good to go 😎😎😎

<img width="964" height="71" alt="image" src="https://github.com/user-attachments/assets/f887e875-9849-4429-8193-9b95e8ce4e2a" />




## Let's go to the real deal 

We have three ways to authenticate terraform using AWS

Approach #1: Embed credentials directly into the Terraform template file

```hcl
terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
    access_key = "your_aws_access_key"
    secret_key = "your_aws_secret_access_key"
}
```


Approach #2: Leverage Terminal Environment Variables on the CLI

```bash
export AWS_ACCESS_KEY_ID=your_aws_access_key
export AWS_SECRET_ACCESS_KEY=your_aws_secret_access_key
```


Approach #3: Shared Credentials File

```hcl
terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
    shared_credentials_file = "/home/.aws/credentials"
}
```

Usually for cli users, the path is available at /home/.aws/credentials

# To make it interesting, create a profile and edit the ~/.aws/credentials 

```bash
[terraform]
aws_access_key_id=AKIA1234567890
aws_secret_access_key=u3nyn5nz9ams38yvekr2
```

# provider.tf

```hcl
terraform {
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 4.0.0"
      }
    }
}

provider "aws" {
    region = "us-east-1"
    profile= terraform
}
```


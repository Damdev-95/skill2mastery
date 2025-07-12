## How to authenticate with Terraform using AWS

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


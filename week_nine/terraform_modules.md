

##  What is a Terraform Module?

A **Terraform module** is a collection of `.tf` files grouped together to manage a specific piece of infrastructure.

Modules help you:
- Reuse infrastructure code across projects
- Improve readability and organization
- Maintain DRY (Don't Repeat Yourself) principles

---

##  Types of Modules

- **Root Module**: Your main Terraform configuration (where you run `terraform apply`).
- **Child Module**: A module called from the root module or another module.

---

##  Module Directory Structure

```bash
project/
├── main.tf
├── variables.tf
├── outputs.tf
└── modules/
    └── ec2/
        ├── main.tf
        ├── variables.tf
        └── outputs.tf

# Creating an ec2 module: modules/ec2/main.tf

```
resource "aws_instance" "web_server" {
  ami           = var.ami
  instance_type = var.instance_type
  tags = {
    Name = var.name
  }
}
```

# Varaibles : modules/ec2/variables.tf

```
variable "ami" {}
variable "instance_type" {}
variable "name" {}
```

# Outputs : modules/ec2/outputs.tf

```
output "instance_id" {
  value = aws_instance.web_server.id
}
```

# The root module 
main.tf

```
provider "aws" {
  region = "us-east-1"
}

module "web_server" {
  source        = "./modules/ec2"
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  name          = "WebServer"
}

output "web_server_id" {
  value = module.web_server.instance_id
}

```


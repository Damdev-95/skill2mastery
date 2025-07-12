## Terraform : Infrastructure as a Code 

<img width="1080" height="609" alt="image" src="https://github.com/user-attachments/assets/4dca6063-864b-4099-a8d3-da666405a724" />

<img width="1020" height="561" alt="image" src="https://github.com/user-attachments/assets/f7b893fa-9bea-4f5b-bdc3-6309c0fbc43d" />


# Configuration Management

* Designed to Install and Manage Software
* Maintains Standard Structure
* Version Control
* Idempotent

# Server Templating

* Pre Installed Software and Dependencies
* Virtual Machine or Docker Images
* Immutable Infrastructure

# Provisioning Tools

* Deploy Immutable Infrastructure resources
* Servers, Databases, Network Components etc.
* Multiple Providers



# Spot the difference

<img width="1128" height="584" alt="image" src="https://github.com/user-attachments/assets/dfc7d16d-62b6-4f9f-87e9-39b045a55e9e" />

## Why Terraform 

# Allow multiple providers 

<img width="1067" height="535" alt="image" src="https://github.com/user-attachments/assets/c554cb73-f5ce-4337-a4f7-a0cfbfb9c4d6" />

# Declarative statement(.tf)

<img width="1090" height="509" alt="image" src="https://github.com/user-attachments/assets/ee36bfcb-71b3-4135-9e42-48a701bd41d4" />

# Terrform state(Immutable)
<img width="1088" height="470" alt="image" src="https://github.com/user-attachments/assets/29e9ffed-1809-4fbd-a35e-a1ae8d2f4c6d" />










## Installing Terraform: A Simple Setup
Getting Terraform up and running is like setting up a new smartphone – it's straightforward and doesn't take much time. 
Here's a step-by-step guide to installing Terraform:

- Go to the official Terraform website and download the appropriate version of Terraform for your operating system.
- Unzip the downloaded file in the directory where Terraform will live. Additionally, place the Terraform binary file in a directory that is included in your system's PATH environment variable. For a more detailed explanation, see this official documentation.
- Open your terminal or command prompt and enter the command terraform -help to verify that Terraform has been installed correctly.
- Configure your Terraform settings by creating a configuration file (usually named "main.tf") that specifies the resources you want to manage with Terraform.
- Run the command terraform init in the directory where your main configuration file is located. This will initialize your Terraform working directory and download any necessary plugins.
- Once initialization is complete, run the command terraform plan to see a preview of the changes that will be made to your infrastructure.
- Finally, run the command terraform apply to apply the changes to your infrastructure.

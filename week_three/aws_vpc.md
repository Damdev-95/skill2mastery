# AWS VPC in Details

## Overview of AWS Networking 
![image](https://github.com/user-attachments/assets/d2ea98ec-4471-436f-9614-7e995ef30671)

VPC is a logically isolated network that can be defined within the AWS Cloud.

# Properties
* Supports IPV4 & IPV6 
  IPV4 CIDR Range: /16 and /28
  IPV6 CIDR Range: /58
  
* Supports Subnetting: breaking down for each Subnets
* VPC CIDRs cannot be modified once created
* Additionals CIDR can be added to the VPC
* VPCs span a Region while Subnets are allocated as a subset of the VPC CIDR range and span a specific AZ
• You can have up to 200 subnets per VPC
• Implicit route between all subnets within a VPC
• Subnets are public subnets when there is a route to an internet gateway

Services inside VPC and outside VPC
![image](https://github.com/user-attachments/assets/5501a9ba-8ce4-4a93-b4dd-491998871f10)

# Public & Private Subnets





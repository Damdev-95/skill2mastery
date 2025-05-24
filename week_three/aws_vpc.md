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
* You can have up to 200 subnets per VPC
* Implicit route between all subnets within a VPC
* Subnets are public subnets when there is a route to an internet gateway

Services inside VPC and outside VPC

![image](https://github.com/user-attachments/assets/5501a9ba-8ce4-4a93-b4dd-491998871f10)

# Public & Private Subnets

<img width="524" alt="image" src="https://github.com/user-attachments/assets/63341487-eb29-4b96-9450-aa3e99f3b298" />

# Public subnet have route to internet, used by NAT, Web Servers, Bastion Host, Loadbalancers

# Private subnet have route to NAT Gateway, used by Database, App Servers

Each subnet has 5 Reserved IP address;
#  10.0.1.0/24 
10.0.1.0 ------Network Address
10.0.1.1 ------ Gateway Address
10.0.1.2 ------ DNS IP address
10.0.1.3 ----- Reserved
10.0.1.255 ------- Broadcast Address


# Network Access Control Lists

* Subnet-level inspection
* Inbound and outbound
* Stateless
* Based on IP and TCP/UDP ports
* Supports allow and deny rules
* Deny all at the end
* By default, allow all traffic

# Route Tables
A route table contains a set of rules, called routes, that determine where network traffic from your subnet is directed.
Route tables direct traffic toward:
* Internet/NAT gateway
* Gateway endpoint
* VPC peering/AWS Transit Gateway
* VPN gateway/Direct Connect

![image](https://github.com/user-attachments/assets/dffdf0f0-56b7-4b94-a360-4476124b92e0)

Automatic Assignment
Private IP: Receives private ip on launch on EC2 instance
Public IP: Receives public ip on launch on EC2 instance if “Public ip addressing attribute” is set to true EIPfor subnet
EIP: Have to explicitly allocate and attach EIP to EC2 instance Can be reattached to other EC2

# Internet Gateway

An internet gateway is a horizontally scaled, redundant, and highly available VPC component that allows communication between your VPC and the internet

# NAT Gateway

A NAT gateway is a network address translation (NAT) service
* Enable outbound connection to the internet only
* NATGW is created in a specific AZ, uses an EIP
* No incoming connection
* Fully managed by AWS
* Highly available
* Up to 45 Gbps aggregate bandwidth
* Supports TCP, UDP, and ICMP protocols
* Private NAT supported

<img width="416" alt="image" src="https://github.com/user-attachments/assets/7c5b7933-dc4a-431f-999d-3772505acd92" />

<img width="438" alt="image" src="https://github.com/user-attachments/assets/7bc06827-0941-4f6b-b72c-f7f4b34b64fd" />



# SECONDARY VPC CIDR

You can add secondary VPC CIDRs to existing VPC
* CIDR block must not overlap with existing CIDR or peered VPC CIDR
* If Primary CIDR is from RFC1918 then you can not add secondary CIDR from other RFC1918 IP ranges (10.0.0.0/8, 172.16.0.0/12, 192.168.0.0/16)
* CIDR block must not be same or larger than the CIDR range of routes in any of the VPC Route tables.
  Example: secondary CIDR block in the 10.2.0.0/16 and there is existing routes 10.2.0.0/24 on Primary VPC via Virtual Private Gateway or external)
* You can have total 5 IPv4 Secondary CIDR Block

Primary CIDR: 10.0.0.0/16
Additional : 10.1.0.0/16 ---- Allowed
Additional: 192.168.0.0/16 ---- Disallowed(RFC1918)
Additional : 172.32.0.0./16 ---- Disallowed(RFC1918)
Additonal: 100.64.0.0/16 -----Allowed(Non-RC1918)

# Elastic Network Interface

logical component in a VPC that represents a virtual network card, ENIs are bound to a specific availability zone (AZ)
The ENI can have the following attributes:
* A primary private IPv4 address from the IPv4 address
range of the VPC
* A primary IPv6 address from the IPv6 address range of
your VPC
* One or more secondary private IPv4 addresses from the
IPv4 address range of your VPC
* One Elastic IP address (IPv4) per private IPv4 address
* One public IPv4 address
* One or more IPv6 addresses
* One or more security groups
* A MAC address
* A source/destination check flag

# ENI Use-Cases

* Requester managed ENIs that AWS creates in your VPC
* Creating Management Network / Dual home instances: **You can attach a second ENI from a different subnet as long as it is in the same AZ as the EC2 instance**
* Third-party Appliances Implemmentation: Fortigate, Cisco FTD, Palo Alto
* Preserving EC2 IP address in case of instance failure
* Using ENI secondary IPs for EKS Pods

<img width="565" alt="image" src="https://github.com/user-attachments/assets/84c854fd-93b2-4bd1-9453-0e3ab792d09d" />

<img width="599" alt="image" src="https://github.com/user-attachments/assets/f19ba9ce-eb18-48ca-be3c-b7252219e051" />

<img width="485" alt="image" src="https://github.com/user-attachments/assets/8bdddbd7-70d5-41da-b7e3-44b1c40f5615" />







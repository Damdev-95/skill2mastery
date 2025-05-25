## VPC PEERING 

VPC Peering is a networking connection between two Virtual Private Clouds (VPCs) that allows you to route traffic between them using private IP addresses.

* Peered VPCs can be in same AWS region or across AWS regions
*  You can do VPC peering with another AWS account

# Limitations

* No transitive peering
* No overlapping CIDRs
* Full Mesh will be difficult for Multiple VPCs

<img width="728" alt="image" src="https://github.com/user-attachments/assets/c69f84df-a5b9-43c6-8cfc-5a9f48588026" />


# Steps to Configure VPC Peering

1. Create VPC Peering Connection
    * Go to VPC Console → Peering Connections → Create Peering Connection
    * Choose Requester VPC
    * Choose Accepter VPC (same or different AWS account/region)

2. Accept the Peering Connection
    * The owner of the Accepter VPC must go to the console and accept the request (unless in same account and auto-accepted)

3. Update Route Tables
    * Go to the Route Table of each VPC
    * Add a route for the peer VPC's CIDR pointing to the Peering Connection

4. Update Security Groups
    * Modify the Security Group rules to allow inbound/outbound traffic from the peer VPC’s CIDR
  

# TRANSIT GATEWAY

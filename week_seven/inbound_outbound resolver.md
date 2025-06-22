#  Amazon Route 53 Resolver – Inbound & Outbound Endpoints

**Amazon Route 53 Resolver** provides **DNS resolution between AWS and on-premises networks**. It allows hybrid DNS configurations by using **inbound** and **outbound resolver endpoints** to route DNS queries between:

- AWS VPCs
- On-premises data centers
- Other AWS regions/accounts

---

##  Inbound Resolver Endpoint

###  Purpose:
Allows **on-premises DNS resolvers** (e.g., Active Directory) to forward DNS queries into AWS **VPCs**.

### Use Case:
- Your on-prem DNS server wants to resolve private **.aws** domain names (e.g., EC2 instance hostnames in a VPC).
- Enables hybrid cloud applications to discover AWS resources via DNS.

---

## Outbound Resolver Endpoint

### Purpose:
Allows **AWS resources in a VPC** to resolve **on-premises or external DNS records** by forwarding queries to your **on-prem DNS server**.

###  Use Case:
- EC2 instances in AWS need to resolve internal **on-prem** domain names like `corp.example.com`.
- Supports hybrid DNS resolution for services running in AWS.

---



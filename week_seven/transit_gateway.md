

##  What is AWS Transit Gateway?

**AWS Transit Gateway (TGW)** is a fully managed, scalable, and high-performance **hub-and-spoke** network service that connects **VPCs**, **on-premises networks**, and even **VPN connections** through a **centralized gateway**.

Instead of complex VPC peering meshes, TGW simplifies connectivity by acting as a **single hub**.

---

##  Key Features of Transit Gateway

-  **Transitive Routing**: Automatically enables routing between connected networks (e.g., VPC A → TGW → VPC B) without direct VPC peering.
  
-  **Scalability**: Supports thousands of VPC attachments, making it ideal for enterprise-grade, multi-account architectures.

-  **Segmentation & Security**: Route tables and security policies allow you to control which VPCs can communicate with each other.

-  **High Performance**: Uses AWS’s backbone for high-speed, low-latency communication.

-  **Centralized Management**: Easier to monitor, audit, and manage from a single point.

-  **Supports VPN and Direct Connect**: Attach on-premises networks for hybrid architecture.

---

##  Why Do You Need Transit Gateway?

In traditional architectures, connecting multiple VPCs requires complex **VPC peering**, which becomes unmanageable as the number of VPCs grows.

**Common problems solved by TGW:**
-  **No transitive routing in VPC peering**
-  **Scalability limitations**
-  **Operational overhead of maintaining many peering connections**
-  **Inconsistent or hard-to-trace routing paths**

Transit Gateway allows you to:
- Centralize and simplify network design
- Enable transitive access between VPCs and on-prem
- Improve visibility, control, and security

---
##  Componenets of Transit Gateway?

- **Attachment**: Connects VPCs, on-premises networks, or other resources to the Transit Gateway.

- **Route**: Defines the traffic flow between attachments through routing tables.

- **Propagation**: Automatically shares routes from attached resources to the Transit Gateway routing tables, enabling dynamic updates.

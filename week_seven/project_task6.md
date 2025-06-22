# Project 6 

In response to evolving **business needs**, our teams across **Development**, **Management**, and the **Corporate Data Center (DC)** require seamless, secure communication. As operations scaled and cloud environments matured, it became clear that a more robust network architecture was essential.

However, a critical challenge emerged — the existing **VPN Gateway** could not support **transitive routing**. This limitation prevented direct routing between VPCs and the Corporate DC through a single VPN tunnel, creating roadblocks in both operational efficiency and secure access.

This sparked the need for a **new network design**, one that could overcome the architectural constraints and deliver on key connectivity goals:

###  Challenge:
- The **Management VPC** could not reach both **Development** and **Production VPCs** asides the peering
- The **Development** and **Management** VPCs were isolated from the **Corporate DC**, restricting infrastructure access and monitoring capabilities.
- **Client VPN users** could not directly access the **Corporate DC**, limiting remote work effectiveness.

### 💡 The Solution:
To address these limitations, a more **scalable and flexible network topology** was proposed. This included:

- **Connecting the Management VPC** to both Development and Production environments to enable  centralized access and control.
- **Establishing secure paths** from Development and Management VPCs to the Corporate Data Center.
- **Allowing remote users via Client VPN** to access internal resources in the Corporate DC, without compromising security.





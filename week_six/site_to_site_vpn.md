#  AWS Site-to-Site VPN 

AWS Site-to-Site VPN lets you securely connect your **on-premises network** (or remote location) to your **AWS VPC** using **IPsec tunnels over the public internet**.

This is useful for hybrid cloud setups, disaster recovery, or securely extending your network into AWS.

---

###  Virtual Private Gateway (VGW)

- A **VGW** is an AWS-managed VPN concentrator.
- It acts as the **VPN endpoint** on the AWS side.
- You attach it to your **VPC**.
  
![image](https://github.com/user-attachments/assets/17c2aa5c-7512-46a8-a5ef-308abe7eec38)


#  AWS Site-to-Site VPN with Libreswan

Use **Libreswan** (an open-source IPsec VPN solution) to create a secure **site-to-site VPN** connection between the **on-premises network** or **Linux instance** and an **AWS VPC**.

---

##  Features

-  **Secure IPsec tunnel** over the internet
-  **Redundancy**: Supports two VPN tunnels for high availability
-  **AES-256 encryption**, **SHA2**, and **DH groups**
-  **BGP or static routing** options
-  Works with **Libreswan**, **strongSwan**, or commercial VPNs

---

##  Key Components

| Component               | Description                                                   |
|------------------------|---------------------------------------------------------------|
| **Customer Gateway**   | Your device (or EC2/Linux box) with Libreswan configured      |
| **Virtual Private Gateway** | AWS-managed VPN endpoint attached to your VPC         |
| **VPN Connection**     | The connection that ties the two sides together                |
| **Tunnel 1 & 2**       | Two IPsec tunnels for redundancy                              |

---

##  Steps to Configure Libreswan

###  1. Create Customer Gateway in AWS
- Go to **VPC Console** > **Customer Gateways**
- Choose **Static IP** (your Libreswan public IP)
- Set routing type (usually static)

###  2. Create Virtual Private Gateway
- VPC Console > **Virtual Private Gateways**
- Attach to your VPC

###  3. Create VPN Connection
- Connect your **VGW** to the **Customer Gateway**
- Note down:
  - **Tunnel IPs**
  - **Pre-shared keys**
  - **Encryption settings**

---

##  4. Configure Libreswan on Linux (e.g., Ubuntu/EC2)

Install Libreswan:

```bash
sudo dnf update
sudo dnf install libreswan -y
```

```bash
1) Open /etc/sysctl.conf and ensure that its values match the following:
   net.ipv4.ip_forward = 1
   net.ipv4.conf.default.rp_filter = 0
   net.ipv4.conf.default.accept_source_route = 0

2) Apply the changes in step 1 by executing the command 'sysctl -p'

3) Open /etc/ipsec.conf and look for the line below. Ensure that the # in front of the line has been removed, then save and exit the file.
    #include /etc/ipsec.d/*.conf

4) Create a new file at /etc/ipsec.d/aws.conf if doesn't already exist, and then open it. Append the following configuration to the end in the file:
 #leftsubnet= is the local network behind your openswan server, and you will need to replace the <LOCAL NETWORK> below with this value (don't include the brackets). If you have multiple subnets, you can use 0.0.0.0/0 instead.
 #rightsubnet= is the remote network on the other side of your VPN tunnel that you wish to have connectivity with, and you will need to replace <REMOTE NETWORK> with this value (don't include brackets).

conn Tunnel1
	authby=secret
	auto=start
	left=%defaultroute
	leftid=184.169.202.130
	right=34.251.2.200
	type=tunnel
	ikelifetime=8h
	keylife=1h
	phase2alg=aes256-sha1;modp2048
	ike=aes256-sha1;modp2048
	keyingtries=%forever
	keyexchange=ike
	leftsubnet=172.31.0.0/16
	rightsubnet=10.2.0.0/16
	dpddelay=10
	dpdtimeout=30
	dpdaction=restart_by_peer

5) Create a new file at /etc/ipsec.d/aws.secrets if it doesn't already exist, and append this line to the file (be mindful of the spacing!):
184.169.202.130 34.251.2.200: PSK "EArdpMtGK7i09RxrVassXBmReNcMvkRY"
```

##  5. Confirm the ipsec service is running 

`sudo systenctl status ipsec.service`

![image](https://github.com/user-attachments/assets/89d4465a-90ac-4bde-9734-c22d7e960291)

`sudo ipsec status`

![image](https://github.com/user-attachments/assets/e2457e8a-44ad-4138-8218-aa313b8c1145)

##  6. Validating VPN Connection is up on AWs Console

![image](https://github.com/user-attachments/assets/e591d057-f7e8-49d6-bba6-0edd43d9f688)

![image](https://github.com/user-attachments/assets/59c39cd0-5aef-4ce5-860d-872bb295b614)

![image](https://github.com/user-attachments/assets/664e0b2d-81aa-4b25-bc4d-40761861925b)

![image](https://github.com/user-attachments/assets/85012025-2d02-4a63-acdd-ecd99ea7c1e1)





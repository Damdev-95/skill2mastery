#  AWS Site-to-Site VPN 

AWS Site-to-Site VPN lets you securely connect your **on-premises network** (or remote location) to your **AWS VPC** using **IPsec tunnels over the public internet**.

This is useful for hybrid cloud setups, disaster recovery, or securely extending your network into AWS.

---

###  Virtual Private Gateway (VGW)

- A **VGW** is an AWS-managed VPN concentrator.
- It acts as the **VPN endpoint** on the AWS side.
- You attach it to your **VPC**.
  
![image](https://github.com/user-attachments/assets/17c2aa5c-7512-46a8-a5ef-308abe7eec38)


#  AWS Site-to-Site VPN with Strongswan

Use **Strongswan** (an open-source IPsec VPN solution) to create a secure **site-to-site VPN** connection between the **on-premises network** or **Linux instance** and an **AWS VPC**.

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

##  Steps to Configure Strongswan

###  1. Create Customer Gateway in AWS
- Go to **VPC Console** > **Customer Gateways**
- Choose **Static IP** (your Strongswan public IP)
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

##  4. Configure Strongswan on Linux (e.g., Ubuntu/EC2)

1. Update package dependencies:

```bash
sudo apt update
sudo apt update && sudo apt upgrade -y
```
2. Enable system forwardimg on linux

```bash
sudo nano /etc/sysctl.conf
net.ipv4.ip_forward = 1
net.ipv6.conf.all.forwarding = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.all.send_redirects = 0

#save the file and enable it below using
sudo sysctl -p
```

3. Install Strongswan service

```bash
sudo apt install strongswan strongswan-pki libcharon-extra-plugins libcharon-extauth-plugins libstrongswan-extra-plugins libtss2-tcti-tabrmd0 -
```
4. Start and enabled the service after installation

```bash
sudo systemctl enable strongswan-starter
sudo systemctl is-enabled strongswan-starter
```
5.  Check for the service status

<img width="1897" height="532" alt="image" src="https://github.com/user-attachments/assets/7679e5d3-ea92-4d86-9184-7fd496b115c9" />

6.  Edit and configure secrets file on /etc/ipsec.secrets

```bash
18.237.1.177 34.254.32.247 : PSK "1LYE5ngs6dHGehVjKo4bCXMmPtQRS.mM"
```

7.  Edit and configure configuration file on /etc/ipsec.conf

```bash
config setup
        charondebug="all"
        uniqueids=yes
conn corp-dev
        type=tunnel
        auto=start
        keyexchange=ikev2
        authby=secret
        left=%defaultroute
        leftid=18.237.1.177
        leftsubnet=172.31.0.0/16
        right=34.254.32.247
        rightsubnet=10.2.0.0/16
        ike=aes256-sha256-modp2048!
        esp=aes256-sha256-modp2048!
        aggressive=no
        keyingtries=%forever
        ikelifetime=28800s
        lifetime=3600s
        dpddelay=30s
        dpdtimeout=120s
        dpdaction=restart
```

8.  Start up the connection by using the command
`sudo ipsec up corp-dev`   #corp-dev is the connection name on the conf file

<img width="1692" height="512" alt="image" src="https://github.com/user-attachments/assets/cf500cb5-aa6c-4ff7-8fe3-8c4d9295895d" />

9.  For toubleshooting or logs, you can use the following

```bash
sudo tail -n 15 /var/log/syslog | grep -E "charon|secrets"
systemctl status strongswan-starter

```



##   Confirm the ipsec service is running 

`sudo systemctl status ipsec.service`

`sudo ipsec up`

<img width="1427" height="491" alt="image" src="https://github.com/user-attachments/assets/a4e6f1c7-f011-4a7a-91e3-f446b7d17bc1" />




##  6. Validating VPN Connection is up on AWs Console

![image](https://github.com/user-attachments/assets/e591d057-f7e8-49d6-bba6-0edd43d9f688)

![image](https://github.com/user-attachments/assets/59c39cd0-5aef-4ce5-860d-872bb295b614)

![image](https://github.com/user-attachments/assets/664e0b2d-81aa-4b25-bc4d-40761861925b)

![image](https://github.com/user-attachments/assets/85012025-2d02-4a63-acdd-ecd99ea7c1e1)





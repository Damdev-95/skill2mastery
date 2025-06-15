
##  What is AWS Client VPN?

AWS Client VPN is a **secure and fully managed VPN service** that lets users (like employees or developers) **remotely connect to AWS resources or on-premises networks** from anywhere using an **OpenVPN client**.

<img width="665" alt="image" src="https://github.com/user-attachments/assets/6c7e4c05-cef4-4745-8295-98434c4e878f" />



---

##  Significance

-  Secure encrypted connection to AWS
-  Scales automatically for many users
-  Access your AWS VPC from anywhere
-  Control who connects using authentication

---

##  Key Components

- **VPN Target Subnet** – Dedicated Subnet for VPN
- **Client VPN Endpoint** – The VPN gateway in AWS
- **Client CIDR Range** – IPs given to connected users
- **Authentication Method** – Use certificates, IAM, or Directory Service
- **VPC Association** – Connect VPN to one or more subnets in your VPC
- **Authorization Rules** – Control what clients can access

---

##  Implementation steps 

### Step 1: Create a Server Certificate in ACM
- Upload a server certificate using AWS Certificate Manager
- Needed for VPN encryption (TLS)

```
1. Clone the easy-rsa repo
 git clone https://github.com/OpenVPN/easy-rsa.git
 cd easy-rsa/easyrsa3
2. Initialize PKI environment
 ./easyrsa init-pki
3. Create new Certification Authority (CA)
 ./easyrsa build-ca nopass
4. Generate the server certificate and key
 ./easyrsa build-server-full server.com nopass
5. Generate the client certificate and key
$ ./easyrsa build-client-full client1.domain.tld nopass
6. Copy server and client certificates and keys to one directory
$ mkdir ~/demo
$ cp pki/ca.crt ~/demo/
$ cp pki/issued/server.com.crt ~/demo/
$ cp pki/private/server.com.key ~/demo/
$ cp pki/issued/client1.domain.tld.crt ~/demo/
$ cp pki/private/client1.domain.tld.key ~/demo/ $ cd ~/demo
```

```
 Upload the certificate and keys to ACM
 $ aws acm import-certificate --certificate fileb://server.com.crt --private-key fileb://server.com.key --certificate-chain fileb://ca.crt --region eu-west-1
$ aws acm import-certificate --certificate fileb://client1.domain.tld.crt --private-key fileb://client1.domain.tld.key --certificate-chain fileb://ca.crt --region eu-west-1
```
### Step 2: Create the Client_VPN Subnet in Managemnet VPC
- Create Client_VPN Subnet 10.0.5.0/24
- Create Client_VPN Route table and associate subnet
- Create Client_VPN Security Group

### Step 3: Create the VPN Endpoint
- Go to **VPC > Client VPN Endpoints**
- Set:
  - CIDR range (e.g., `10.10.0.0/22`)
  - Server certificate from ACM
  - Authentication type (e.g., certificate-based)
  - Enable split tunnel (optional)

### Step 3: Associate with VPC Subnet
- Pick a **subnet** in the VPC to associate with the VPN
- This gives users access to AWS resources in that subnet

### Step 4: Add Authorization Rule
- Allow users to access VPC CIDRs (e.g., `10.2.0.0/16`)

### Step 5: Add a Route
- Add a route to tell the VPN how to reach AWS resources
  - Example: `Destination = 10.2.0.0/16`, `Target = associated subnet`
  - Example: `Destination = 0.0.0.0/16`, `Target = associated subnet`

### Step 6: Download VPN Configuration
- Download the `.ovpn` file from AWS
- Send it to users to import in OpenVPN client

```
Open the configuration file with any editor and add following lines
1. cert /path/to/client1.domain.tld.crt
2. key /path/to/client1.domain.tld.key
```
---

##  Authentication Options

- **Mutual Certificate Auth** – Upload client certificates to each user
- **Directory Service** – Use AWS AD or AD Connector
- **IAM + SAML** – Use SSO providers (e.g., Okta, Azure AD)

---

##  Common Use Cases

- Remote access for developers and staff
- Replace legacy VPN appliances
- Connect to private AWS databases or apps
- Hybrid cloud access

---

![image](https://github.com/user-attachments/assets/5fb8134c-1d4d-4423-bcc8-aeeeca621671)

![image](https://github.com/user-attachments/assets/17e784b2-c754-49e8-8fb1-dd9ae5e3d04a)




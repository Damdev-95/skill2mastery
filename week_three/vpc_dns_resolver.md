# VPC DNS in Details

Domain Name System(DNS), translates human readable domain names ( www.example.com) to machine readable IP addresses (for example, 192.0.2.44)

<img width="451" alt="image" src="https://github.com/user-attachments/assets/5a6e033b-131d-496b-8fc9-8ef9bd24c49d" />

Amazon VPC DNS server (Route53 DNS Resolver)
* EC2 DNS names – internal and external
* VPC DNS Attributes - enableDnsSupport and enableDnsHostname

VPC comes with default DNS server called Route53 DNS Resolver
*  Runs at VPC Base + 2 Address
*  Accessible from within the VPC

Resolves DNS requests from:
• Route 53 Private Hosted Zone
• VPC internal DNS
• Forwards other requests to Public DNS (including Route 53 Public Hosted Zones)

<img width="305" alt="image" src="https://github.com/user-attachments/assets/e1601ee5-905b-4399-972b-a2587db03c51" />

# Route53 Private Hosted Zone

* Create a private hosted zone: payscontinum.dev
* Create record sets pointing to EC2 instances private Ips
* DNS queries from within the VPC

# VPC DNS

* EC2 instances get Private DNS name such as  ip-<private-ipv4-address>.region.compute.internal
* ip-10-10-0-15-eu-west-1.compute.internal
* ip-10-10-0-20-eu-west-1.compute.internal

# Public DNS
* google.com, amazon.com, facebook.com
* Amazon services public endpoints
  * SQS:        sqs.eu-west-1.aws.amazon.com
  * S3 Bucket:  s3.eu-west-1.amazonaws.com
 
# DHCP Option Sets

The options field of a Dynamic Host Configuration Protocol message contains the configuration parameters like domain name, domain name server, NTP server and the NetBIOS node type
AWS automatically creates and associates a DHCP option set for your VPC upon creation and sets following parameters:
* domain-name-servers: This defaults to AmazonProvidedDNS
* domain-name: This defaults to the internal Amazon domain name for your region (e.g <ip>.eu-west-1.compute.internal)


![image](https://github.com/user-attachments/assets/19d9094b-17fc-4258-a0e2-c1e6374985de)


![image](https://github.com/user-attachments/assets/aefba3a4-6725-4922-8f1e-dfd07e131190)


  

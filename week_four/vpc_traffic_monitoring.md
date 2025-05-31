## VPC TRAFFIC MONIROING AND ANALYSIS

# VPC FLOW LOGS
Capture information about IP traffic going in/out of your interfaces:
* VPC Flow Logs
* Subnet Flow Logs
* Elastic Network Interface Flow Logs

Flow logs data can go to:
* S3
* CloudWatch Logs
* Kinesis Data Firehose

Captures network information from AWS managed interfaces too: ELB, RDS, ElastiCache, Redshift, Amazon WorkSpaces

<img width="640" alt="image" src="https://github.com/user-attachments/assets/95919268-3619-45c7-a67f-bf95af154baf" />

<img width="665" alt="image" src="https://github.com/user-attachments/assets/211c9c41-f7fe-4f24-bd3d-d76a087edeba" />

# Implementation

* Create CloudWatch Logs Group
* Create IAM Role for VPC Flow logs service (Cloudwatch logs permissions)
* Create VPC flogs on the desired VPC

```
stats sum(packets) as packetsTransferred by srcAddr, dstAddr
 | sort packetsTransferred desc
 | limit 15

fields @timestamp, @message
| sort @timestamp desc
| limit 10
 
stats sum(packets) as packetsTransferred by srcAddr, dstAddr
| sort packetsTransferred  desc
| limit 15
	
fields @timestamp, interfaceId, srcAddr, dstAddr, action
| filter (interfaceId = 'eni-xxxxxxxxx' and action = 'REJECT')
| sort @timestamp desc
| limit 5

fields @timestamp, srcAddr, dstAddr
| sort @timestamp desc
| limit 5
| filter srcAddr like "172.31."
 
 
fields @timestamp, @message
| stats count(*) as records by dstPort, srcAddr, dstAddr as Destination
| filter dstPort="80" or dstPort="443" or dstPort="22" or dstPort="25"
| sort HitCount desc
| limit 10
```


# VPC REACHABILITY ANALYZER

* Connectivity testing between the source resource and a destination resource
* Produces hop-by-hop details of the virtual network path
* Points out the blocking components when traffic is not reachable
• Does not send real packets. It uses network configurations to find out if network is reachable

# Supported Source and Destination

* Instance
* Internet Gateway
* Network Interfaces
* Transit Gateway
* Transit Gateway Attachments
* VPC endpoints
* VPC peering connections
* VPN gateways

# VPC Network Manager > Reachability Analyzer

<img width="305" alt="image" src="https://github.com/user-attachments/assets/335a13b5-5eec-4e3c-ac32-0673471da32a" />

<img width="610" alt="image" src="https://github.com/user-attachments/assets/c3d1078c-ce70-4af8-b9cb-05660f8ebaa9" />





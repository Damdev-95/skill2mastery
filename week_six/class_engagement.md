# Design Questions

## From on-premises to AWS via Virtual Private Gateway:

* Can you access Internet through VPC attached Internet Gateway

* Can you access Internet through NAT Gateway in Public subnet
  
* Can you access peered VPC resources through VPC peering connection via the AWS VGW

* Can you access S3, DynamoDB via the VPC gateway endpoint

* Can you access AWS services endpoint e.g API gateway, SQS and customer endpoint services (powered by Privatelink) via VPC interface endpoint

* Can you access Internet through NAT EC2 instance in Public subnet

## From AWS to on-premises via customer gateway

* You can access Internet and other network endpoints based on routing rules setup on CGW in on-premises network

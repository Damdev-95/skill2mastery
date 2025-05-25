## WELCOME TO A NEW DISPENSATION

You've just been hired as the Cloud Engineer for the Fintech Startup, you've been tasked to design and implement highly-available and scalable infrastructure to support the strategic goals of the company

# Task 1

* Design the VPC CIDR Planning and cover future expansion
* Production, Development, Management must be in an isolated Cloud environment
* Ensure all remote connections to servers is via Bastion-Host (Management VPC)
* Design architecture diagram for an highly and scalable available Web-Application (Nginx, Linux, React, MySQL)
* Consider using Europe due to data-privacy and latency
* Due to starting, average engagement on the application is witin 500 to 1k users
* Ensure, all services are cost-optimized and secured



# Solution(Task 1)

## CIDR Planning
3rd Octect ---Even(Private Subnet)
3rd Octect --- Odd(Public Subnet

* Management VPC : 10.0.0.0/16
  10.0.1.0/24 - Pubilc Subnet(AZ-A)
  10.0.2.0/24 - Private Subnet(AZ-A)
  10.0.3.0/24 - Pubilc Subnet(AZ-B)
  10.0.4.0/24 - Private Subnet(AZ-B)
  
* Development VPC : 10.2.0.0/16
  10.2.2.0/24 - Pubilc Subnet(AZ-A)
  10.2.2.0/24 - Private Subnet(AZ-A)
  10.2.3.0/24 - Pubilc Subnet(AZ-B)
  10.2.4.0/24 - Private Subnet(AZ-B)
  
* Production VPC: 10.4.0.0/16
  10.4.1.0/24 - Pubilc Subnet(AZ-A)
  10.4.2.0/24 - Private Subnet(AZ-A)
  10.4.3.0/24 - Pubilc Subnet(AZ-B)
  10.4.4.0/24 - Private Subnet(AZ-B)

* On-premise : 192.168.0.0/16
  

* Constraints(Since it's a new startup.)
1. Choice of instance type(t2.medium, t2.small)
2. Choice of AutoScaling Group (desired instance should less than 2)
3. Choice of database instance( Aurora(Manged RDBS), MySQL on ec2 instance)
4. Choice of domain and user's location( latency, cloudfront, global accelerator

## What to do

1. VPC-to-VPC Communication: 


# Task 2

* Implement the cloud infrastructure with proper taggings
* Implement the Web-Application on Development environment with a Single Node Instance
* On Development environment, ensure all instance are reachable via **payscontinum.dev**



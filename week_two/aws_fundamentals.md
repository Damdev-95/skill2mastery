# AWS Foundational Services

# Infrastructure Stack and Model
![image](https://github.com/user-attachments/assets/6eccee77-629f-47b5-ac67-a38da80c8b5d)

<img width="985" alt="image" src="https://github.com/user-attachments/assets/d21734db-7890-4f03-95f7-8c73debb53b6" />


# Shared Responsibility Model

* Security in the cloud ----- Customer
* Security of th cloud ------ AWS

# Regions and Availability Zone

* Regions -- two or more AZs (us-east-1, eu-west-1), Geographically Seperated.
* Availability Zones -- One or more data centers (us-east-1a)
* Local zones
* Edge Locations

# AWS has Global Services:
• Identity and Access Management (IAM)
• Route 53 (DNS service)
• CloudFront (Content Delivery Network)
• WAF (Web Application Firewall)

# Most AWS services are Region-scoped:
• Amazon EC2 (Infrastructure as a Service)
• Elastic Beanstalk (Platform as a Service)
• Lambda (Function as a Service)
• Rekognition (Software as a Service)

# IAM: Users & Groups
• IAM = Identity and Access Management, Global service
• Root account created by default, shouldn’t be used or shared
• Users are people within your organization, and can be grouped
• Groups only contain users, not other groups
• Users don’t have to belong to a group, and user can belong to multiple groups




# IAM: Permissions
• Users or Groups can be assigned JSON documents called policies
• These policies define the permissions of the users
• In AWS you apply the least privilege principle: don’t give more permissions than a user needs

IAM Policies Structure
• Consists of • Version: policy language version, always include “2012-10-17”
• Id: an identifier for the policy (optional) 
• Statement: one or more individual statements (required)
• Statements consists of 
    • Sid: an identifier for the statement (optional) 
    • Effect: whether the statement allows or denies access(Allow, Deny)
• Principal: account/user/role to which this policy applied to 
• Action: list of actions this policy allows or denies 
• Resource: list of resources to which the actions applied to 

<img width="447" alt="image" src="https://github.com/user-attachments/assets/f6f49acf-1510-409f-9afa-fb0913c8fbe8" />


# Access to AWS

* Console
* [AWS CLI][https://github.com/aws/aws-cli)
* SDK & REST-API

# IAM Roles for Services 
• Some AWS service will need to perform actions on your behalf
• To do so, we will assign permissions to AWS services with IAM Roles
• Examples:  EC2 Instance Roles , Lambda Function Roles,  Roles for CloudFormation 

# Compute Service

* EC2 instance
* Lambda
* ECS
* EKS



# Network Service

* VPC
* VPN Gateway
* Transit Gateway
* Load Balancer
* Cloudfront

# Storage Service

# EBS
 An EBS (Elastic Block Store) Volume is a network drive you can attacho your instances while they run
• It allows your instances to persist data, even after their termination
• They can only be mounted to one instance at a time (at the CCP level)
• They are bound to a specific availability zone

<img width="973" alt="image" src="https://github.com/user-attachments/assets/acd314e1-02be-4ade-a424-30ab30d53fbb" />


# EFS
• Managed NFS (network file system) that can be mounted on 100s of EC2
• EFS works with Linux EC2 instances in multi-AZ

<img width="635" alt="image" src="https://github.com/user-attachments/assets/1e5277ce-83d5-4c83-99a9-427172ee9583" />


# Instance store
• EBS volumes are network drives with good but “limited” performance
• If you need a high-performance hardware disk, use EC2 Instance Store
• Better I/O performance
• EC2 Instance Store lose their storage if they’re stopped (ephemeral)
• Good for buffer / cache / scratch data / temporary content
• Risk of data loss if hardware fails

# S3

• Amazon S3 allows people to store objects (files) in “buckets” (directories)
• Buckets must have a globally unique name (across all regions all accounts)
• Buckets are defined at the region level
• S3 looks like a global service but buckets are created in a region
• Objects (files) have a Key
• The key is the FULL path  s3://my-bucket/my_file.txt
• s3://my-bucket/my_folder1/another_folder/my_file.txt
• The key is composed of prefix + object name
• s3://my-bucket/my_folder1/another_folder/my_file.txt
• Object values are the content of the body: Max. Object Size is 5TB (5000GB)
• If uploading more than 5GB, must use “multi-part upload”

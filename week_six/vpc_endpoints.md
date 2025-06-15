#  AWS VPC Endpoints Overview

**VPC Endpoints** allow you to privately connect your VPC to supported AWS services **without using a public IP**, **NAT gateway**, or traversing the open internet.

There are two main types:

---

##  1. Gateway Endpoints

Used for:  
- **Amazon S3**
- **DynamoDB**

###  Example: Gateway Endpoint for S3

###  Benefits:
- Traffic to S3 stays within AWS
- No need for internet gateway or NAT Gateway

###  How to Configure:
1. Go to **VPC Console** > Endpoints > Create Endpoint
2. Select **Service Category**: AWS Services
3. Choose **Service Name**: `com.amazonaws.<region>.s3`
4. Select **VPC** and the **route tables**
5. Add **policy** to restrict/allow access as needed

### 🔒 Optional Policy:
```json
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:*",
      "Resource": "*"
    }
  ]
}

```
![image](https://github.com/user-attachments/assets/9e506333-9e7d-48ab-9ff9-8b3be52c8fa9)


![image](https://github.com/user-attachments/assets/420ddef6-80a8-4e59-9e0b-86736cda0cc5)


##  2. Interface Endpoints (Powered by PrivateLink)

Used for:
- **Many AWS services (EC2, SSM, SNS, KMS, etc.)**
- **Your own services (via PrivateLink)**

# Each service is accessed via an Elastic Network Interface (ENI) with a private IP in your VPC.

### Example: Interface Endpoint for EC2 Instance Connect

#### Used to enable EC2 instance access via browser-based SSH in the AWS Console without a public IP.

## How to Configure:

* Go to VPC Console > Endpoints > Create Endpoint
* Select Service Name:

`com.amazonaws.<region>.ec2-instance-connect`

* Choose your VPC and subnets
* Select security groups that allow access to EC2

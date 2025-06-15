#  Hosting a Static Website with S3, CloudFront, and TLS

This guide sets up a secure static website using:

- **Amazon S3** – for hosting static content
- **Amazon CloudFront** – for global CDN distribution
- **AWS Certificate Manager (ACM)** – for SSL/TLS

---

##  Step 1: Create an S3 Bucket

![image](https://github.com/user-attachments/assets/51bc4ffe-f5fb-4d52-abcd-a6af16b923b0)



1. Go to the **S3 Console**
2. Create a **bucket** with your domain name (e.g., `payments.scontinum.com`)
3. **Disable** "Block all public access"
4. Add a **bucket policy** to allow public read access:
   ```json
   {
     "Version": "2012-10-17",
     "Statement": [
       {
         "Sid": "PublicReadGetObject",
         "Effect": "Allow",
         "Principal": "*",
         "Action": "s3:GetObject",
         "Resource": "BUCKET_ARN/*"
       }
     ]
   }


![image](https://github.com/user-attachments/assets/c6d9c1e5-fca4-4f70-b2bd-2b1b668d003a)

##  Step 2: Request a TLS Certificate

* Go to AWS Certificate Manager (ACM)
* Request a public certificate for your domain (payments.scontinum.com)
* Choose DNS validation (easier with Route 53)
* Add the provided DNS CNAME records to your domain
* Wait for validation & issuance

![image](https://github.com/user-attachments/assets/d4ec348b-a583-40dd-858a-53012faa8f4e)


## Step 3: Create Cloudfront distribution using the S3 website endpoint as the origin

* Go to CloudFront Console and create a Web distribution
* Set Origin domain as your S3 bucket (select from dropdown, not typing URL)
* Viewer Protocol Policy: Redirect HTTP to HTTPS
* Alternate domain name (CNAME): `payments.scontinum.com`
* Custom SSL Certificate: Select your validated ACM cert

![image](https://github.com/user-attachments/assets/78a54379-e342-47f1-9fd4-34d81473752a)

![image](https://github.com/user-attachments/assets/404ba31e-fcc0-434a-9515-9791ef5e61a8)

## Step 4: Update CNAME on Route53 

* Go to Route 53
* Create a CNAME or A record (alias) pointing your domain to the CloudFront domain (e.g., d123abc.cloudfront.net)

![image](https://github.com/user-attachments/assets/418181da-9257-4c86-9b1c-746af31a9c4c)



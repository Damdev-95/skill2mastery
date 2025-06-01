## Hosting Static Website using S3 with a Custom Domain 

![image](https://github.com/user-attachments/assets/962b9c9b-a778-49f5-aa18-0a35e41f2a86)

One of the fastest way create a static websites is using S3 bucket.

## Step-by-Step: Static Website Hosting with S3

# Step 1: Create an S3 Bucket

# When using a custom domain name, the name of the bucket should be same as the custom domain

* Go to the AWS S3 Console.
* Click "Create bucket".
* Bucket name: Must be globally unique, e.g. payments.scontinum.com 
* Region: Choose your preferred AWS region.
* Uncheck: “Block all public access” 
* Click Create Bucket.

# Step 2: Upload Your Website Files

* Open the bucket.
* Click "Upload" → Add files/folders (e.g., index.html, styles.css, etc.).
* Click Upload.

# Step 3: Enable Static Website Hosting

* Go to the bucket properties tab.
* Scroll to "Static website hosting".
* Click Edit.
* Enable it.
* Set: Index document: index.html
* (Optional) Error document: error.html
* Save changes.



# Step 4: Create the Bucket Access Policy

* Go to the Permissions tab of your bucket.
* Click Bucket Policy and paste this JSON:

```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AllowPublicAccesstoObjects",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "YOUR-BUCKET-ARN/*"
        }
    ]
}
```

# Step 5: Custom Domain name

* Ensure the name of the bucket is same as intended custom domain name
* Go to Route53 > Hosted Zone
* Click on your domain **scontinum. com**
* Create a CNAME recored for the custom domain **payments.scontinum.com** mapped to the s3 bucket website url(remove the http header) 

![image](https://github.com/user-attachments/assets/31a678a6-14b2-404f-ae4a-f27b0a67f65d)

![image](https://github.com/user-attachments/assets/0bafe7ec-1e39-492b-a750-494e5237e3fc)


![image](https://github.com/user-attachments/assets/837b1da9-f0c9-4210-a297-71ecd6c79ebe)


![image](https://github.com/user-attachments/assets/95df45a6-c584-4aa1-b7c4-790a4fff627f)










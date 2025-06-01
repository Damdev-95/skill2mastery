![image](https://github.com/user-attachments/assets/92268728-16b3-43e2-ad60-cd4bf4fe036f)## Hosting Static Website using S3

![image](https://github.com/user-attachments/assets/962b9c9b-a778-49f5-aa18-0a35e41f2a86)

One of the fastest way create a static websites is using S3 bucket.

## Step-by-Step: Static Website Hosting with S3

# Step 1: Create an S3 Bucket

* Go to the AWS S3 Console.
* Click "Create bucket".
* Bucket name: Must be globally unique, e.g., my-website-bucket.
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















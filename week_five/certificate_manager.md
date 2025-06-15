# AWS Certificate Manager (ACM)

**AWS Certificate Manager (ACM)** helps you easily provision, manage, and deploy SSL/TLS certificates for use with AWS services and your internal connected resources.

##  Importance of ACM

- **Secure connections** with SSL/TLS
- **Automatic renewal** of certificates
- **No extra cost** for public certificates
- **Simplified management** of HTTPS endpoints

##  How to Request a Certificate

1. **Open ACM Console**
2. Click **"Request a certificate"**
3. Choose **Public** or **Private**
4. Enter domain name(s) (e.g., `example.com`, `*.example.com`)
5. Select a **validation method**:
   - **DNS validation** (preferred)
   - **Email validation**
6. Complete validation (update DNS or respond to email)
7. ACM issues the certificate once validated

##  Usage

- Attach ACM certificates to:
  - **Elastic Load Balancers (ALB/NLB)**
  - **CloudFront distributions**
  - **API Gateway**
  - **Custom domains in AWS services**

> ACM automates SSL security at scale, reducing manual overhead and improving compliance.


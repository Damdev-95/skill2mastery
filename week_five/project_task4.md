# Welcome to Task 4

The 3-teir Application has been deployed to production via the Elatic Load balancer, However the website is **not secure**

The web application is using http, which is an high vulnerability case.

The CIO instructed that the web application should be deployed using SSL certificate.

# Solution

Since AWS Certificate Manager supports Elastic Load balancer, the will ensure the SSL certificate termination on the load balancer

* Requesting for a public certificate on AWS Certificate Manager for **scontinum.com**
  
![image](https://github.com/user-attachments/assets/714e1a06-025b-41a1-b61e-6808b6742603)

* Ensure you use a DNS Valaidation for the certificate request.

![image](https://github.com/user-attachments/assets/50f0ff0f-e2a1-4679-b0b5-edeaa08a320c)

* Chnage the listener rule on the Elastic Loadbalancer to **HTTPS** , attached the certificate and update the security group respectively

![image](https://github.com/user-attachments/assets/d5a38aba-c472-424b-837e-bdcd81106788)

* Awesome, The web application is using SSL certificate

![image](https://github.com/user-attachments/assets/4dba289c-b1ac-4b2e-b2fa-fedcba21b443)


![image](https://github.com/user-attachments/assets/feda7eeb-78f7-4956-9d37-279aa8562a79)







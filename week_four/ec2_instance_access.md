## Several Ways to connect your EC2 instance

# Putty/SSH Session

* Need Instance Key pair
* Port22 must be open
* SSH Daemon
* Terminal/CLI

# EC2 Instance Connect

* SSH Daemon
* Port 22 must be open
* Temporary keypair created by AWS
* IAM access control via policy
* This is done via Interface endpoint(Instance connect)


# Session Manager

* SSM Agent
* Agent installed by default on Amazon-linux-AMI
* IAM access control
* No ports is open
* IAM access control via policy
* VPC Endpoints for SSM: ssm, ec2messages, ssmmessages

  

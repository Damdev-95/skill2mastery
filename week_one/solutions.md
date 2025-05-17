* Explain SSH-remote extension

* Dry run
ansible-playbook -i inventory playbook.yml --check


* Ping reachability via ansible to remote hosts
ansible all -i inventory -m ping

* List tasks that will run
ansible-playbook -i inventory playbook.yml --list-tasks

* Run a playook
ansible-playbook -i inventory playook.yml


* How to install aws modules on ansible 
ansible-galaxy collection install amazon.aws




* Confirm the ansible version
 ansible --version
 image.png

* Use the python version to install boto3
pip3.10 install boto3


* Requried packages
pip install boto3 botocore

* Also ensure aws cli is installed and authenticate
aws configure
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
export AWS_REGION=your_region

* Verify installation process
ansible-doc -t module amazon.aws.ec2_instance






* Gather facts from remote hosts
ansible all -i inventory -m setup
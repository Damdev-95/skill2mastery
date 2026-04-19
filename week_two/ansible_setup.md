# Ansible Setup
- Installation(Linux terminal only)

`sudo apt install ansible`

# Inventory

- Ubuntu
  
```bash
ansible_host=
ansible_connection=ssh
ansible_user=username
ansible_user=password
ansible_ssh_private_key_file=key_name
```

- Windows

```bash
ansible_host=
ansible_connection=winrm
ansible_user=Administrator
ansible_password=YourStrongPasswordHere
ansible_winrm_server_cert_validation=ignore
ansible_port=5985
```

## Setting up ssh keys between ansible and inventory hosts

```bash
- On the ansible node
- Generate the ssk key pair
ssh-keygen -t rsa -b 4096 -f config_key
- this will create a public and private key in your working directory
config_key
config_key.pub
- copy the Public Key to your Target Ubuntu Servers
need to copy the contents of your newly generated public key (config_key.pub) to the ~/.ssh/authorized_keys file of the user on your target servers 
ssh-copy-id -i config_key.pub server_username@server-ip

- if using multipass setup, use below commad
cat config_key.pub | multipass exec <instance_name> -- bash -c "cat >> ~/.ssh/authorized_keys"

- Test connectivity using ansible
for ubuntu
ansible -i servers.ini all -m ping

for windows
ansible -i servers.ini windows_server -m win_ping
```


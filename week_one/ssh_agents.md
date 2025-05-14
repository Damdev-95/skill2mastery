## Steps to configure ssh agents

* You need to generate SSH key pair(public & private)

`ssh-keygen -t rsa -b 4096 `

```
ssh-keygen: This is the program used to create SSH key pairs.
-t rsa: This specifies the type of key to create. RSA is a widely used cryptographic algorithm for secure data transmission.
-b 4096: This sets the bit length of the key. 4096 bits is considered very strong - the higher the number, the more secure but also potentially slower to use. Common values are 2048 or 4096.

When you run this command:

You'll be prompted for a location to save the key pair (default is usually ~/.ssh/id_rsa)
You'll be asked to enter a passphrase (optional but recommended for security)
The command will generate two files:

A private key (e.g., id_rsa) that you keep secure on your local machine
A public key (e.g., id_rsa.pub) that you can place on remote servers

The public key can be safely shared and added to servers you want to access. The private key should be kept secure as it's used to prove your identity.
```

* start ssh agent and add private key

```
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

* Match keys to remote servers on /.ssh/config

```
Host web-server-1
  HostName 192.168.1.10
  User ubuntu
  IdentityFile ~/.ssh/id_rsa

Host db-server
  HostName 192.168.1.20
  User ec2-user
  IdentityFile ~/.ssh/db_key

```

* Check the ssh agent key 

`ssh-add -l`

*  Paste the Ansible server’s public key (~/.ssh/id_rsa.pub) into:

```
~/.ssh/authorized_keys
chmod 600 ~/.ssh/authorized_keys

ssh-copy-id -i ~/.ssh/id_rsa.pub username@remote-server
# Or manually:
cat ~/.ssh/id_rsa.pub | ssh username@remote-server "cat >> ~/.ssh/authorized_keys"
```

* Update variables on /etc/ansible/ansible.cfg

```
[defaults]
host_key_checking = False

[ssh_connection]
ssh_args = -o ForwardAgent=yes -o ControlMaster=auto -o ControlPersist=60s
```

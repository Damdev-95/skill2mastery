# Steps to configure ssh agents
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

* Update variables on ansible.cfg

```
[defaults]
host_key_checking = False

[ssh_connection]
ssh_args = -o ForwardAgent=yes -o ControlMaster=auto -o ControlPersist=60s
```

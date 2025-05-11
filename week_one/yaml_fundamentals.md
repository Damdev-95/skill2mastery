## YAML Basics

YAML (YAML Ain’t Markup Language) is a human-readable data serialization format often used for configuration files and data exchange between languages with different data structures.

# Why YAML?

* Clean and easy to read
* Widely used in tools like Docker, Kubernetes, Ansible, GitHub Actions, and Terraform
* Supports complex data structures: lists, maps, and nesting
* Language-agnostic

# YAML Syntax Rules

* Uses indentation for structure (spaces only, no tabs)
* Key-value pairs are separated by :
* Lists are denoted by -
* Comments start with #

## Basic Data Types

# Strings
```

name: John Doe
city: "New York"
quote: 'YAML is great!'
multiline: |
  This is a multiline string.
  Each line will be preserved.

```

# Numbers

```
age: 28
height: 5.9
```

# Booleans

* is_active: true
* is_admin: false


# Lists

```
languages:
  - Python
  - JavaScript
  - Go
```

# List of Dictionaries (Objects)

```
users:
  - name: Alice
    role: Admin
  - name: Bob
    role: User
```

# Dictionaries (Key-Value Maps)

```
database:
  host: localhost
  port: 5432
  username: admin
  password: secret
```

# Nested Structures

```
  name: myapp
  environment: production
  services:
    web:
      image: nginx:latest
      ports:
        - 80:80
    api:
      image: myapi:v1
      env:
        DEBUG: false
        API_KEY: abc123
```

# Inline Lists and Dictionaries

```
colors: [red, green, blue]
credentials: {user: admin, pass: secret}
```


**Be consistent with indentation (typically 2 or 4 spaces)******

**Strings with special characters (e.g., :) should be quoted******


**Practical Application**

# Ansible 

<img width="832" alt="image" src="https://github.com/user-attachments/assets/b17ec8ee-0a34-48f6-a3f3-7d637e6ec754" />

<img width="977" alt="image" src="https://github.com/user-attachments/assets/704ecea6-c132-413e-9905-5f64e4b41b34" />

## Bash script and Ansible

```
#!/bin/bash

if [ "$(id -u)" -eq 0 ]; then
    # Prompt for username
    read -p "Enter username: " username
    # Prompt for password
    read -s -p "Enter password for $username: " password
    echo

    # Check if user already exists
    if id "$username" &>/dev/null; then
        echo "User '$username' already exists!"
        exit 1
    fi

    # Create 'developer' group if it doesn't exist
    if ! getent group developer > /dev/null; then
        groupadd developer
        echo "Group 'developer' created."
    fi

    # Create the user with home directory, hashed password, and add to 'developer' group
    useradd -m -p "$password" -G developer "$username"

    if [ $? -eq 0 ]; then
        echo "User '$username' has been added and assigned to 'developer' group!"
    else
        echo "Failed to add user."
    fi
else
    echo "Only root can run this script."
    exit 1
fi

```

## Ansible

```
---
- name: Add a user and assign to 'developer' group
  hosts: localhost
  become: yes
  vars_prompt:
    - name: "username"
      prompt: "Enter the username"
      private: no
    - name: "password"
      prompt: "Enter the password"
      private: yes

  tasks:
    - name: Ensure 'developer' group exists
      group:
        name: developer
        state: present

    - name: Create user with hashed password and add to 'developer' group
      user:
        name: "{{ username }}"
        groups: developer
        append: yes
        state: present
        password: "{{ password }}"
        create_home: yes

    - name: Confirm user creation
      debug:
        msg: "User '{{ username }}' created and added to 'developer' group."

```

## Another Example

```
echo “nameserver 10.1.250.10” >> /etc/resolv.conf
```
## What if I want to do this on 30 servers, do i need to login to each of them ????

```
-
  name: Add DNS server to resolv.conf
  hosts: localhost
  tasks:
   - lineinfile: 
       path: /etc/resolv.conf
       line: 'nameserver 10.1.250.10'
```

```
-
  name: Run commands on virtual machines
  hosts: localhost
  tasks:
    - name: Execute command ‘date’
      command: date
    - name: Display resolv.conf contents
      command: cat/etc/resolv.conf
```

# Components
* Playbook(yaml)
* Inventory file (ini or yaml)


# Structure of Playbook

<img width="584" alt="image" src="https://github.com/user-attachments/assets/cfdb0363-ccc3-4be6-85ca-bee93cdaf56c" />

<img width="459" alt="image" src="https://github.com/user-attachments/assets/98e53dff-c988-4166-b10e-64d68d28de34" />

# Further materials for ansible

* [Ansible-for-Real-life-Automation](https://github.com/PacktPublishing/Ansible-for-Real-life-Automation)
* [Mastering-Ansible-Fourth-Edition](https://github.com/PacktPublishing/Mastering-Ansible-Fourth-Edition)
* KodeKloud

# Kubernetes Deploymnet file

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: my-app
spec:
  replicas: 2
  selector:
    matchLabels:
      app: my-app
  template:
    metadata:
      labels:
        app: my-app
    spec:
      containers:
        - name: web
          image: nginx
          ports:
            - containerPort: 80
```

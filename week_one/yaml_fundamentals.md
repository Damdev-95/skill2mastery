YAML Basics: A Practical Guide
YAML (YAML Ain’t Markup Language) is a human-readable data serialization format often used for configuration files and data exchange between languages with different data structures.

Why YAML?
Clean and easy to read

Widely used in tools like Docker, Kubernetes, Ansible, GitHub Actions, and Terraform

Supports complex data structures: lists, maps, and nesting

Language-agnostic

YAML Syntax Rules

Uses indentation for structure (spaces only, no tabs)

Key-value pairs are separated by :

Lists are denoted by -

Comments start with #

## Basic Data Types

# Strings

name: John Doe
city: "New York"
quote: 'YAML is great!'
multiline: |
  This is a multiline string.
  Each line will be preserved.


# Numbers

```
age: 28
height: 5.9
```

# Booleans

is_active: true
is_admin: false


# Lists

# languages:
  - Python
  - JavaScript
  - Go

# List of Dictionaries (Objects)

```
users:
  - name: Alice
    role: Admin
  - name: Bob
    role: User
```

Dictionaries (Key-Value Maps)
```
database:
  host: localhost
  port: 5432
  username: admin
  password: secret
```

Nested Structures
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
🧠 Advanced Features
Anchors and Aliases (Reuse Data)
yaml
Copy
Edit
defaults: &default_settings
  retries: 3
  timeout: 30

service1:
  <<: *default_settings
  endpoint: /login

service2:
  <<: *default_settings
  endpoint: /logout
Inline Lists and Dictionaries
yaml
Copy
Edit
colors: [red, green, blue]
credentials: {user: admin, pass: secret}
⚠️ Common Pitfalls
Use spaces, never tabs

Be consistent with indentation (typically 2 or 4 spaces)

Strings with special characters (e.g., :) should be quoted

✅ YAML in the Real World
Example: Kubernetes Deployment
yaml
Copy
Edit
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

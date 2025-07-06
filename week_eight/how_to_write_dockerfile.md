# Dockerfile Guide & Environment Variables

##  What is a Dockerfile?

A **Dockerfile** is a script containing instructions on how to build a Docker image. It defines:
- The base image
- Dependencies
- Files to copy
- Commands to run

---

##  Basic Dockerfile Syntax

```dockerfile
FROM <base-image>
WORKDIR <working-directory>
COPY <src> <dest>
RUN <command-to-run-at-build-time>
ENV <key>=<value>
EXPOSE <port>
CMD ["command", "arg1", "arg2"]

```

## Project Structure

webapp/
│
├── app.py
├── requirements.txt
├── Dockerfile
├── .env


# Create app.py

```
from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    message = os.getenv("APP_MESSAGE", "Hello from Docker!")
    return f"<h1>{message}</h1>"

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)

```

# Create requirements.txt
`flask`

# Create DockerFile

```dockerfile
# 1. Use official Python base image
FROM python:3.10-slim

# 2. Set the working directory inside the container
WORKDIR /app

# 3. Copy the current directory contents into the container
COPY . .

# 4. Install required Python packages
RUN pip install --no-cache-dir -r requirements.txt

# 5. Set a default environment variable (can be overridden)
ENV APP_MESSAGE="Hello from Dockerfile"

# 6. Expose the Flask port
EXPOSE 5000

# 7. Run the app
CMD ["python", "app.py"]

```

# Create .env file 

```
APP_MESSAGE=Welcome to my Dockerized Flask App!

```

# Build the Docker Image

`docker build -t flask-env-app . `

# Run the Container 

```

docker run -p 5000:5000 --env-file .env flask-env-app

docker run -p 5000:5000 -e APP_MESSAGE="Hello from Sulaiman!" flask-env-app


```

## Using Container for static webiste 

static-website/
├── index.html
└── Dockerfile

```dockerfile
# Use official nginx base image
FROM nginx:alpine

# Remove default nginx index page
RUN rm -rf /usr/share/nginx/html/*

# Copy your HTML file into the nginx public directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx (default command already set in nginx image)

```

# Build the image 

`docker build -t static-web .  `

# Run the container

`docker run -d -p 8080:80 static-web `


## Examples with Variables for database connection

```dockerfile
FROM python:3.10
WORKDIR /app
COPY . .
RUN pip install -r requirements.txt

ENV DB_HOST=localhost
ENV DB_PORT=5432

CMD ["python", "app.py"]

```

# Create the app.py
```
import os

db_host = os.getenv("DB_HOST")
db_port = os.getenv("DB_PORT")

print(f"Connecting to DB at {db_host}:{db_port}")

```

```
docker build -t connect-db-app .
docker run -e DB_HOST=prod-db -e DB_PORT=3306 connect-db-app

```

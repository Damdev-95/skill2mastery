![image](https://github.com/user-attachments/assets/13ee970f-6c03-4949-bde4-0c8531e71ba8)

# Deployment Model

* Signle Node (Running on a single EC2 instance)
* Multi Node (Running on several EC2 instance)
  
# Using CentOS as Single Node

1. Install firewalld service

```
sudo yum install -y firewalld
sudo systemctl start firewalld
sudo systemctl enable firewalld
sudo systemctl status firewalld
```
2. Install MariaDB service

```
sudo yum install -y mariadb-server
sudo vi /etc/my.cnf
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

3. Configure firewall for database

```
sudo firewall-cmd --permanent --zone=public --add-port=3306/tcp
sudo firewall-cmd --reload
```
4. Configure Dataase

```
$ mysql
MariaDB > CREATE DATABASE ecomdb;
MariaDB > CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
MariaDB > FLUSH PRIVILEGES;
```
5. Load inventory on Dataase

```
cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");

EOF
```

6. Run SQL script

`sudo mysql < db-load-script.sql`

7. Install Web Packages

```
sudo yum install -y httpd php php-mysqlnd
sudo firewall-cmd --permanent --zone=public --add-port=80/tcp
sudo firewall-cmd --reload
```

8. Change DirectoryIndex index.html to DirectoryIndex index.php to make the php page the default page

`sudo sed -i 's/index.html/index.php/g' /etc/httpd/conf/httpd.conf`

9. Run the web server
```
sudo systemctl start httpd
sudo systemctl enable httpd`
```

10. Download codebase

```
sudo yum install -y git
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
```

11. Create and configure environmnet variables

```
cat > /var/www/html/.env <<-EOF
DB_HOST=localhost
DB_USER=ecomuser
DB_PASSWORD=ecompassword
DB_NAME=ecomdb
EOF
```
12. Update the content on index.php

```
<?php
// Function to load environment variables from a .env file
function loadEnv($path)
{
    if (!file_exists($path)) {
        return false;
    }

    $lines = file($path, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (strpos(trim($line), '#') === 0) {
            continue;
        }

        list($name, $value) = explode('=', $line, 2);
        $name = trim($name);
        $value = trim($value);
        putenv(sprintf('%s=%s', $name, $value));
    }
    return true;
}

// Load environment variables from .env file
loadEnv(__DIR__ . '/.env');

// Retrieve the database connection details from environment variables
$dbHost = getenv('DB_HOST');
$dbUser = getenv('DB_USER');
$dbPassword = getenv('DB_PASSWORD');
$dbName = getenv('DB_NAME');

?>
```

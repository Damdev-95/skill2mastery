# Deploying the E-Commerce Application on Ubuntu Server (Single Node Deployment)

This guide explains how to deploy the e-commerce application on an Ubuntu Server using a single-node architecture where the database and web server run on the same server.

- Step 1 : Update package services
```
sudo apt update && sudo apt upgrade -y
```

- Step 2 : Install MariaDB Database Server

```bash
sudo apt install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
```

- Step 3: Configure Database

```bash
sudo mysql
#Run the sql commands
MariaDB > CREATE DATABASE ecomdb;
MariaDB > CREATE USER 'ecomuser'@'localhost' IDENTIFIED BY 'ecompassword';
MariaDB > GRANT ALL PRIVILEGES ON *.* TO 'ecomuser'@'localhost';
MariaDB > FLUSH PRIVILEGES;
```

- Step 4: Load inventory data

```bash
cat > db-load-script.sql <<-EOF
USE ecomdb;
CREATE TABLE products (id mediumint(8) unsigned NOT NULL auto_increment,Name varchar(255) default NULL,Price varchar(255) default NULL, ImageUrl varchar(255) default NULL,PRIMARY KEY (id)) AUTO_INCREMENT=1;

INSERT INTO products (Name,Price,ImageUrl) VALUES ("Laptop","100","c-1.png"),("Drone","200","c-2.png"),("VR","300","c-3.png"),("Tablet","50","c-5.png"),("Watch","90","c-6.png"),("Phone Covers","20","c-7.png"),("Phone","80","c-8.png"),("Laptop","150","c-4.png");

EOF
```

- Step 5: Run the sql script

```bash
sudo mysql < db-load-script.sql
```

- Step 6: Install Apache and PHP packages

```bash
sudo apt install apache2 php libapache2-mod-php php-mysql git -y
```

- Step 7: Change default index file from index.html to index.php.

```bash
sudo nano /etc/apache2/mods-enabled/dir.conf
```
change from 

`DirectoryIndex index.html index.cgi index.pl index.xhtml index.htm`

to this

`DirectoryIndex index.php index.html index.cgi index.pl index.xhtml index.htm`

- Step 8: Download the application code 

```
sudo git clone https://github.com/kodekloudhub/learning-app-ecommerce.git /var/www/html/
```

Ensure all the codease in inside the html folder as below 

<img width="1022" height="373" alt="image" src="https://github.com/user-attachments/assets/07b5b3fb-dcbd-4bb8-abb5-659413c1103c" />

- Step 9: Create and configure environment variables inside

```bash
cd /var/www/html
sudo nano .env
DB_HOST=localhost
DB_USER=ecomuser
DB_PASSWORD=ecompassword
DB_NAME=ecomdb
```

- Step 10: Update the content of the index.php file to get the env variables

```php
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
```
<img width="1792" height="992" alt="image" src="https://github.com/user-attachments/assets/dc5ea0a1-f05e-40f3-a562-52fc16b55c60" />


- Step 10: Set permissions to the html folder

```bash
sudo chmod -R 755 /var/www/html
```

- Step 11: Restart the Apache2 service

`sudo systemctl restart apache2`

- Checkout the application webiste

<img width="1833" height="1112" alt="image" src="https://github.com/user-attachments/assets/73924797-deb2-4ca8-94db-c9aa871cc661" />


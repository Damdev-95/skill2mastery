# Week 1 projects(Bash Scriting)

### EXERCISE 1: File & Directory Management

#### Question:
Create a directory structure for a project and organize script files:
- Create a directory `project` with subdirectories: `src`, `bin`, and `docs`.
- Move all `.sh` files from the current directory to `project/src`.
- List all files in `project` recursively.

#### Solution:
```bash
mkdir -p project/{src,bin,docs}
mv *.sh project/src/
ls -R project
```

---

### EXERCISE 2: User & Group Management Script

#### Question:
Write a bash script that:
- Reads usernames from a `users.txt` file (one per line).
- Creates each user (if not already existing).
- Adds them to the `developers` group.
- Sets a default password `changeme123` and enforces password expiry in 10 days.

#### Solution:
```bash
#!/bin/bash

GROUP="developers"
PASSWORD="changeme123"

# Ensure group exists
if ! getent group "$GROUP" > /dev/null; then
    sudo groupadd "$GROUP"
fi

while IFS= read -r USERNAME; do
    if ! getent passwd "$USERNAME" > /dev/null; then
        sudo useradd -m -G "$GROUP" -s /bin/bash "$USERNAME"
        echo "$USERNAME:$PASSWORD" | sudo chpasswd
        sudo passwd -x 10 "$USERNAME"
        echo "User $USERNAME created."
    else
        echo "User $USERNAME already exists."
    fi
done < users.txt
```

---

### EXERCISE 3: Log File Analyzer

#### Question:
Analyze `/var/log/auth.log` to:
- Count the number of occurrences of each IP address.
- Display the top 5 IPs with the most login attempts.
- Filter and show only successful login attempts.

#### Solution:
```bash
# Count IPs
grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}" /var/log/auth.log | \
    sort | uniq -c | sort -nr | head -5

# Show successful logins
grep "Accepted password" /var/log/auth.log
```

---

### EXERCISE 4: Backup Script

#### Question:
Create a bash script that:
- Takes a directory as input.
- Compresses it into a `tar.gz` file named `backup-YYYYMMDD-HHMMSS.tar.gz`.
- Stores it in a `backups` directory.

#### Solution:
```bash
#!/bin/bash

SOURCE_DIR=$1
BACKUP_DIR=backups
TIMESTAMP=$(date +"%Y%m%d-%H%M%S")

mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/backup-$TIMESTAMP.tar.gz" "$SOURCE_DIR"
echo "Backup of $SOURCE_DIR created at $BACKUP_DIR/backup-$TIMESTAMP.tar.gz"
```

---

### EXERCISE 5: Process and Disk Monitoring

#### Question:
Write a script to:
- Display top 5 processes by memory usage.
- Show disk usage of all mounted filesystems.
- Print a warning if any partition usage exceeds 80%.

#### Solution:
```bash
#!/bin/bash

# Top 5 memory-consuming processes
echo "Top 5 memory-consuming processes:"
ps aux --sort=-%mem | head -6

# Disk usage
echo -e "\nDisk usage:"
df -h

# Warning for usage > 80%
echo -e "\nChecking for disk usage > 80%..."
df -h | awk 'NR>1 { if ($5+0 > 80) print "Warning: " $1 " is " $5 " full!" }'

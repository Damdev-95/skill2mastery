#!/bin/bash

sys_admin_file="sys-admin.csv"
PASSWORD="Password123"
 

groupadd sys-admin >/dev/null 

while IFS= read -r USER; do
    userdel "$USER"
    echo "$USER:$PASSWORD" | chpasswd
    usermod -aG sys-admin "$USER"
    echo "$USER has been added to group sys-admin"
done < "$sys_admin_file"

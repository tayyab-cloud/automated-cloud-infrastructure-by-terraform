#!/bin/bash
apt-get update -y
apt-get install -y apache2
systemctl start apache2
systemctl enable apache2

# Niche wali line ghaur se dekho
echo "<h1>Welcome to Server ${server_id} via Terraform</h1>" > /var/www/html/index.html
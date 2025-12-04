#!/bin/bash
apt-get update -y
apt-get install -y apache2 unzip 

# --- AWS CLI v2 Installation ---
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
./aws/install
# -------------------------------

systemctl start apache2
systemctl enable apache2
echo "<h1>Welcome to Server Number: ${server_id}</h1>" > /var/www/html/index.html
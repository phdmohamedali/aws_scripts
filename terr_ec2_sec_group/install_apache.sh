#! /bin/bash
sudo su
yum update -y
yum install -y httpd.x86_64
systemctl start httpd.service
systemctl enable httpd.service
echo "<h1>Deployed via Terraform Instance $(hostname -f)</h1>" > /var/www/html/index.html
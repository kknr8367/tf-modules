#!/bin/bash

sudo yum update -y

sudo yum install -y httpd

sudo systemctl start httpd

sudo systemctl enable httpd

sudo yum install -y mysql

# Write a configuration file for your application with the RDS endpoint and credentials.
# NOTE: While this is a simple example, storing credentials directly in a script is
# not a production best practice. For a more secure approach, use AWS Secrets Manager
# or Parameter Store and retrieve the values at runtime.
echo "DB_HOST=${rds_endpoint}" | sudo tee /etc/webapp/database.conf > /dev/null
echo "DB_USER=${rds_username}" | sudo tee -a /etc/webapp/database.conf > /dev/null
echo "DB_PASSWORD=${rds_password}" | sudo tee -a /etc/webapp/database.conf > /dev/null

echo "<html><h1>Hello, Apache on RHEL 8!</h1><p>Connected to database at: ${rds_endpoint}</p></html>" | sudo tee /var/www/html/index.html > /dev/null

sudo chown -R apache:apache /var/www/html

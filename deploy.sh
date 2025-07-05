#!/bin/bash

# Set variables
EC2_USER=ubuntu              # Or ec2-user, depending on your AMI
EC2_IP=13.204.63.132
KEY_PATH=./shyamsanjaysagane.pem       # Replace with actual private key file path

# Upload HTML file
scp -i $KEY_PATH -o StrictHostKeyChecking=no *.html $EC2_USER@$EC2_IP:/tmp/

# Move file to /var/www/html using SSH
ssh -i $KEY_PATH -o StrictHostKeyChecking=no $EC2_USER@$EC2_IP << 'EOF'
    git clone https://github.com/sssagane/Production-failure.git
    sudo ./replace_nginx_default.sh
    sudo systemctl restart nginx
EOF

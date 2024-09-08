#/bin/bash
sudo yum install nodejs -y

## Navigate to application Directory 
cd /home/ec2-user/node-app

## Initialize a Node.js project
npm init -y

#Install NodeJS dependencies
npm install express

#/bin/bash

mkdir -p /home/ec2-user/node-app
## Navigate to application Directory
cd /home/ec2-user/node-app

## Initialize a Node.js project
npm init -y

#Install NodeJS dependencies
npm install express

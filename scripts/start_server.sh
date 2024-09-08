#!/bin/bash
# Navigate to the app directory 
cd /home/ec2-user/node-app

# Start the Node.js application using PM2 (recommended over background process handling)
pm2 start index.js --name "node-app"
pm2 save
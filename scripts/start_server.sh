#!/bin/bash
# Navigate to the app directory 
cd /home/ec2-user/node-app

## Start the node.js application in background 
node index.js > app.out.log 2> app.err.log < /dev/null &
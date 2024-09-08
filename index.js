// index.js
const express = require('express');
const os = require('os');  // Import os module to get the hostname (instance ID)

const app = express();
const port = 3000;

// Health check routee
app.get('/health', (req, res) => {
    res.status(200).send('OK');
});



// Get instance hostname, typically the EC2 instance ID
const instanceId = os.hostname();

app.get('/', (req, res) => {
    res.send(`<h1>Welcome to My Fancy Node.js Web Application!</h1>
              <p>This application is served using AWS, Jenkins, and CodeDeploy.</p>
              <p>Served by instance: ${instanceId}</p>`);
});

app.listen(port, () => {
    console.log(`App is listening at http://localhost:${port}`);
});

const express = require('express');
const { exec } = require('child_process');
const fs = require('fs');

const app = express();
const port = 3000;

// serve the index.html file
app.get('/', (req, res) => {
  fs.readFile('index.html', 'utf8', (err, data) => {
    if (err) {
      console.error('Error reading index.html:', err);
      res.sendStatus(500);
    } else {
      res.send(data);
    }
  });
});

// respond with script execution
app.get('/command/:id/:var1/', (req, res) => {
  console.log(req.params)
  const shellScript = `gpio_command.sh -n ${req.params['id']} -1 ${req.params['var1']}`;

  exec(`sh ${shellScript}`, (error, stdout, stderr) => {
    if (error) {
      console.error('error: ', error);
      res.sendStatus(500);
    } else {
      console.log(shellScript);
      res.sendStatus(200);
    }
  });
});

// respond with data
app.get('/read/:id', (req, res) => {
  console.log(req.params)
  fs.readFile('/sys/class/thermal/thermal_zone0/temp', 'utf8', (err, data) => {
    res.send(data)
    console.log(data)
  });
});

// start the server
app.listen(port, () => {
  console.log(`Server running on port ${port}`);
});
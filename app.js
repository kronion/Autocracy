var express = require('express');
var app = express();

var fs = require('fs');

var secret = fs.readFileSync('secret', 'utf8');
var privateKey = fs.readFileSync('server.key', 'utf8');
var certificate = fs.readFileSync('server.crt', 'utf8');

var https = require('https');
var credentials = {
  key: privateKey,
  cert: certificate
};

var command = "PRAISE HELIX!";

app.get("/:secret:/command", function(req, res) {
  if (req.params.secret === secret) {
    command = req.params.command;
  }
  else {
    res.send("Nope!");
  }
});

app.get("/orders", function(req, res) {
  res.send(command);
});

var httpsServer = https.createServer(credentials, app);
httpsServer.listen(9001);

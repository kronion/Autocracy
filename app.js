var express = require('express');
var app = express();

var fs = require('fs');

var secret = fs.readFileSync('secret');
var privateKey = fs.readFileSync('server.key', 'utf8');
var certificate = fs.readFileSync('server.crt', 'utf8');

var https = require('https');
var credentials = {
  key: privateKey,
  cert: certificate
};

var command = "PRAISE HELIX!";

app.get("/:secret", function(req, res) {
  if (req.params.secret === secret) {
    res.send(command);
  }
});

https.createServer(app, credentials);
https.listen(9001);

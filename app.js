var express = require('express');
var app = express();

var fs = require('fs');

var https = require('https');
https.createServer(app, credentials);

var secret = fs.readFileSync('secret');

var command = "PRAISE HELIX!";

app.get("/:secret", function(req, res) {
  if (req.params.secret === secret) {
    res.send(command);
  }
});
https.listen(1337);

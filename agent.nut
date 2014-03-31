// Log the URLs we need
server.log("Get controller command: " + http.agenturl() + "?command=get");
 
local master = "Praise helix!";
device.on("command", function(command) {
  master = command;
  server.log("Command is " + master);
});
 
function requestHandler(request, response) {
  try {
    // check if the user sent led as a query parameter
    if ("command" in request.query) {
      response.send(200, master);
    }
      
    // send a response back saying everything was OK.
    response.send(200, "OK");
  } catch (ex) {
    response.send(500, "Internal Server Error: " + ex);
  }
}
 
// register the HTTP handler
http.onrequest(requestHandler);

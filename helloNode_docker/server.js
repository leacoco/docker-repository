var http = require('http');
var handleRequest = function(request, response) {
  response.writeHead(200);
  response.end("Hello Mr. Leadel Ngalame");
}

var www = http.createServer(handleRequest);
www.listen(5000);

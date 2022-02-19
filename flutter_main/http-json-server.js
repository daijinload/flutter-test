const http = require('http');

const hostname = '127.0.0.1';
const port = 8090;

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'application/json');
  res.end('{"name":"hello"}\n');
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
  console.log(`curl 'http://127.0.0.1:8090/'`);
});

const http = require('http');
const fs = require('fs').promises;
const hostname = '127.0.0.1';
const port = 8090;

const server = http.createServer(async (req, res) => {
  // 下記URLのみ、wasmを返す。
  if (req.url === '/wasm') {
    const fPath = '/home/ahashi/src/git/flutter-test/flutter_main/assets/images/aaa.wasm'
    // const file = await fs.readFile(fPath, "binary")
    const file = await fs.readFile(fPath)
    res.statusCode = 200;
    res.setHeader('Content-Type', 'application/wasm');
    res.end(file);
  } else {
    res.statusCode = 200;
    res.setHeader('Content-Type', 'application/json');
    res.end('{"name":"hello"}');
  }
});

server.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
  console.log(`curl 'http://127.0.0.1:8090/'`);
  console.log(`curl 'http://127.0.0.1:8090/wasm'`);
});

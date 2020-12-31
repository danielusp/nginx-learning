const http = require('http');
const PORT = 3000;

const requestListener = (req, res) => {
    res.writeHead(200);
    res.end(`You\'re at ${process.env.APPID} server, PORT ${process.env.EXT_PORT}!`);
};

const server = http.createServer(requestListener);
server.listen(PORT);